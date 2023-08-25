#=
 = Author: Ava Crocker, acrocker2021@,my.fit.edu
 = Author: Taylor Carlson, tcarlson2021@my.fit.edu
 = Course: CSE 4250, Fall 2023
 = Project: 
 = Implementation: 
=#

satellites = []
sat1 = []
sat2 = []
sat3 = []
sat4 = []
println("Enter Satellite & Timing: ")
for i in range(0,3)
    data = readline()
    if (i == 0)
        data = split(data, " ")
    end
    push!(satellites, data)
    
end



#satellites = parse(Float64, satellitesStr)
println(satellites)