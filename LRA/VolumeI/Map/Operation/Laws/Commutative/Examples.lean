import LRA.VolumeI.Map.Operation.Laws.Commutative.Relationships

namespace LRA.Map.Operation.Laws.Commutative

open LRA.Map.Operation

/-- Natural-number addition as the running commutativity example. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example — NaturalAdditionCommutative]**

Natural-number addition is commutative.
-/
theorem NaturalAdditionCommutative :
    Commutative NaturalAddition := by
  sorry

/--
**[Example — NaturalAdditionCommutativeEqualityRequirements]**

The natural-addition commutativity certificate exposes the standard equality
relation requirements for the operation.
-/
theorem NaturalAdditionCommutativeEqualityRequirements :
    LRA.Map.Operation.Laws.EquationalLogic.BinaryOperationEqualityRequirements
      NaturalAddition :=
  Commutative.equality_requirements NaturalAdditionCommutative

end LRA.Map.Operation.Laws.Commutative
