-- LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Behavior.lean
-- The operations compute as expected on the intended values.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Laws

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/-!
New content: the source proved (or stated) the algebraic laws but never
checked that `embed` restricts to whole-number addition/multiplication, or
that `embed one` behaves as the multiplicative identity it is named for.
Stated here, `sorry`, per this migration's policy of never completing a
proof it did not already carry. Tracked in `Integers/ProofOrder.md`.
-/

/-- The embedding of whole numbers is additive. -/
theorem embed_preserves_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (addition : Carrier whole_data → Carrier whole_data → Carrier whole_data)
    (addition_computes :
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representative_addition whole_data first second)) :
    ∀ first second : whole_data.carrier,
      embed whole_data (whole_data.addition first second) =
        addition (embed whole_data first) (embed whole_data second) := by
  sorry

/-- `embed one` is the quotient's multiplicative identity. -/
theorem embed_one_eq_one_representative_class
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    embed whole_data whole_data.one = Quotient.mk _ (one_representative whole_data) := by
  sorry

/-- The zero representative's class is the additive identity reached by
embedding the whole-number zero. -/
theorem embed_zero_eq_zero_representative_class
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    embed whole_data whole_data.zero = Quotient.mk _ (zero_representative whole_data) := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
