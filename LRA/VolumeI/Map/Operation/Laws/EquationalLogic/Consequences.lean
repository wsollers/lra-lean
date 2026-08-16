import LRA.VolumeI.Map.Operation.Laws.EquationalLogic.Theorems

namespace LRA.Map.Operation.Laws.EquationalLogic

open LRA.Map.Operation

/-!
Consequences of equality-relation requirements for operations.
-/

universe u

/-- The equality relation for any unary endo-operation is an equivalence relation. -/
theorem UnaryOperation.identity_relation_is_equivalence
    {Carrier : Type u}
    (operation : UnaryEndoOperation Carrier) :
    LRA.Relation.EquivalenceRelation
      (LRA.Relation.IdentityRelation Carrier) :=
  UnaryOperationEqualityRequirements.identity_relation_is_equivalence
    (UnaryOperation.equality_requirements operation)

/-- The equality relation for any binary endo-operation is an equivalence relation. -/
theorem BinaryOperation.identity_relation_is_equivalence
    {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    LRA.Relation.EquivalenceRelation
      (LRA.Relation.IdentityRelation Carrier) :=
  BinaryOperationEqualityRequirements.identity_relation_is_equivalence
    (BinaryOperation.equality_requirements operation)

/-- Any unary endo-operation respects the identity relation. -/
theorem UnaryOperation.respects_identity_relation
    {Carrier : Type u}
    (operation : UnaryEndoOperation Carrier) :
    UnaryOperationCongruence
      (LRA.Relation.IdentityRelation Carrier)
      operation :=
  UnaryOperationEqualityRequirements.operation_congruence
    (UnaryOperation.equality_requirements operation)

/-- Any binary endo-operation respects the identity relation. -/
theorem BinaryOperation.respects_identity_relation
    {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    BinaryOperationCongruence
      (LRA.Relation.IdentityRelation Carrier)
      operation :=
  BinaryOperationEqualityRequirements.operation_congruence
    (BinaryOperation.equality_requirements operation)

end LRA.Map.Operation.Laws.EquationalLogic
