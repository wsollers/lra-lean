-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/WellFoundedness.lean
-- The induction principle the subtype carrier supports.

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Equivalence

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

/-!
New content: the source never stated an induction/recursion principle for
this pipeline stage. `Cut rational_model` is a subtype of `RationalSet
rational_model` cut out by `IsCut`, not a quotient, so there is no
"representative" to induct on as in the Cauchy/Rational constructions;
instead the analogous principle is that every cut arises from a lower set
together with a proof that it is a cut, so a predicate holds of every cut
once it holds of every such pair. Stated here, `sorry`, per this
migration's policy of never completing a proof it did not already carry.
Tracked in `RealNumbers/ProofOrder.md`.
-/

variable (rational_model : RationalModel)

/-- Every Dedekind cut in this construction is built from some lower set
together with a proof that the lower set satisfies `IsCut`: induction on
such pairs suffices to prove a predicate everywhere.

Logical form:

```lean
theorem InductionOnCuts
    (motive : Cut rational_model → Prop)
    (onLowerSet :
      ∀ (lower_set : RationalSet rational_model) (isCut : IsCut rational_model lower_set),
        motive ⟨lower_set, isCut⟩) :
    ∀ cut : Cut rational_model, motive cut
```
-/
theorem InductionOnCuts
    (motive : Cut rational_model → Prop)
    (onLowerSet :
      ∀ (lower_set : RationalSet rational_model) (isCut : IsCut rational_model lower_set),
        motive ⟨lower_set, isCut⟩) :
    ∀ cut : Cut rational_model, motive cut := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
