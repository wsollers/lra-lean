# lra-lean

Lean 4 proof formalization for the **Learning Real Analysis** project.

This repo was extracted from `Learning-Real-Analysis/lean/`.

## Documentation

The authoritative repository standards live under `docs/`:

- `docs/governance/repository-governance.md`
- `docs/architecture/repository-architecture.md`
- `docs/standards/lean-standards.md`

Planning notes, audits, prompt packs, and repair ledgers are working artifacts,
not governance.

## Structure

```
lakefile.lean       — Lake build configuration
lean-toolchain      — Lean 4 version pin
LRA/                — Lean source modules
LRA/Logic/          — sealed logical languages, syntax, and semantics
LRA/ModelTheory/    — set-level and structure-level model theory
LRA/ProofTheory/    — proof systems and metaproof theory
```

## Aggregators

Repository-level aggregators are standardized as:

```text
LRA.Core                — imports only volume `*Core` aggregators
LRA.ExamplesFailures    — imports only volume `*ExamplesFailures` aggregators
LRA.All                 — maximal aggregate from the standard root chain
LRA                     — backward-compatible alias of LRA.All
```

Active curricular volume slices follow the same flat naming convention:

```text
LRA.VolumeICore
LRA.VolumeIExamplesFailures
LRA.VolumeIAll
LRA.VolumeI

LRA.VolumeIICore
LRA.VolumeIIExamplesFailures
LRA.VolumeIIAll
LRA.VolumeII

LRA.VolumeIIICore
LRA.VolumeIIIExamplesFailures
LRA.VolumeIIIAll
LRA.VolumeIII

LRA.VolumeVIICore
LRA.VolumeVIIExamplesFailures
LRA.VolumeVIIAll
LRA.VolumeVII

LRA.VolumeTBDCore
LRA.VolumeTBDExamplesFailures
LRA.VolumeTBDAll
LRA.VolumeTBD
```

`VolumeTBD` is the provisional holding slice for mathematical subject routers
that are not yet assigned to a numbered volume while the LaTeX volume structure
is being reworked.

The flat names are intentional: on Windows, `LRA/VolumeI.lean` cannot coexist
with a sibling `LRA/VolumeI/` directory that would hold `Core.lean` or
`All.lean`.

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

## Completed Theorems

Generate a compact, compiled-environment-backed Markdown list for a subject:

```powershell
python scripts/dump_completed_theorems.py Set
python scripts/dump_completed_theorems.py Identity
```

Each command writes `build/completed-theorems/<subject>.md` with fully
qualified theorem names and `Completed` status. Add `--stdout` when a terminal
list is preferred.

## Blueprint

The Blueprint toolchain is containerized separately from the Lean build image:

```powershell
.\build.ps1 docker-blueprint-build
.\build.ps1 blueprint
```

When `docs/number-systems` is not available in the checkout, the container
skips number-system input regeneration and still emits Lean-driven volume
Blueprint chapters from `LRA/`.

## Relationship to monorepo

This repo is a standalone Lean workspace. The monorepo (`Learning-Real-Analysis`) references it for context but does not build it. Lean files live here and only here.
