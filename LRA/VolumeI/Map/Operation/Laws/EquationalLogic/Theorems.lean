import LRA.VolumeI.Map.Operation.Laws.EquationalLogic.Definition

namespace LRA.Map.Operation.Laws.EquationalLogic

open LRA.Map.Operation

universe u v w

/-- Apply unary equality compatibility. -/
theorem UnaryEqualityCompatible.apply {Domain : Type u} {Codomain : Type v}
    {operation : UnaryOperation Domain Codomain}
    (law : UnaryEqualityCompatible operation)
    {left right : Domain}
    (equal_inputs : left = right) :
    operation left = operation right := by
  sorry

/-- Apply left-argument equality compatibility. -/
theorem LeftArgumentEqualityCompatible.apply {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    {operation : BinaryOperation Left Right Codomain}
    (law : LeftArgumentEqualityCompatible operation)
    {left₁ left₂ : Left}
    (right : Right)
    (equal_left_inputs : left₁ = left₂) :
    operation left₁ right = operation left₂ right := by
  sorry

/-- Apply right-argument equality compatibility. -/
theorem RightArgumentEqualityCompatible.apply {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    {operation : BinaryOperation Left Right Codomain}
    (law : RightArgumentEqualityCompatible operation)
    (left : Left)
    {right₁ right₂ : Right}
    (equal_right_inputs : right₁ = right₂) :
    operation left right₁ = operation left right₂ := by
  sorry

/-- Apply binary equality compatibility in both arguments. -/
theorem BinaryEqualityCompatible.apply {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    {operation : BinaryOperation Left Right Codomain}
    (law : BinaryEqualityCompatible operation)
    {left₁ left₂ : Left}
    {right₁ right₂ : Right}
    (equal_left_inputs : left₁ = left₂)
    (equal_right_inputs : right₁ = right₂) :
    operation left₁ right₁ = operation left₂ right₂ := by
  sorry

/-- Every unary operation respects equality of inputs. -/
theorem UnaryOperation.equality_compatible {Domain : Type u} {Codomain : Type v}
    (operation : UnaryOperation Domain Codomain) :
    UnaryEqualityCompatible operation := by
  sorry

/-- Every binary operation respects equality in its left argument. -/
theorem BinaryOperation.left_argument_equality_compatible
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (operation : BinaryOperation Left Right Codomain) :
    LeftArgumentEqualityCompatible operation := by
  sorry

/-- Every binary operation respects equality in its right argument. -/
theorem BinaryOperation.right_argument_equality_compatible
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (operation : BinaryOperation Left Right Codomain) :
    RightArgumentEqualityCompatible operation := by
  sorry

/-- Every binary operation respects equality in both arguments. -/
theorem BinaryOperation.equality_compatible
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (operation : BinaryOperation Left Right Codomain) :
    BinaryEqualityCompatible operation := by
  sorry

/-- Apply unary operation congruence. -/
theorem UnaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (law : UnaryOperationCongruence relation operation)
    {left right : Carrier}
    (related_inputs : relation left right) :
    relation (operation left) (operation right) := by
  sorry

/-- Apply binary operation congruence. -/
theorem BinaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (law : BinaryOperationCongruence relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (related_left_inputs : relation left₁ left₂)
    (related_right_inputs : relation right₁ right₂) :
    relation (operation left₁ right₁) (operation left₂ right₂) := by
  sorry

/-- Equality is a congruence for every unary endo-operation. -/
theorem EqualityIsUnaryOperationCongruence {Carrier : Type u}
    (operation : UnaryEndoOperation Carrier) :
    UnaryOperationCongruence (LRA.Relation.IdentityRelation Carrier) operation := by
  sorry

/-- Equality is a congruence for every binary endo-operation. -/
theorem EqualityIsBinaryOperationCongruence {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    BinaryOperationCongruence (LRA.Relation.IdentityRelation Carrier) operation := by
  sorry

/-- Every unary endo-operation has the standard equality-relation requirements. -/
theorem UnaryOperation.equality_requirements {Carrier : Type u}
    (operation : UnaryEndoOperation Carrier) :
    UnaryOperationEqualityRequirements operation := by
  exact
    ⟨LRA.Relation.IdentityRelationIsEquivalenceRelation,
      EqualityIsUnaryOperationCongruence operation⟩

/-- Every binary endo-operation has the standard equality-relation requirements. -/
theorem BinaryOperation.equality_requirements {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    BinaryOperationEqualityRequirements operation := by
  exact
    ⟨LRA.Relation.IdentityRelationIsEquivalenceRelation,
      EqualityIsBinaryOperationCongruence operation⟩

/-- Project the equivalence-relation component from unary operation requirements. -/
theorem UnaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation := by
  exact requirements.1

/-- Project the congruence component from unary operation requirements. -/
theorem UnaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    UnaryOperationCongruence relation operation := by
  exact requirements.2

/-- Project the equivalence-relation component from binary operation requirements. -/
theorem BinaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation := by
  exact requirements.1

/-- Project the congruence component from binary operation requirements. -/
theorem BinaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    BinaryOperationCongruence relation operation := by
  exact requirements.2

/-- Equality requirements identify the identity relation as an equivalence relation. -/
theorem BinaryOperationEqualityRequirements.identity_relation_is_equivalence
    {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationEqualityRequirements operation) :
    LRA.Relation.EquivalenceRelation
      (LRA.Relation.IdentityRelation Carrier) := by
  exact BinaryOperationRelationRequirements.relation_is_equivalence requirements

/-- Equality requirements provide binary congruence for the identity relation. -/
theorem BinaryOperationEqualityRequirements.operation_congruence
    {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationEqualityRequirements operation) :
    BinaryOperationCongruence
      (LRA.Relation.IdentityRelation Carrier)
      operation := by
  exact BinaryOperationRelationRequirements.operation_congruence requirements

/-- Equality requirements identify the identity relation as an equivalence relation. -/
theorem UnaryOperationEqualityRequirements.identity_relation_is_equivalence
    {Carrier : Type u}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationEqualityRequirements operation) :
    LRA.Relation.EquivalenceRelation
      (LRA.Relation.IdentityRelation Carrier) := by
  exact UnaryOperationRelationRequirements.relation_is_equivalence requirements

/-- Equality requirements provide unary congruence for the identity relation. -/
theorem UnaryOperationEqualityRequirements.operation_congruence
    {Carrier : Type u}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationEqualityRequirements operation) :
    UnaryOperationCongruence
      (LRA.Relation.IdentityRelation Carrier)
      operation := by
  exact UnaryOperationRelationRequirements.operation_congruence requirements

/-- Every binary operation's identity relation is reflexive. -/
theorem BinaryOperationEqualityRequirements.identity_relation_is_reflexive
    {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (_requirements : BinaryOperationEqualityRequirements operation) :
    LRA.Relation.Reflexive (LRA.Relation.IdentityRelation Carrier) := by
  exact LRA.Relation.IdentityRelationIsReflexive

/-- Every binary operation's identity relation is symmetric. -/
theorem BinaryOperationEqualityRequirements.identity_relation_is_symmetric
    {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (_requirements : BinaryOperationEqualityRequirements operation) :
    LRA.Relation.Symmetric (LRA.Relation.IdentityRelation Carrier) := by
  exact LRA.Relation.IdentityRelationIsSymmetric

/-- Every binary operation's identity relation is transitive. -/
theorem BinaryOperationEqualityRequirements.identity_relation_is_transitive
    {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (_requirements : BinaryOperationEqualityRequirements operation) :
    LRA.Relation.Transitive (LRA.Relation.IdentityRelation Carrier) := by
  exact LRA.Relation.IdentityRelationIsTransitive

/-- Every unary operation's identity relation is reflexive. -/
theorem UnaryOperationEqualityRequirements.identity_relation_is_reflexive
    {Carrier : Type u}
    {operation : UnaryEndoOperation Carrier}
    (_requirements : UnaryOperationEqualityRequirements operation) :
    LRA.Relation.Reflexive (LRA.Relation.IdentityRelation Carrier) := by
  exact LRA.Relation.IdentityRelationIsReflexive

/-- Every unary operation's identity relation is symmetric. -/
theorem UnaryOperationEqualityRequirements.identity_relation_is_symmetric
    {Carrier : Type u}
    {operation : UnaryEndoOperation Carrier}
    (_requirements : UnaryOperationEqualityRequirements operation) :
    LRA.Relation.Symmetric (LRA.Relation.IdentityRelation Carrier) := by
  exact LRA.Relation.IdentityRelationIsSymmetric

/-- Every unary operation's identity relation is transitive. -/
theorem UnaryOperationEqualityRequirements.identity_relation_is_transitive
    {Carrier : Type u}
    {operation : UnaryEndoOperation Carrier}
    (_requirements : UnaryOperationEqualityRequirements operation) :
    LRA.Relation.Transitive (LRA.Relation.IdentityRelation Carrier) := by
  exact LRA.Relation.IdentityRelationIsTransitive

end LRA.Map.Operation.Laws.EquationalLogic
