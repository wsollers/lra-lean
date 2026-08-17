import LRA.VolumeI.Order.Laws.OperationCompatibility.All

namespace LRA.Order

/-!
Positive examples of order-operation compatibility laws belong here.
-/

/-- Natural-number addition as a concrete relation-preservation example. -/
def NaturalAdditionForOrderCompatibility :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example - NaturalAdditionRightTranslationPreservesLessEqual]**

Adding the same natural number on the right preserves `<=`.
-/
theorem NaturalAdditionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalAdditionForOrderCompatibility := by
  intro left right fixed related
  exact Nat.add_le_add_right related fixed

/-- Natural-number truncated subtraction for an order-compatibility example. -/
def NaturalSubtractionForOrderCompatibilityExample :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right

/--
**[Example - NaturalSubtractionRightTranslationPreservesLessEqual]**

Subtracting the same natural number on the right preserves `<=`.
-/
theorem NaturalSubtractionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityExample := by
  intro left right fixed related
  exact Nat.sub_le_sub_right related fixed

end LRA.Order
