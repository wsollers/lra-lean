# lra-lean

Lean 4 proof formalization for the **Learning Real Analysis** project.

This repo was extracted from `Learning-Real-Analysis/lean/`.

## Structure

```
lakefile.lean       — Lake build configuration
lean-toolchain      — Lean 4 version pin
LRA/                — Lean source modules
  VolumeI/
  VolumeII/
```

## Building

Docker is the reproducible default used by CI and the local wrappers:

```bash
docker build -t lra-lean .
docker run --rm -v "$PWD:/workspace" -w /workspace lra-lean lake build
```

On Windows:

```powershell
.\build.ps1 docker-build
.\build.ps1 build
```

Native builds are allowed when the pinned `lean-toolchain` is installed:

```bash
lake build LRAVolumeI LRAVolumeII LRAVolumeIII LRAVolumeIV LRAVolumeVI LRAVolumeVII LRATests
```

Production Lean modules live under `LRA/`. Build-gated smoke and regression
checks live under `test/` and are built through `LRATests`.

## Blueprint

The Blueprint toolchain is containerized separately from the Lean build image:

```powershell
.\build.ps1 docker-blueprint-build
.\build.ps1 blueprint
```

`.\build.ps1 blueprint-existing` compiles PDF and web output from an existing
`blueprint/src/generated-number-systems.tex` when `docs/number-systems` is not
available in the checkout.

## Relationship to monorepo

This repo is a standalone Lean workspace. The monorepo (`Learning-Real-Analysis`) references it for context but does not build it. Lean files live here and only here.
