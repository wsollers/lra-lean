import LRA.VolumeI.Operations.Laws.EquationalLogic.Theorems

namespace LRA.Operation.Laws.EquationalLogic

open LRA.Operation

/-- Natural-number addition as the running equality-compatibility example. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example — NaturalAdditionEqualityCompatible]**

Natural-number addition respects equality in both arguments.
-/
theorem NaturalAdditionEqualityCompatible :
    BinaryEqualityCompatible NaturalAddition := by
  sorry

/--
**[Example — NaturalAdditionEqualityRequirements]**

Natural-number addition uses the identity relation as its equality relation;
that relation is an equivalence relation and addition respects it.
-/
theorem NaturalAdditionEqualityRequirements :
    BinaryOperationEqualityRequirements NaturalAddition :=
  BinaryOperation.equality_requirements NaturalAddition

/--
**[Example — NaturalAdditionIdentityRelationIsEquivalence]**

The equality relation consumed by natural-number addition is an equivalence
relation.
-/
theorem NaturalAdditionIdentityRelationIsEquivalence :
    LRA.Relation.EquivalenceRelation (LRA.Relation.IdentityRelation Nat) :=
  BinaryOperationEqualityRequirements.identity_relation_is_equivalence
    NaturalAdditionEqualityRequirements

/--
**[Example — NaturalAdditionRespectsIdentityRelation]**

Natural-number addition is congruent with respect to the identity relation.
-/
theorem NaturalAdditionRespectsIdentityRelation :
    BinaryOperationCongruence
      (LRA.Relation.IdentityRelation Nat)
      NaturalAddition :=
  BinaryOperationEqualityRequirements.operation_congruence
    NaturalAdditionEqualityRequirements

/-- Same parity on natural numbers, used as a non-equality congruence example. -/
def SameParityForCongruenceExample (left right : Nat) : Prop :=
  left % 2 = right % 2

/--
**[Example — SameParityAdditionCongruence]**

Same parity is a congruence for natural-number addition.
-/
theorem SameParityAdditionCongruence :
    BinaryOperationCongruence SameParityForCongruenceExample NaturalAddition := by
  sorry

end LRA.Operation.Laws.EquationalLogic
