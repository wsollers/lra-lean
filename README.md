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

```bash
lake build
```

## Relationship to monorepo

This repo is a standalone Lean workspace. The monorepo (`Learning-Real-Analysis`) references it for context but does not build it. Lean files live here and only here.
