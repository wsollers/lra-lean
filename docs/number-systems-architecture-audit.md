# NumberSystems Architecture Audit

Updated: 2026-08-29

## Intended Architecture

- `LRA/NumberSystems` is a family of concrete subjects, not one authoritative
  global number-system interface.
- Each concrete subject owns its external generic interface, model theory,
  universal algebra, examples, interop, carriers, and construction aliases.
- Each construction owns an explicit `Satisfy_Generic.lean` bridge when the
  generic subject interface exists.
- Subject examples live under the concrete subject and present readable
  arithmetic checks on the subject-facing construction surface.

## Current Variances

- `LRA/NumberSystems/Carriers.lean` still acts as a cross-subject aggregation
  surface. This remains a compatibility layer rather than the desired final
  owner shape.
- `NaturalNumbers` has incomplete construction normalization:
  `Landau`, `VonNeumann`, and `Presburger` do not all expose a full generic
  bridge plus subject-owned example surface in the same way as the better
  normalized subjects.
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
- Subject-local `Interop` ownership for every concrete subject.
- One arithmetic example for each non-mathlib construction whose current
  public surface still lacks a stable subject-facing addition operation.

## Gates

Run after each change block:

- `python scripts/validate_structure.py --path LRA/NumberSystems`
- `lake build LRA.NumberSystems.<Subject>` for each edited subject
