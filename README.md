# lra-lean

Lean 4 proof formalization for the **Learning Real Analysis** project.

This repo was extracted from the retired `Learning-Real-Analysis/lean/` tree.

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

## Relationship to retired monorepo

This repo is a standalone Lean workspace. `Learning-Real-Analysis` is retired;
there is no sync workflow back to that tree. Lean files live here and only here.
