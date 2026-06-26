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
.\build.ps1 build-all
```

Native builds are allowed when the pinned `lean-toolchain` is installed:

```bash
lake build
```

## Relationship to monorepo

This repo is a standalone Lean workspace. The monorepo (`Learning-Real-Analysis`) references it for context but does not build it. Lean files live here and only here.
