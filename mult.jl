#=
 = Author: Ava Crocker, acrocker2021@,my.fit.edu
 = Author: Taylor Carlson, tcarlson2021@my.fit.edu
 = Course: CSE 4250, Fall 2023
 = Project: 
 = Implementation:
=#

satellites = Dict()
sat1 = Dict()
sat2 = Dict()
sat3 = Dict()
sat4 = Dict()
print("Enter Satellite & Timing: ")
for i in range(0,3)
    if(i == 0)
        satellites['1'] = readline()
    elseif (i == 1)
        satellites['2'] = readline()
    end
    # for j in range(0,2)
    #     if(i == 0)
    #         sat1['x'] = readline()
    #         sat1['y'] = readline()
    #         sat1['z'] = readline()
    #     end
    # end
end

println(sat1)