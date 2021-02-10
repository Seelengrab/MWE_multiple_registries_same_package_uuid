## Step 1

Run the following line in `bash`:
```bash
export JULIA_DEPOT_PATH=$(mktemp -d)
```

## Step 2

Open Julia and run the following lines:

```julia
julia> Base.DEPOT_PATH

julia> import Pkg

julia> rm("registry1_copy"; force = true, recursive = true)

julia> rm("registry2_copy"; force = true, recursive = true)

julia> cp("registry1", "registry1_copy"; force = true)

julia> cp("registry2", "registry2_copy"; force = true)

julia> Pkg.Registry.add(Pkg.RegistrySpec(path = "registry1_copy"))

julia> Pkg.Registry.add(Pkg.RegistrySpec(path = "registry2_copy"))

julia> Pkg.add(Pkg.PackageSpec(name = "Example", uuid = "7876af07-990d-54b4-ab0e-23690620f79a"))
```

---

## Note

Instead of doing `export JULIA_DEPOT_PATH=$(mktemp -d)`, you could instead do this in `bash`:
```bash
rm -rf ~/.julia
```

But most people will probably prefer to do `export JULIA_DEPOT_PATH=$(mktemp -d)`.
