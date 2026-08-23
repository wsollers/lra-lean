# p0-29 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/ComplexNumbers`
- Build target: `LRA.NumberSystems.ComplexNumbers`
- Last good stop: `2026-08-23`: spec frozen on disk and implemented on `main`

## Brief Summary

`p0-29` repairs a false theorem surface in the custom complex-number owner
module for local polynomials. The record
`LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Polynomial`
stored only a natural `degree` and a coefficient table indexed by
`Fin (degree + 1)`. That let callers declare `degree > 0` while setting the
highest coefficient to zero, so the exported predicate
`Polynomial.nonconstant := degree ≠ 0` did not actually mean the polynomial
was nonconstant.

That mismatch directly falsifies the local algebraic-closure theorem surface:
a polynomial could be marked `nonconstant` by its declared degree even when its
actual value was a nonzero constant polynomial with no root.

The bounded repair is to strengthen the local `Polynomial` owner contract with
the missing leading-coefficient invariant, keep `nonconstant := degree ≠ 0`
only after that invariant is enforced, and align the authoritative complex
proof-order note with the repaired owner surface.

## Exact Repair List

- Strengthen
  [LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Behavior.lean:1)
  so the local `Polynomial` record now requires a
  `leading_coefficient_nonzero` witness whenever `degree ≠ 0`.

- Retarget the same owner file so the local polynomial declarations explicitly
  carry the needed `[OfNat R 0]` boundary assumption and the algebraic-closure
  theorem uses the repaired owner functions directly.

- Align
  [LRA/NumberSystems/ComplexNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/ComplexNumbers/ProofOrder.md:1)
  so the authoritative complex-number repair notes state that the local
  polynomial carrier now enforces the missing degree/leading-coefficient
  invariant.

## Acceptance Criteria

- The local complex-number `Polynomial` owner no longer permits
  `degree > 0` with a zero leading coefficient.
- `Polynomial.nonconstant := degree ≠ 0` is mathematically sound for this
  owner surface because the claimed degree is now certified by the top
  coefficient.
- The repair stays bounded to the custom complex-number owner surface and the
  directly affected proof-order note.
- `python scripts/validate_structure.py --path LRA/NumberSystems/ComplexNumbers`
  passes.
- `lake build LRA.NumberSystems.ComplexNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.
