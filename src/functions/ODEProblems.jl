using DifferentialEquations
include("helper.jl")

"""
Integrates the dynamical system of the simple SIR model in the absence of demography (births and deaths)
SIR_model(u=[0.99, 0.01, 0], p=[0.35, 0.035], T=100.0)

Parameters
----------
u: array, contains initial conditions of S,I,R in that order
p: array, contains the transmission rate β and the recovery γ in that order
T: float64, end time of the integration. Integration always start at t=0.0

Returns
-------
Solved_ODEProblem using solve() method of DifferentialEquations.jl

 -> Solved ODEProblem of type solve().
S, I, R = u
β, γ = p
"""



function SIR_model(u=[0.99, 0.01, 0], p=[0.35, 0.035], T=100.0)
    
    check_arguments(u,p)
    function SIR_rhs!(du, u, p, t)
        S, I, R = u
        β, γ = p
        print(β)
        du[1] = -β * S * I
        du[2] = β*I*S - γ*I
        du[3] = γ*I
        return du
    end

    # Integrate the dynamical system
    ds = ODEProblem(SIR_rhs!, u, (0.0, T), p)
    sol = solve(ds)
    return sol
end
    
