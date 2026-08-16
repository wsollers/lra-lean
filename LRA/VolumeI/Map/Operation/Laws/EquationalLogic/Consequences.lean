import LRA.VolumeI.Map.Operation.Laws.EquationalLogic.Theorems
import LRA.VolumeI.Relations.Equivalence.QuotientSet

namespace LRA.Map.Operation.Laws.EquationalLogic

open LRA.Map.Operation
open scoped LRA.Set

/-!
Consequences of equality-relation requirements for operations.
-/

universe u v

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

/--
Unary operation congruence is exactly the well-definedness condition needed
to pass from representatives to quotient classes.
-/
theorem UnaryOperationRelationRequirements.quotient_projection_respects_operation
    {Carrier : Type u} {SetObject : Type v}
    [Membership Carrier SetObject]
    [LRA.Set.HasSeparation Carrier SetObject]
    [LRA.Set.SeparationLaws Carrier SetObject]
    [LRA.Set.ExtensionalityLaw Carrier SetObject]
    {ambient : SetObject}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements :
      UnaryOperationRelationRequirements relation operation)
    {left right : Carrier}
    (related : relation left right) :
    LRA.Relation.QuotientProjection ambient relation (operation left) =
      LRA.Relation.QuotientProjection ambient relation (operation right) :=
  LRA.Relation.QuotientProjectionWellDefined
    (UnaryOperationRelationRequirements.relation_is_equivalence requirements)
    (UnaryOperationRelationRequirements.operation_congruence
      requirements related)

/--
Binary operation congruence is exactly the well-definedness condition needed
to pass from pairs of representatives to quotient classes.
-/
theorem BinaryOperationRelationRequirements.quotient_projection_respects_operation
    {Carrier : Type u} {SetObject : Type v}
    [Membership Carrier SetObject]
    [LRA.Set.HasSeparation Carrier SetObject]
    [LRA.Set.SeparationLaws Carrier SetObject]
    [LRA.Set.ExtensionalityLaw Carrier SetObject]
    {ambient : SetObject}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements :
      BinaryOperationRelationRequirements relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (leftRelated : relation left₁ left₂)
    (rightRelated : relation right₁ right₂) :
    LRA.Relation.QuotientProjection
        ambient relation (operation left₁ right₁) =
      LRA.Relation.QuotientProjection
        ambient relation (operation left₂ right₂) :=
  LRA.Relation.QuotientProjectionWellDefined
    (BinaryOperationRelationRequirements.relation_is_equivalence requirements)
    (BinaryOperationRelationRequirements.operation_congruence
      requirements leftRelated rightRelated)

end LRA.Map.Operation.Laws.EquationalLogic
