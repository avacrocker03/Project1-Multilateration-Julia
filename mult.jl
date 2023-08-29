#=
 = Author: Ava Crocker, acrocker2021@,my.fit.edu
 = Author: Taylor Carlson, tcarlson2021@my.fit.edu
 = Course: CSE 4250, Fall 2023
 = Project: Multilateration in Julia - locate 3D object in space
 = Implementation: 
=#

#=
= Citations:
= https://www.geeksforgeeks.org/julia-language-introduction/
= https://docs.julialang.org/en/v1/
= https://docs.julialang.org/en/v1/stdlib/Printf/
= above links contributed to the understanding and learning of the 
= Julia syntax and documentation
=#

using Printf

function strToFloat(dataStr)
    # converting string input to float
    floatData = []
    for str in dataStr # iterating through input 
        str = parse(Float64, str) # parsing data to float
        push!(floatData, str) # adding to new array of floats
    end
    return floatData
end

function distance(time)
    # calculating the distance from the satellite to the target (ie. Ri,Rj,Rk,Rl)
    c = 299792458 # speed of light (seconds)
    r = c*time
    return r
end

function coordDiff(coord1, coord2)
    # calculating difference of satellite coordinates (ie. xij, yjk, etc.)
    coordD = coord1 - coord2
    return coordD
end

function rDiff(r1,r2)
    # calculating difference of R values (ie. Rij, Rjk, etc.)
    rd = r1 - r2
    return rd
end

function xCombo(r1,r2,r3,r4,c1,c2,c3,c4)
    # calculating the difference of the products of R*y values (ie. Xijy, Xikx, etc.)
    xC = (rDiff(r1,r2)*coordDiff(c1,c2)) - (rDiff(r3,r4)*coordDiff(c3,c4))
    return xC
end

function sEqn(x,y,z)
    # calculating product of coords squared (ie. Si2, Sj2, etc.)
    s = x^2 + y^2 + z^2
    return s
end

function rcCombo(r1,r2,x1,x2,y1,y2,z1,z2)
    # calculating the sum of R diff values squared and the difference of S values (ie. Rij2xyz, Rik2xyz, etc.)
    rxyz = (rDiff(r1,r2)^2) + sEqn(x1,y1,z1) - sEqn(x2,y2,z2)
    return rxyz
end

function output(g,h,j,m,o,x1,x2,y1,y2,z1,z2,r1,r2)
    # correctly formatting output & converting values to rounded scientific notation
    @printf("g= %.2e, h= %.2e, j= %.2e, m= %.2e, o= %.2e\n",g,h,j,m,o)
    @printf("+) x= %.0f, y= %.0f, z= %.0f, r= %.0f\n", x1, y1, z1, r1)
    @printf("-) x= %.0f, y= %.0f, z= %.0f, r= %.0f\n", x2, y2, z2, r2)
end

function main()
    satellites = []
    println("Enter Satellite & Timing: ")
    for i in range(0,3)
        data = readline()
        if (i == 0)
            dataStr = split(data, " ")
            push!(satellites, strToFloat(dataStr))
        end
        if (i == 1)
            dataStr1 = split(data, " ")
            push!(satellites, strToFloat(dataStr1))
        end
        if (i == 2)
            dataStr2 = split(data, " ")
            push!(satellites, strToFloat(dataStr2))
        end
        if (i == 3)
            dataStr3 = split(data, " ")
            push!(satellites, strToFloat(dataStr3))
        end
    end
    times = []

    while true
        time = readline()
        if isempty(time)
            break
        end
        timeStr = split(time, " ")
        push!(times, (strToFloat(timeStr)*10^-9))
    end

    for i in range(1,length(times))
        ri = distance(times[i][1])
        rj = distance(times[i][2])
        rk = distance(times[i][3])
        rl = distance(times[i][4])
    
        xi = satellites[1][1]
        yi = satellites[1][2]
        xj = satellites[2][1]
        yj = satellites[2][2]
        xk = satellites[3][1]
        yk = satellites[3][2]
        xl = satellites[4][1]
        yl = satellites[4][2]
        zi = satellites[1][3]
        zj = satellites[2][3]
        zk = satellites[3][3]
        zl = satellites[4][3]
        
        a = xCombo(ri,rk,ri,rj,xj,xi,xk,xi)/xCombo(ri,rj,ri,rk,yk,yi,yj,yi) # XijyA = Xikx
        b = xCombo(ri, rk, ri, rj, zj, zi, zk, zi)/xCombo(ri,rj,ri,rk,yk,yi,yj,yi) # XijyB = Xikz
        c = xCombo(rk, rl, rk, rj, xj, xk, xl, xk)/xCombo(rk, rj, rk, rl, yl, yk, yj, yk) # XkjyC = Xklx
        d = xCombo(rk, rl, rk, rj, zj, zk, zl, zk)/xCombo(rk, rj, rk, rl, yl, yk, yj, yk) # XkjyD = Xklz
        e = ((rDiff(ri, rk) * rcCombo(ri, rj, xi, xj, yi, yj, zi, zj)) - (rDiff(ri, rj) * rcCombo(ri, rk, xi, xk, yi, yk, zi, zk))) / (2 * xCombo(ri, rj, ri, rk, yk, yi, yj, yi)) # 2XijyE = RikRij2xyz - RijRik2xyz
        f = ((rDiff(rk, rl) * rcCombo(rk, rj, xk, xj, yk, yj, zk, zj)) - (rDiff(rk, rj) * rcCombo(rk, rl, xk, xl, yk, yl, zk, zl))) / (2 * xCombo(rk, rj, rk, rl, yl, yk, yj, yk)) # 2XkjyF = RklRkj2xyz - RkjRkl2xyz
        g = (d-b)/(a-c)
        h = (f-e)/(a-c)
        i = (a*g) + b
        j = (a*h) + e
        k = rcCombo(ri, rk, xi, xk, yi, yk, zi, zk) + (2*coordDiff(xk, xi)*h) + (2*coordDiff(yk, yi)*j)
        l = 2*((coordDiff(xk, xi) * g) + (coordDiff(yk,yi) * i) + (coordDiff(zk, zi)))
        m = 4 * (rDiff(ri, rk)^2) * (g^2 + i^2 + 1) - l^2
        n = 8 * (rDiff(ri, rk)^2) * ((g *(xi - h)) + (i*(yi-j)) + zi) + (2*l*k)
        o = 4 * (rDiff(ri, rk)^2) * ((xi - h)^2 + (yi-j)^2 + zi^2) - k^2
        q = n + sign(n) * sqrt(n^2 - (4*m*o))
        z1 =   q/(2*m)
        x1 = (g*z1) + h
        y1 = (i*z1) + j
        z2 = abs(((2*o)/q) - 2)
        x2 = abs((g*z2) + h)
        y2 = ((i*z2) + j)
        output(g,h,j,m,o,x1,x2,y1,y2,z1,z2,0,0)
    end
end

main()
