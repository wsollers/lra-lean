import LRA.Logic.Syntax.SecondOrder.Formula
import LRA.Identity.Interface.Logic.SOL.Language

namespace LRA.Identity.Logic.SOL

open LRA.Logic
open LRA.Logic.SecondOrder

/-- `Biconditional` forms the second-order formula `left` iff `right`.

Logical form:
```lean
(left -> right) and (right -> left)
```
-/
def Biconditional
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    (left right : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.and (.impl left right) (.impl right left)

/-- `LeibnizIndiscernibilityFormula` says that two object variables agree on
every unary relation admitted by second-order quantification.

Logical form:
```lean
forallRelation property, property left <-> property right
```
-/
def LeibnizIndiscernibilityFormula
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    (left right : Variable) (property : RelationVariable 1) :
    Formula S Variable RelationVariable FunctionVariable :=
  .forallRel property
    (Biconditional
      (.relationVar property (fun _ => .var left))
      (.relationVar property (fun _ => .var right)))

/-- `LeibnizIdentityFormula` identifies object-language equality with
agreement on every unary second-order predicate.

Logical form:
```lean
left = right <-> forallRelation property,
  property left <-> property right
```
-/
def LeibnizIdentityFormula
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    (left right : Variable) (property : RelationVariable 1) :
    Formula S Variable RelationVariable FunctionVariable :=
  Biconditional (.equal (.var left) (.var right))
    (LeibnizIndiscernibilityFormula left right property)

end LRA.Identity.Logic.SOL
