import LRA.VolumeI.Operations.Laws.EquationalLogic.Definition

namespace LRA.Operation.Laws.EquationalLogic

open LRA.Operation

universe u

/--
Failure of substituting through a unary operation along an arbitrary relation.

This is deliberately not a failure of equality substitution. It records the
learning failure mode: a relation that is not equality does not automatically
license replacement inside expressions.
-/
def FailsUnaryRelationSubstitution {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  Not (forall {left right : Carrier},
    relation left right -> operation left = operation right)

/-- Same parity on natural numbers. -/
def SameParity (left right : Nat) : Prop :=
  left % 2 = right % 2

/-- Natural-number successor as a concrete operation. -/
def NaturalSuccessor : UnaryEndoOperation Nat :=
  fun number => number + 1

/--
**[Failure Mode — SameParityFailsUnarySubstitutionForSuccessor]**

Same parity does not license substituting one natural number for another under
successor as though the numbers were equal.
-/
theorem SameParityFailsUnarySubstitutionForSuccessor :
    FailsUnaryRelationSubstitution SameParity NaturalSuccessor := by
  sorry

end LRA.Operation.Laws.EquationalLogic
