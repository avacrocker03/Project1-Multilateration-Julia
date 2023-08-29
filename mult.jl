#=
 = Author: Ava Crocker, acrocker2021@,my.fit.edu
 = Author: Taylor Carlson, tcarlson2021@my.fit.edu
 = Course: CSE 4250, Fall 2023
 = Project: 
 = Implementation: 
=#

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

    for i in range(0,1)
        time = readline()
        if (i == 0)
            timeStr = split(time, " ")
            push!(times, (strToFloat(timeStr)*10^-9))
        end
        if (i == 1)
            timeStr1 = split(time, " ")
            push!(times, (strToFloat(timeStr1)*10^-9))
        end
    end

    ri = distance(times[1][1])
    rj = distance(times[1][2])
    rk = distance(times[1][3])
    rl = distance(times[1][4])

    xi = satellites[1][1]
    yi = satellites[1][2]
    xj = satellites[2][1]
    yj = satellites[2][2]
    xk = satellites[3][1]
    yk = satellites[3][2]
    xl = satellites[4][1]
    yl = satellites[4][2]
    

    a = xCombo(ri,rk,ri,rj,xj,xi,xk,xi)/xCombo(ri,rj,ri,rk,yk,yi,yj,yi) # XijyA = Xikx
    b = xCombo(ri, rk, ri, rj, zj, zi, zk, zi)/xCombo(ri,rj,ri,rk,yk,yi,yj,yi) # XijyB = Xikz
    c = xCombo(rk, rl, rk, rj, xj, xk, xl, xk)/xCombo(rk, rj, rk, rl, yl, yk, yj, yk) # XkjyC = Xklx
    d = xCombo(rk, rl, rk, rj, zj, zk, zl, zk)/xCombo(rk, rj, rk, rl, yl, yk, yj, yk) # XkjyD = Xklz
    g = (d-b)/(a-c)
    println(a)
    println(b)
    println(c)
    println(d)
    println(g)
    println()
    println(satellites)
    println()
    println(times)
    println()
    println("g= ",g , ",h= ,j= ,m= ,o= ")
    println("+) x= , y= , z= ")
    println("-) x= , y= , z= ")
end

main()
