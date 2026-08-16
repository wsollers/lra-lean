import LRA.VolumeI.Map.Operation.Laws.Associative.Relationships

namespace LRA.Map.Operation.Laws.Associative

open LRA.Map.Operation

/-- Natural-number addition as the running associativity example. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example — NaturalAdditionAssociative]**

Natural-number addition is associative.
-/
theorem NaturalAdditionAssociative :
    Associative NaturalAddition := by
  sorry

/--
**[Example — NaturalAdditionAssociativeEqualityRequirements]**

The natural-addition associativity certificate exposes the standard equality
relation requirements for the operation.
-/
theorem NaturalAdditionAssociativeEqualityRequirements :
    LRA.Map.Operation.Laws.EquationalLogic.BinaryOperationEqualityRequirements
      NaturalAddition :=
  Associative.operation_equality_requirements NaturalAddition

end LRA.Map.Operation.Laws.Associative
