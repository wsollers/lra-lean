-- LRA/NumberSystems/Integers/Constructions/Tao/WellFoundedness.lean
-- The induction principle the quotient carrier supports.

import LRA.NumberSystems.Integers.Constructions.Tao.Equivalence

namespace LRA.NumberSystems.Integers.Tao

/-!
New content, mirroring `QuotientOrderedPairs.WellFoundedness`: stated here,
`sorry`, per this migration's policy of never completing a proof it did not
already carry. Tracked in `Integers/ProofOrder.md`.
-/

/-- Every integer class in this construction is the class of some formal
difference: induction on representatives suffices to prove a predicate
everywhere. -/
theorem induction_on_representatives
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (motive : Carrier whole_data → Prop)
    (onRepresentative :
      ∀ representative : FormalDifference whole_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier whole_data, motive value := by
  sorry

end LRA.NumberSystems.Integers.Tao
