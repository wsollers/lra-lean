import LRA.VolumeI.Map.Operation.Laws.OrderCompatibility.Definition

namespace LRA.Map.Operation.Laws.OrderCompatibility

open LRA.Map.Operation

universe u

/-- Failure of left-translation relation preservation. -/
def FailsLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (LeftTranslationPreservesRelation relation operation)

/-- Failure of right-translation relation preservation. -/
def FailsRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (RightTranslationPreservesRelation relation operation)

/-- Natural-number truncated subtraction as a concrete preservation failure. -/
def NaturalSubtractionForOrderCompatibilityFailure : BinaryEndoOperation Nat :=
  fun left right => left - right

/--
**[Failure Mode — NaturalSubtractionFailsLeftTranslationPreservesLessEqual]**

Subtracting from the same natural number on the left does not preserve `<=`.
-/
theorem NaturalSubtractionFailsLeftTranslationPreservesLessEqual :
    FailsLeftTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityFailure := by
  sorry

end LRA.Map.Operation.Laws.OrderCompatibility
