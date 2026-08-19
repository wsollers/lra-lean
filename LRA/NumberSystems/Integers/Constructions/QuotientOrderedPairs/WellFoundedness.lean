-- LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/WellFoundedness.lean
-- The induction principle the quotient carrier supports.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Equivalence

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/-!
New content: the source never stated the induction/recursion principle this
pipeline stage calls for. Every class of `Carrier whole_data` has a
representative pair, so a predicate holds everywhere once it holds of every
representative's image; stated here, `sorry`, per this migration's policy
of never completing a proof it did not already carry. Tracked in
`Integers/ProofOrder.md`.
-/

/-- Every integer class in this construction is the class of some formal
difference: induction on representatives suffices to prove a predicate
everywhere. -/
theorem induction_on_representatives
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (motive : Carrier whole_data → Prop)
    (onRepresentative :
      ∀ representative : Representative whole_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier whole_data, motive value := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
