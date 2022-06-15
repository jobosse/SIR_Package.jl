module SIR_package

    include("functions/ODEProblems.jl")
    include("functions/plots.jl")
    
    export SIR_model
    export plot_I_vs_S
    export plot_I_vs_Time

    function __init__()
        nothing
    end
end
