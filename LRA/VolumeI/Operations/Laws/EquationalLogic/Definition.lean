import LRA.VolumeI.Operations.Definition
import LRA.VolumeI.Relations.Equivalence.EquivalenceRelation

namespace LRA.Operation.Laws.EquationalLogic

open LRA.Operation

universe u v w

/--
**[Definition — UnaryEqualityCompatible]**

A unary operation respects equality of inputs.
-/
def UnaryEqualityCompatible {Domain : Type u} {Codomain : Type v}
    (operation : HeterogeneousUnaryOperation Domain Codomain) : Prop :=
  forall {left right : Domain}, left = right -> operation left = operation right

/--
**[Definition — LeftArgumentEqualityCompatible]**

A binary operation respects equality in its left argument.
-/
def LeftArgumentEqualityCompatible {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  forall {left₁ left₂ : Left} (right : Right),
    left₁ = left₂ -> operation left₁ right = operation left₂ right

/--
**[Definition — RightArgumentEqualityCompatible]**

A binary operation respects equality in its right argument.
-/
def RightArgumentEqualityCompatible {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  forall (left : Left) {right₁ right₂ : Right},
    right₁ = right₂ -> operation left right₁ = operation left right₂

/--
**[Definition — BinaryEqualityCompatible]**

A binary operation respects equality in both arguments at once.
-/
def BinaryEqualityCompatible {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  forall {left₁ left₂ : Left} {right₁ right₂ : Right},
    left₁ = left₂ -> right₁ = right₂ ->
      operation left₁ right₁ = operation left₂ right₂

/--
**[Definition — UnaryOperationCongruence]**

A unary endo-operation respects a chosen relation on its carrier.
-/
def UnaryOperationCongruence {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  forall {left right : Carrier},
    relation left right -> relation (operation left) (operation right)

/--
**[Definition — BinaryOperationCongruence]**

A binary endo-operation respects a chosen relation in both inputs at once.
-/
def BinaryOperationCongruence {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall {left₁ left₂ right₁ right₂ : Carrier},
    relation left₁ left₂ -> relation right₁ right₂ ->
      relation (operation left₁ right₁) (operation left₂ right₂)

/--
**[Definition — UnaryOperationRelationRequirements]**

A unary endo-operation has relation requirements when the displayed relation
is an equivalence relation and the operation respects it.
-/
def UnaryOperationRelationRequirements {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  LRA.Relation.EquivalenceRelation relation /\
    UnaryOperationCongruence relation operation

/--
**[Definition — BinaryOperationRelationRequirements]**

A binary endo-operation has relation requirements when the displayed relation
is an equivalence relation and the operation respects it in both inputs.
-/
def BinaryOperationRelationRequirements {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LRA.Relation.EquivalenceRelation relation /\
    BinaryOperationCongruence relation operation

/--
**[Definition — UnaryOperationEqualityRequirements]**

The equality-relation requirements for a unary endo-operation.
-/
def UnaryOperationEqualityRequirements {Carrier : Type u}
    (operation : UnaryEndoOperation Carrier) : Prop :=
  UnaryOperationRelationRequirements
    (LRA.Relation.IdentityRelation Carrier)
    operation

/--
**[Definition — BinaryOperationEqualityRequirements]**

The equality-relation requirements for a binary endo-operation.
-/
def BinaryOperationEqualityRequirements {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  BinaryOperationRelationRequirements
    (LRA.Relation.IdentityRelation Carrier)
    operation

end LRA.Operation.Laws.EquationalLogic
