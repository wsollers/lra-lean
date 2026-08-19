-- LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/Behavior.lean
-- The operations compute as expected on the intended values.

import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Laws

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

/-!
New content: the source (`LandauWorkup`/`TwoSidedSuccessor`) proved laws and
order but never stated the "is this the function I meant" checks §1.6.1
calls for -- that the successor of zero is the named element one, that its
predecessor is the named element negative one, and that zero sits strictly
between them in the order the file itself defines. Stated here, `sorry`,
per this migration's policy of never completing a proof it did not already
carry; tracked in `Integers/ProofOrder.md`.
-/

/-- The successor of zero is the distinguished element one. -/
theorem succ_zero_eq_one : succ Z.zero = one := by
  sorry

/-- The predecessor of zero is the distinguished element negative one. -/
theorem pred_zero_eq_neg_one : pred Z.zero = -one := by
  sorry

/-- Zero sits strictly between negative one and one, in the order this
construction itself defines. -/
theorem neg_one_lt_zero_lt_one : (-one : Z) < Z.zero ∧ (Z.zero : Z) < one := by
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
