-- LRA/NumberSystems/Integers/Constructions/Mendelson/WellFoundedness.lean
-- The induction principle the quotient carrier supports.

import LRA.NumberSystems.Integers.Constructions.Mendelson.Equivalence

namespace LRA.NumberSystems.Integers.Mendelson

/-!
New content, mirroring `QuotientOrderedPairs.WellFoundedness`: stated here,
`sorry`, per this migration's policy of never completing a proof it did not
already carry. Tracked in `Integers/ProofOrder.md`.
-/

/-- Every integer class in this construction is the class of some positive
pair: induction on representatives suffices to prove a predicate
everywhere. -/
theorem induction_on_representatives
    (positive_data : PositiveNaturalPairData)
    (motive : Carrier positive_data → Prop)
    (onRepresentative :
      ∀ representative : PositivePair positive_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier positive_data, motive value := by
  sorry

end LRA.NumberSystems.Integers.Mendelson
