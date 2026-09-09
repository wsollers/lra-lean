import LRA.Logic.Syntax.SecondOrder.Formula
import LRA.Identity.Interface.Logic.SOL.Language

namespace LRA.Identity.Logic.SOL

open LRA.Logic
open LRA.Logic.SecondOrder

/--
`Biconditional` TODO

Predicate logic:

  def Biconditional
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat -> Type}
      (left right : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.and (.impl left right) (.impl right left)

Predicate logic (unfolded):

  def Biconditional
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat -> Type}
      (left right : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.and (.impl left right) (.impl right left)

Logical form (Lean):

```lean
def Biconditional
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    (left right : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.and (.impl left right) (.impl right left)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Biconditional
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    (left right : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.and (.impl left right) (.impl right left)

/--
`LeibnizIndiscernibilityFormula` TODO

Predicate logic:

  def LeibnizIndiscernibilityFormula
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat -> Type}
      (left right : Variable) (property : RelationVariable 1) :
      Formula S Variable RelationVariable FunctionVariable :=
    .forallRel property
      (Biconditional
        (.relationVar property (fun _ => .var left))
        (.relationVar property (fun _ => .var right)))

Predicate logic (unfolded):

  def LeibnizIndiscernibilityFormula
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat -> Type}
      (left right : Variable) (property : RelationVariable 1) :
      Formula S Variable RelationVariable FunctionVariable :=
    .forallRel property
      (Biconditional
        (.relationVar property (fun _ => .var left))
        (.relationVar property (fun _ => .var right)))

Logical form (Lean):

```lean
def LeibnizIndiscernibilityFormula
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    (left right : Variable) (property : RelationVariable 1) :
    Formula S Variable RelationVariable FunctionVariable :=
  .forallRel property
    (Biconditional
      (.relationVar property (fun _ => .var left))
      (.relationVar property (fun _ => .var right)))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

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

/--
`LeibnizIdentityFormula` TODO

Predicate logic:

  def LeibnizIdentityFormula
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat -> Type}
      (left right : Variable) (property : RelationVariable 1) :
      Formula S Variable RelationVariable FunctionVariable :=
    Biconditional (.equal (.var left) (.var right))
      (LeibnizIndiscernibilityFormula left right property)

Predicate logic (unfolded):

  def LeibnizIdentityFormula
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat -> Type}
      (left right : Variable) (property : RelationVariable 1) :
      Formula S Variable RelationVariable FunctionVariable :=
    Biconditional (.equal (.var left) (.var right))
      (LeibnizIndiscernibilityFormula left right property)

Logical form (Lean):

```lean
def LeibnizIdentityFormula
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    (left right : Variable) (property : RelationVariable 1) :
    Formula S Variable RelationVariable FunctionVariable :=
  Biconditional (.equal (.var left) (.var right))
    (LeibnizIndiscernibilityFormula left right property)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LeibnizIdentityFormula
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    (left right : Variable) (property : RelationVariable 1) :
    Formula S Variable RelationVariable FunctionVariable :=
  Biconditional (.equal (.var left) (.var right))
    (LeibnizIndiscernibilityFormula left right property)

end LRA.Identity.Logic.SOL
