import LRA.VolumeI.UniversalAlgebra.Congruence.Definition

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

/-- Apply unary operation congruence. -/
theorem UnaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (law : UnaryOperationCongruence relation operation)
    {left right : Carrier}
    (related_inputs : relation left right) :
    relation (operation left) (operation right) :=
  law related_inputs

/-- Apply binary operation congruence. -/
theorem BinaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (law : BinaryOperationCongruence relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (related_left_inputs : relation left₁ left₂)
    (related_right_inputs : relation right₁ right₂) :
    relation (operation left₁ right₁) (operation left₂ right₂) :=
  law related_left_inputs related_right_inputs

/-- Project the equivalence-relation component from unary operation requirements. -/
theorem UnaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation :=
  requirements.left

/-- Project the congruence component from unary operation requirements. -/
theorem UnaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    UnaryOperationCongruence relation operation :=
  requirements.right

/-- Project the equivalence-relation component from binary operation requirements. -/
theorem BinaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation :=
  requirements.left

/-- Project the congruence component from binary operation requirements. -/
theorem BinaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    BinaryOperationCongruence relation operation :=
  requirements.right

end LRA.UniversalAlgebra.Congruence
