"""
Checks whether sum(initial_conditions) == 1 and if all parameter values are < 1.
Otherwise gives out an warning.
"""
function check_arguments(u,p)
    sum_u = sum(u)
    if !(sum_u==1.0)
        println("Warning: The sum of all initial values is $(sum_u), but needs to be 1.0.")
    end
    
    for i in p
        if i > 1
            println("Warning: The parameter value p[$(i)] = $(p[i]) is > 1 $(i).")
            return nothing
        end
    end
end 