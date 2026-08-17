import LRA.VolumeI.Operations.Laws.EquationalLogic.Theorems
import LRA.VolumeI.Relations.Equivalence.QuotientSet

namespace LRA.Operation.Laws.EquationalLogic

open LRA.Operation
open scoped LRA.Set

/-!
Consequences of operation congruence with respect to arbitrary relations.
-/

universe u v

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
      LRA.Relation.QuotientProjection ambient relation (operation right) := by
  exact
    LRA.Relation.QuotientProjectionWellDefined
      requirements.1
      (requirements.2 related)

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
        ambient relation (operation left₂ right₂) := by
  exact
    LRA.Relation.QuotientProjectionWellDefined
      requirements.1
      (requirements.2 leftRelated rightRelated)

end LRA.Operation.Laws.EquationalLogic
