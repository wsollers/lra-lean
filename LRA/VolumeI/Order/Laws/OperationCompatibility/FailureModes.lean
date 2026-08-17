import LRA.VolumeI.Order.Laws.OperationCompatibility.Definition

namespace LRA.Order

universe u

/-!
Failure modes for order-operation compatibility laws belong here.
-/

/-- Failure of left-translation relation preservation. -/
def FailsLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (LeftTranslationPreservesRelation relation operation)

/-- Failure of right-translation relation preservation. -/
def FailsRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (RightTranslationPreservesRelation relation operation)

/-- Natural-number truncated subtraction as a concrete preservation failure. -/
def NaturalSubtractionForOrderCompatibilityFailure :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right

/--
**[Failure Mode - NaturalSubtractionFailsLeftTranslationPreservesLessEqual]**

Subtracting from the same natural number on the left does not preserve `<=`.
-/
theorem NaturalSubtractionFailsLeftTranslationPreservesLessEqual :
    FailsLeftTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityFailure := by
  intro law
  exact Nat.not_succ_le_zero 0 (law 1 0 1 (Nat.zero_le 1))

end LRA.Order
