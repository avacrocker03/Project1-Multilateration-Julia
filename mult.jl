#=
 = Author: Ava Crocker, acrocker2021@,my.fit.edu
 = Author: Taylor Carlson, tcarlson2021@my.fit.edu
 = Course: CSE 4250, Fall 2023
 = Project: 
 = Implementation: 
=#

satellites = []
# sat1 = []
# sat2 = []
# sat3 = []
# sat4 = []
println("Enter Satellite & Timing: ")
for i in range(0,3)
    data = readline()
    if (i == 0)
        data = split(data, " ")
        push!(satellites, data)
    end
    if (i == 1)
        data1 = split(data, " ")
        push!(satellites, data1)
    end
    if (i == 2)
        data2 = split(data, " ")
        push!(satellites, data2)
    end
    if (i == 3)
        data3 = split(data, " ")
        push!(satellites, data3)
    end
end
times = []

for i in range(0,1)
    time = readline()
    if (i == 0)
        time = split(time, " ")
        push!(times, time)
    end
    if (i == 1)
        time1 = split(time, " ")
        push!(times, time1)
    end
end

#satellites = parse(Float64, satellitesStr)
println()
println(satellites)
println()
println(times)
println()

println("g= ,h= ,j= ,m= ,o= ")
println("+) x= , y= , z= ")
println("-) x= , y= , z= ")

