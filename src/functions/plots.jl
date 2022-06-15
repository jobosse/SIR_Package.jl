using CairoMakie

"""
Plot phase space of I(Infected) vs S(Suceptible). The log of voth variables is plotted.

Parameters
----------
Solved_ODEProblem: object of type solve() from DifferentialEquations.jl, output of any of the functions
                     defined in ODEProblems.jl of this module
"""
function plot_I_vs_S(Solved_ODEProblem)
    # Integrate the ODEProblem
    sol = Solved_ODEProblem

    # Plotting
    S = sol[1, :]
    I = sol[3, :]
    fig = Figure(resolution = (1200, 600))
    ax2 = Axis(fig[1, 2], xlabel = "-log(S)", ylabel = "-log(I)", title = "Phase Portrait for SIR Model")
    lines!(ax2, -1 * log.(S), -1 * log.(I), linewidth = 3)
    fig
end

"""
Plot phase space of I(Infected) vs Time. 

Parameters
----------
Solved_ODEProblem: object of type solve() from DifferentialEquations.jl, output of any of the functions
                     defined in ODEProblems.jl of this module
"""
function plot_I_vs_Time(Solved)
    # Integrate the ODEProblem
    sol = Solved_ODEProblem

    #Plotting
    I = sol[3, :]
    fig = Figure(resolution = (1200, 600))
    ax1 = Axis(fig[1, 1], xlabel = "t", ylabel = "-log(I)", title = "Infected over time for SIR Model")
    lines!(ax1, sol.t, -1 * log.(I), linewidth = 3)
    fig
end
