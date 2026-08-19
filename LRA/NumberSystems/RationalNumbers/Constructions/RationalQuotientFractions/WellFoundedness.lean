-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/WellFoundedness.lean
-- The induction principle the quotient carrier supports.

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Equivalence

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-!
New content: the source never stated the induction/recursion principle this
pipeline stage calls for. Every class of `Carrier rational_data` has a
representative fraction, so a predicate holds everywhere once it holds of
every representative's image; stated here, `sorry`, per this migration's
policy of never completing a proof it did not already carry. Tracked in
`RationalNumbers/ProofOrder.md`.
-/

/-- Every rational class in this construction is the class of some formal
fraction: induction on representatives suffices to prove a predicate
everywhere. -/
theorem induction_on_representatives
    (rational_data : IntegerAndPositiveNaturalData)
    (motive : Carrier rational_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_data, motive value := by
  sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
