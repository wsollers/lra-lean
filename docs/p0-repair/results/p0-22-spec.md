# p0-22 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RealNumbers`
- Last good stop: `2026-08-23`: spec frozen on disk and ready for implementation

## Brief Summary

`p0-22` is narrower than the raw review note suggests. The active Dyadic
carrier syntax on current `main` already repairs the "cannot represent nonzero
values below one" defect: it separates the whole-number part from a canonical
fractional part and allows signed nonzero magnitudes through
`UnsignedExpansion`, `NonzeroUnsignedExpansion`, and `Expansion`.

The remaining live defect is the semantic input contract.
`RationalDyadicApproximationData` still carries arbitrary Cauchy-carrier
constants, operations, inverse, and strict order fields with no law package
tying them to an actual real-number structure. That makes the transported
Dyadic ordered-field surface weaker than the intended "representation theorem
after reals" design. The authoritative Dyadic proof-order notes are also still
stale in places.

## Exact Repair List

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Carrier.lean:1)
  so `RationalDyadicApproximationData` no longer stores arbitrary Cauchy
  operations/order fields. Replace that weak contract with a selected
  carrier-tied `LRA.NumberSystems.RealNumbers.RationalRealExtension` over the
  actual `RationalNumberSystem` together with a carrier equality identifying
  its real carrier with the Cauchy quotient carrier. Then define
  `RationalToCauchy`, `CauchyZero`, `CauchyOne`, `CauchyAddition`,
  `CauchyNegation`, `CauchyMultiplication`, `CauchyInverse`, and
  `CauchyStrictOrder` by transport from that selected real extension rather
  than by arbitrary input fields.

- Keep the Dyadic downstream files (`WellDefinedness.lean`, `Laws.lean`,
  `Behavior.lean`, `Instances.lean`) source-compatible as far as possible by
  reusing those same field names as derived definitions on the stronger data
  package. Edit them only if the build requires directly aligned comments.

- Change
  [LRA/NumberSystems/RealNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/ProofOrder.md:175)
  only as far as needed to describe the repaired Dyadic surface accurately:
  update the carrier checklist to the live syntax names and stronger semantic
  contract, and remove the stale standalone completeness-summary description
  from `Behavior.lean` in favor of the carrier-tied
  `DyadicRealizesRationalRealExtension` theorem in `Instances.lean`.

- Do not broaden into a full Cauchy-operation canonicalization task. The
  bounded Dyadic repair may *use* a selected carrier-tied real extension over
  the Cauchy carrier, but it should not reopen the Cauchy construction's own
  theorem surfaces.

## Acceptance Criteria

- The Dyadic carrier contract no longer accepts arbitrary unstructured Cauchy
  constants/operations/order as input data.
- The transported Dyadic semantics are derived from a selected carrier-tied
  `RationalRealExtension` whose carrier is explicitly identified with the
  Cauchy completion carrier.
- No authoritative Dyadic note still describes the old weak input contract or
  the removed standalone completeness summary as the live owner surface.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The Cauchy carrier itself still lacks a canonical exported operation package,
so the Dyadic fix must use a *selected* carrier-tied real extension over that
carrier rather than inventing new native Cauchy operations in this P0.
