-- LRA/NumberSystems/RealNumbers/Constructions/Computable/Equivalence.lean
-- Equivalence of effective approximations by eventual agreement.

import LRA.NumberSystems.RealNumbers.Constructions.Computable.Carrier

namespace LRA.NumberSystems.RealNumbers.Computable
open LRA.NumberSystems.Models

/-!
`ComputableReal rational_model` is a plain structure wrapping a single
`EffectiveApproximation rational_model` (see `Carrier.lean`), not a
quotient of approximations by `equivalent`. The source states `equivalent`
as a standalone relation on `EffectiveApproximation` and never builds a
`Setoid`/`Quotient` on top of it, so no equivalence-relation theorem is
added at this stage: doing so would assert structure the source does not
carry. `equivalent` is moved below exactly as stated. See
`RealNumbers/ProofOrder.md`.
-/

/--
**[Def — equivalent]**

Mathematical statement (Lean): `def equivalent {rational_model : DenselyOrderedFieldModel} (first second : EffectiveApproximation rational_model) : Prop`.


Logical form:

```lean
def equivalent
    {rational_model : DenselyOrderedFieldModel}
    (first second : EffectiveApproximation rational_model) : Prop :=
  ∀ precision : Nat,
    ∃ index : Nat,
      first.approximate index = second.approximate index
```
-/
def equivalent
    {rational_model : DenselyOrderedFieldModel}
    (first second : EffectiveApproximation rational_model) : Prop :=
  ∀ precision : Nat,
    ∃ index : Nat,
      first.approximate index = second.approximate index

end LRA.NumberSystems.RealNumbers.Computable
