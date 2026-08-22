-- LRA/NumberSystems/RealNumbers/Constructions/Cantor/WellFoundedness.lean
-- The induction principle the quotient carrier supports.

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Equivalence

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Models

/-!
New content: the source never stated the induction/recursion principle this
pipeline stage calls for. Every class of `Carrier rational_model` is the
class of some `NestedIntervalSequence rational_model` representative, so a
predicate holds everywhere once it holds of every representative's image;
stated here, `sorry`, per this migration's policy of never completing a
proof it did not already carry. Tracked in `RealNumbers/ProofOrder.md`.
-/

/-- Every Cantor real class in this construction is the class of some
nested interval sequence: induction on representatives suffices to prove a
predicate everywhere.

Logical form:

```lean
theorem InductionOnRepresentatives
    (rational_model : DenselyOrderedFieldModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : NestedIntervalSequence rational_model,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model, motive value
```
-/
theorem InductionOnRepresentatives
    (rational_model : DenselyOrderedFieldModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : NestedIntervalSequence rational_model,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
