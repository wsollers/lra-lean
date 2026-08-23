# p0-26 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems`
- Build target: `LRA.NumberSystems.NaturalNumbers`; `LRA.NumberSystems.Integers`
- Last good stop: `2026-08-23`: spec frozen on disk and ready for implementation

## Brief Summary

`p0-26` repairs the whole-number owner input surface so its carried order is no
longer an arbitrary extra relation detached from the one-based arithmetic
already selected by `NaturalArithmeticForWholeNumbers`. The review note is
correct: the active whole-number laws and the shared quotient-pairs integer
adapter need a total, transitive, arithmetic-compatible order contract, not a
bare `strictOrder : Element → Element → Prop`.

The bounded fix is to strengthen the owner record with the missing order
compatibility fields, expose the corresponding whole-number order and
ordered-semiring certificates in `Instances.lean`, add the canonical adapter
into the shared quotient-pairs integer input bundle, and make that shared
bridge universe-polymorphic so the generic `Option Element` carrier can be
packaged without collapsing the owner surface to `Type`.

## Exact Repair List

- Extend
  [LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Carrier.lean:1)
  so `NaturalArithmeticForWholeNumbers` carries trichotomy, transitivity, and
  Landau-addition / Landau-multiplication preservation-and-reflection data for
  its selected `strictOrder`.

- Retarget
  [LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Laws.lean](/F:/repos/lra-lean/LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Laws.lean:1)
  and
  [LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Instances.lean:1)
  so the live whole-number order surface is built from that stronger input and
  exports the needed partial-order, total-order, and order-compatible semiring
  certificates.

- Add the canonical whole-number to quotient-pairs bridge in
  [LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Instances.lean:1)
  so a repaired whole-number owner package can feed
  `WholeNumberArithmeticForQuotientPairs` directly.

- Widen
  [LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean:1)
  just enough to make `WholeNumberArithmeticForQuotientPairs` and
  `.ofCarrier` universe-polymorphic, because the generic whole-number carrier
  is `Option Element` for arbitrary `Element : Type u`.

- Align the authoritative owner notes in
  [LRA/NumberSystems/NaturalNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/NaturalNumbers/ProofOrder.md:1)
  and
  [LRA/NumberSystems/Integers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/Integers/ProofOrder.md:1)
  with the strengthened whole-number input contract and canonical adapter.

## Acceptance Criteria

- `NaturalArithmeticForWholeNumbers` no longer permits a detached arbitrary
  order; it explicitly carries the total/transitive arithmetic compatibility
  needed by the downstream whole-number theorem surface.
- The whole-number instances layer exposes the order certificates required to
  package the owner carrier as an ordered semiring and as quotient-pairs input.
- The canonical whole-number to quotient-pairs adapter elaborates on the
  generic `Option Element` carrier.
- The shared quotient-pairs bridge remains valid for existing integer
  constructions while supporting the generic whole-number carrier universe.
- The authoritative natural/integer proof-order notes describe the repaired
  owner and bridge surfaces accurately.
- `python scripts/validate_structure.py --path LRA/NumberSystems` passes.
- `lake build LRA.NumberSystems.NaturalNumbers` passes.
- `lake build LRA.NumberSystems.Integers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The required integer-side bridge widening is bounded to the shared
`WholeNumberArithmeticForQuotientPairs` carrier packager that the whole-number
adapter must use.
