import LRA.VolumeI.Map.Operation.Laws.OrderCompatibility.Theorems

namespace LRA.Map.Operation.Laws.OrderCompatibility

open LRA.Map.Operation

/-- Natural-number addition as a concrete relation-preservation example. -/
def NaturalAdditionForOrderCompatibility : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example — NaturalAdditionRightTranslationPreservesLessEqual]**

Adding the same natural number on the right preserves `<=`.
-/
theorem NaturalAdditionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalAdditionForOrderCompatibility := by
  sorry

/-- Natural-number truncated subtraction for an order-compatibility example. -/
def NaturalSubtractionForOrderCompatibilityExample : BinaryEndoOperation Nat :=
  fun left right => left - right

/--
**[Example — NaturalSubtractionRightTranslationPreservesLessEqual]**

Subtracting the same natural number on the right preserves `<=`.
-/
theorem NaturalSubtractionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityExample := by
  sorry

end LRA.Map.Operation.Laws.OrderCompatibility
