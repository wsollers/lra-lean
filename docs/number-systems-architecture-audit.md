# NumberSystems Architecture Audit

Updated: 2026-09-01

## Intended Architecture

- `LRA/NumberSystems` is a family of concrete subjects, not one authoritative
  global number-system interface.
- The naturals-family target shape is stratified by concrete arithmetic content:
  `SuccessorArithmetic` is concrete successor only, `Presburger` is the full
  0-based additive layer, `Landau` is 1-based arithmetic in the style of
  Landau's presentation, and `VonNeumann` is the 0-based arithmetic extension
  with `0` added back.
- Each concrete subject owns its external generic interface, model theory,
  universal algebra, examples, interop, carriers, and construction aliases.
- Each construction owns an explicit `Satisfy_Generic.lean` bridge when the
  generic subject interface exists.
- Each construction that canonically realizes one or more generic algebraic
  structures should also own one omnibus
  `Satisfy_AlgebraicStructures.lean` bridge file, with one named declaration per
  actual algebraic target.
- Subject examples live under the concrete subject and present readable
  arithmetic checks on the subject-facing construction surface.

## Current Variances

- `LRA/NumberSystems/Carriers.lean` still acts as a cross-subject aggregation
  surface. This remains a compatibility layer rather than the desired final
  owner shape.
- `SuccessorArithmetic` now has the correct concrete subject role, but the
  structural validator still expects deleted/retired `Interface/ModelTheory`
  and `Interface/UniversalAlgebra` files there, so validation on that path is
  currently non-discriminating.
- `NaturalNumbers` still has uneven generic normalization across constructions,
  but its arithmetic owner split is now explicit: `Presburger` owns the
  additive 0-based layer, `Landau` remains the canonical 1-based arithmetic
  layer, and `VonNeumann` owns the 0-based arithmetic/semiring scaffolding.
- `GaussianIntegers` does not yet expose a full generic bridge file for
  `OrderedPairs`, and its subject interface remains thinner than the core
  scalar chain.
- `ComplexNumbers` and `GaussianIntegers` do not yet mirror the full
  `Interface/{Definition,UniversalAlgebra,Satisfy_*}` shape used by
  `NaturalNumbers`, `WholeNumbers`, `Integers`, `RationalNumbers`, and
  `RealNumbers`.
- Several concrete subjects were missing subject-owned `Examples.lean`
  routers, and the top-level `LRA/NumberSystems/Examples.lean` router did not
  cover the full concrete-subject chain.
- Subject-local `Interop.lean` ownership is still sparse outside
  `RationalNumbers` and `RealNumbers`.

## Changes In This Pass

- Recast `SuccessorArithmetic` as the concrete successor-only subject over
  `Nat`, with canonical `zero`, `successor`, `one`, and `concretePeanoSystem`
  owners.
- Added the missing 0-based additive owner surface to
  `NaturalNumbers.Constructions.Presburger`, including law packages and a
  construction-local `Satisfy_AlgebraicStructures.lean`.
- Added the missing 0-based arithmetic scaffolding to
  `NaturalNumbers.Constructions.VonNeumann`, including successor, addition,
  multiplication, exponentiation, law packages, and a construction-local
  `Satisfy_AlgebraicStructures.lean`.
- Added subject-owned `Examples.lean` routers for the concrete subjects that
  were missing them.
- Added per-subject arithmetic example surfaces on the stable
  subject-facing construction routes that currently compile cleanly.
- Expanded the top-level `LRA/NumberSystems/Examples.lean` router to follow the
  concrete-subject architecture.
- Kept subject root routers free of `Examples` imports so they continue to
  satisfy the repository quarantine rules.

## Still Missing After This Pass

- Decomposition of `LRA/NumberSystems/Carriers` into subject-owned carrier
  modules.
- Full `UniversalAlgebra` and `Satisfy_*` normalization for
  `ComplexNumbers` and `GaussianIntegers`.
- `Satisfy_Generic.lean` completion for every construction that still lacks a
  canonical generic bridge.
- Remaining naturals-family cleanup is now mostly ownership polish rather than
  subject-shape ambiguity: carrier alias ownership, `Carriers` decomposition,
  and any additional generic/refinement bridges should follow the settled
  `SuccessorArithmetic` / `Presburger` / `Landau` / `VonNeumann` split.
- Subject-local `Interop` ownership for every concrete subject.
- One arithmetic example for each non-mathlib construction whose current
  public surface still lacks a stable subject-facing addition operation.

## Gates

Run after each change block:

- `python scripts/validate_structure.py --path LRA/NumberSystems`
- `lake build LRA.NumberSystems.<Subject>` for each edited subject
