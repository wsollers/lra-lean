# p0-20 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RealNumbers`
- Last good stop: `2026-08-23`: spec frozen on disk and ready for implementation

## Brief Summary

`p0-20` is now narrower than the raw review note suggests. The active Cantor
equivalence/setoid owner in
`LRA/NumberSystems/RealNumbers/Constructions/Cantor/Equivalence.lean` already
uses a symmetric two-sided endpoint-overlap relation and already exposes
`EndpointEquivalentIsEquivalence` plus the quotient setoid.

The remaining live defect is the theorem surface in
`Constructions/Cantor/Behavior.lean`: it is still named
`cantor_reals_are_isomorphic_to_cauchy_reals`, but its result only gives an
injective comparison into the Cauchy carrier. `p0-20` should therefore repair
that owner theorem and the directly affected explanatory comments, without
reopening the already-fixed equivalence layer.

## Exact Repair List

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/Cantor/Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cantor/Behavior.lean:1).
  Keep the theorem name
  `cantor_reals_are_isomorphic_to_cauchy_reals`, but strengthen its output
  from a bare injective map to a genuine bijective comparison using the
  project's function vocabulary:
  `LRA.Function.Bijective comparison`.

- In that same file, align the top-of-file comment, theorem docstring, and
  logical-form block so they describe a bijective comparison from the Cantor
  quotient carrier to the corresponding Cauchy carrier, not merely an
  injective correspondence.

- Change
  [LRA/NumberSystems/RealNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/ProofOrder.md:110)
  only as far as needed to describe the repaired Cantor behavior theorem
  accurately. Do not claim the equivalence layer is still one-sided there.

- Do not edit
  [LRA/NumberSystems/RealNumbers/Constructions/Cantor/Equivalence.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cantor/Equivalence.lean:1)
  unless required to keep the build green. Its active endpoint-equivalence
  surface is already symmetric and already states the equivalence theorem.

## Acceptance Criteria

- The active Cantor comparison theorem named “isomorphic” no longer proves only
- injectivity; it proves a bijective comparison using `LRA.Function.Bijective`.
- No directly affected authored comment still describes the comparison as only
  injective.
- The active Cantor equivalence/setoid layer remains untouched unless a build
  dependency forces a minimal aligned edit.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The endpoint-equivalence defect cited in the review is already repaired on
current `main`, so `p0-20` should close only the still-live injection-only
“isomorphism” theorem surface.
