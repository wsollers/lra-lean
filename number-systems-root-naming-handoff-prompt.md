# Number Systems Root Naming and Carrier Refactor Handoff

Work in the `lra-lean` repository. Treat this as an implementation task, not an
advisory review. Read the repository governance entrypoint and run the canonical
route resolver before editing.

Date of handoff context: August 29, 2026.

## Objective

Continue the `LRA.NumberSystems` carrier and construction refactor so every
concrete number-system family uses a consistent root-owned naming scheme:

- one default alias at the subject root;
- explicit in-house concrete carrier names at the subject root;
- explicit narrowed `LRA_MATHLIB_*` carrier names at the subject root; and
- constructions that reference those root-owned carrier names instead of
  construction-local shim-owned carriers.

This work is part of the broader migration away from delegated shims and toward
standalone concrete backends with subject-root ownership.

## Binding constraints

- Obey governance, coding, and naming standards.
- Do not introduce compatibility shims, migration aliases, or forwarding files
  beyond the mathematically intentional root aliases requested by the user.
- Leave theorem bodies as `sorry`.
- If a theorem is currently proved in number-systems scope and is touched by
  this refactor, replace the proof with `sorry`.
- Import in increasing order of functionality.
- Arrange theorems in proof dependency order.
- Arrange folder content according to repository standard.
- Run a correctness gate after each coherent block of changes:
  - the relevant structure validator;
  - the relevant focused `lake build` target(s).
- Model theory and universal algebra are high-sensitivity areas and must be
  monitored closely during every propagation step.
- The carriers and their alternatives belong to the concrete number-system
  subject root, not to local construction shims.

## Current state already completed

The following root-level naming propagation has already been implemented.

### NaturalNumbers

- Added subject root definition file:
  `LRA/NumberSystems/NaturalNumbers/Definition.lean`
- Added root-owned aliases:
  - `LRA_N_Landau`
  - `LRA_N_Presburger`
  - `LRA_N_VonNeumann`
  - `LRA_N`
  - `LRA_Nat`
  - `LRA_DefaultCarrier`
  - `LRA_MATHLIB_N`
- Rewired `LRA/NumberSystems/NaturalNumbers/Constructions/Mathlib.lean` to use
  the root-owned `LRA_MATHLIB_N` alias instead of a local raw `Nat` carrier.

### WholeNumbers

- Added subject root definition file:
  `LRA/NumberSystems/WholeNumbers/Definition.lean`
- Added root-owned aliases:
  - `LRA_W_Landau`
  - `LRA_W`
  - `LRA_Nat`
  - `LRA_DefaultCarrier`
  - `LRA_MATHLIB_W`
- Rewired `LRA/NumberSystems/WholeNumbers/Constructions/Mathlib.lean` to use
  the root-owned `LRA_MATHLIB_W` alias instead of a local raw `Nat` carrier.

### Integers

- Expanded `LRA/NumberSystems/Integers/Definition.lean`
- Added or normalized root-owned aliases:
  - `LRA_Z_Polish`
  - `LRA_Z_QuotientOrderedPairs`
  - `LRA_Z_Tao`
  - `LRA_Z_Mendelson`
  - `LRA_Z`
  - `LRA_Int`
  - `LRA_DefaultCarrier`
  - `LRA_MATHLIB_Z`
- Rewired `LRA/NumberSystems/Integers/Constructions/Mathlib.lean` to use the
  root-owned `LRA_MATHLIB_Z` alias instead of a local raw `Int` carrier.

### RationalNumbers

- Expanded `LRA/NumberSystems/RationalNumbers/Definition.lean`
- Added or normalized root-owned aliases:
  - `LRA_Q_RationalQuotientFractions`
  - `LRA_Q`
  - `LRA_Rat`
  - `LRA_DefaultCarrier`
  - `LRA_MATHLIB_Q`
- Rewired `LRA/NumberSystems/RationalNumbers/Constructions/Mathlib.lean` to use
  the root-owned `LRA_MATHLIB_Q` alias instead of a local raw `Rat` carrier.

### RealNumbers

