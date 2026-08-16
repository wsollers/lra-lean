import LRA.VolumeI.Operations.Laws.Commutative.Relationships

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

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
    LRA.Operation.Laws.EquationalLogic.BinaryOperationEqualityRequirements
      NaturalAddition := by
  sorry

end LRA.Operation.Laws.Commutative
