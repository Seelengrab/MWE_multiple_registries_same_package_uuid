println(Base.DEPOT_PATH)

import Pkg

p1 = joinpath(@__DIR__, "registry1_copy")
p2 = joinpath(@__DIR__, "registry2_copy")
rm(p1; force = true, recursive = true)
rm(p2; force = true, recursive = true)
cp(joinpath(@__DIR__, "registry1"), p1; force = true)
cp(joinpath(@__DIR__, "registry2"), p2; force = true)
Pkg.Registry.add(Pkg.RegistrySpec(path = p1))
Pkg.Registry.add(Pkg.RegistrySpec(path = p2))
Pkg.add(Pkg.PackageSpec(name = "Example", uuid = "7876af07-990d-54b4-ab0e-23690620f79a"))