- Expanded `LRA/NumberSystems/RealNumbers/Definition.lean`
- Added or normalized root-owned aliases:
  - `LRA_R_Cantor`
  - `LRA_R_Dedekind`
  - `LRA_R_PrimitiveIntervals`
  - `LRA_R_EffectiveCauchy`
  - `LRA_R_Cauchy`
  - `LRA_R_Dyadic`
  - `LRA_R`
  - `LRA_Real`
  - `LRA_DefaultCarrier`
  - `LRA_MATHLIB_R`
- Rewired `LRA/NumberSystems/RealNumbers/Constructions/Mathlib.lean` to use the
  root-owned `LRA_MATHLIB_R` alias instead of a local raw `Real` carrier.

## Verification already run

These gates were run successfully after the current propagation work:

- `python scripts\validate_structure.py --path LRA/NumberSystems/NaturalNumbers`
- `python scripts\validate_structure.py --path LRA/NumberSystems/WholeNumbers`
- `python scripts\validate_structure.py --path LRA/NumberSystems/Integers`
- `python scripts\validate_structure.py --path LRA/NumberSystems/RationalNumbers`
- `python scripts\validate_structure.py --path LRA/NumberSystems/RealNumbers`
- `lake build LRA.NumberSystems.NaturalNumbers`
- `lake build LRA.NumberSystems.WholeNumbers`
- `lake build LRA.NumberSystems.Integers`
- `lake build LRA.NumberSystems.RationalNumbers`
- `lake build LRA.NumberSystems.RealNumbers`
- `lake build LRA.NumberSystems`

Build output contains many expected `sorry` warnings elsewhere in the tree, but
all required targets completed successfully.

## Important architectural note

The current propagation deliberately stopped at subject-root definitions and
construction entrypoints. It did **not** force older interface/model files to
import the new root `Definition.lean` modules, because that risks import cycles
in the current layout.

This means the next work should continue to move ownership upward carefully,
without creating a cycle between:

- subject `Definition.lean`;
- interface model-theory files;
- construction instance files; and
- subject-level aggregators.

If a proposed propagation step creates a cycle, stop and choose a dependency-safe
restructure instead of adding another shim.

## Current next step

Continue the refactor by eliminating remaining construction-local carrier
ownership and delegated shims in the concrete backends themselves.

The intended direction is:

1. Keep one root default alias per family.
2. Keep explicit root-owned in-house construction carrier names.
3. Keep explicit root-owned `LRA_MATHLIB_*` narrowed carrier names.
4. Make concrete constructions refer to those root-owned names.
5. Split any remaining delegated wrappers into standalone concrete backends
   rather than shim layers.
6. Preserve the ability to swap defaults locally or globally by rebinding the
   root aliases rather than by editing construction internals.

## Immediate tasks for the next chat

1. Audit `NaturalNumbers`, `WholeNumbers`, `Integers`, `RationalNumbers`, and
   `RealNumbers` for any remaining construction-local carrier aliases that still
   own the carrier instead of referring to the root.
2. Propagate the same root-owned naming pattern beyond the Mathlib construction
   entrypoints wherever local constructions still own the carrier names.
3. Standardize naming so the root subject owns the user-facing aliases and
   constructions become consumers of those names.
4. Watch model-theory and universal-algebra files for any accidental dependency
   inversion during the propagation.
5. Run validator and focused `lake build` gates after each subject block.

## Files changed in the current propagation block

- `LRA/NumberSystems/NaturalNumbers/Definition.lean`
- `LRA/NumberSystems/WholeNumbers/Definition.lean`
- `LRA/NumberSystems/Integers/Definition.lean`
- `LRA/NumberSystems/RationalNumbers/Definition.lean`
- `LRA/NumberSystems/RealNumbers/Definition.lean`
- `LRA/NumberSystems/NaturalNumbers/Constructions/Mathlib.lean`
- `LRA/NumberSystems/WholeNumbers/Constructions/Mathlib.lean`
- `LRA/NumberSystems/Integers/Constructions/Mathlib.lean`
- `LRA/NumberSystems/RationalNumbers/Constructions/Mathlib.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Mathlib.lean`

## Worktree caution

This repository has other in-progress changes and untracked files unrelated to
this specific propagation step. Preserve unrelated worktree state. Do not revert
or clean the tree. Operate only on the number-systems naming and carrier-refactor
scope unless the user explicitly widens scope.
