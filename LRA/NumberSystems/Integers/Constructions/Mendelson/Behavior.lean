-- LRA/NumberSystems/Integers/Constructions/Mendelson/Behavior.lean
-- The operations compute as expected on the intended values.

import LRA.NumberSystems.Integers.Constructions.Mendelson.Laws

namespace LRA.NumberSystems.Integers.Mendelson

/-!
New content, mirroring `QuotientOrderedPairs.Behavior`: stated here,
`sorry`, per this migration's policy. Tracked in `Integers/ProofOrder.md`.
-/

/-- The pair `(one, one)` is not itself in the positive class -- the
distinguished class it names is the additive identity, not a positive
integer. -/
theorem one_one_not_positive_class
    (positive_data : PositiveNaturalPairData) :
    ¬ positive_class positive_data
      { left := positive_data.one, right := positive_data.one } := by
  sorry

end LRA.NumberSystems.Integers.Mendelson
