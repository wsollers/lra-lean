import LRA.Operation
import LRA.Relation.Structures.Definition

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

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

end LRA.UniversalAlgebra.Congruence
