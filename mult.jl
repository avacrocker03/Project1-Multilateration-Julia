#=
 = Author: Ava Crocker, acrocker2021@,my.fit.edu
 = Author: Taylor Carlson, tcarlson2021@my.fit.edu
 = Course: CSE 4250, Fall 2023
 = Project: 
 = Implementation: 
=#

function strToFloat(dataStr)
    floatData = []
    for str in dataStr
        str = parse(Float64, str)
        push!(floatData, str)
    end
    return floatData
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
            push!(times, strToFloat(timeStr))
        end
        if (i == 1)
            timeStr1 = split(time, " ")
            push!(times, strToFloat(timeStr1))
        end
    end

    println()
    println(times)
    println()
    println("g= ,h= ,j= ,m= ,o= ")
    println("+) x= , y= , z= ")
    println("-) x= , y= , z= ")

    xi = satellites[1][1]
    yi = satellites[1][2]
    xj = satellites[2][1]
    yj = satellites[2][2]
    xk = satellites[3][1]
    yk = satellites[3][2]
    xl = satellites[4][1]
    yl = satellites[4][2]

    xji = satellites[2][1] - satellites[1][1]
    xki = satellites[3][1] - satellites[1][1]
    xjk = satellites[2][1] - satellites[3][1]
    xlk = satellites[4][1] - satellites[3][1]
    yki = satellites[3][2] - satellites[1][2]
    yji = satellites[2][2] - satellites[1][2]
    ylk = satellites[4][2] - satellites[3][2]
    yjk = satellites[2][2] - satellites[3][2]
    zji = satellites[2][3] - satellites[1][3]
    zki = satellites[3][3] - satellites[1][3]
    zjk = satellites[2][3] - satellites[3][3]
    zlk = satellites[4][3] - satellites[3][3]
end

main()
