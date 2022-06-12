using SIR_package
using Documenter

DocMeta.setdocmeta!(SIR_package, :DocTestSetup, :(using SIR_package); recursive=true)

makedocs(;
    modules=[SIR_package],
    authors="Johannes Bosse  <johannes.bosse@rwth-aachen.de>",
    repo="https://github.com/jobosse/SIR_package.jl/blob/{commit}{path}#{line}",
    sitename="SIR_package.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
