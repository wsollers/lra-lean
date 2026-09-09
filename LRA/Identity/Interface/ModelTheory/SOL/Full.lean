import LRA.Identity.Interface.Logic.SOL.Theory
import LRA.Identity.Interface.Logic.SOL.Syntax
import LRA.ModelTheory.SecondOrder.Semantics.FullSOSatisfaction

namespace LRA.Identity.ModelTheory.SOL

universe u

/--
`FullPredicateDomain` TODO

Predicate logic:

  def FullPredicateDomain (Carrier : Type u) :
      LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier where
    Admissible := LRA.Identity.FullLeibniz Carrier

Predicate logic (unfolded):

  def FullPredicateDomain (Carrier : Type u) :
      LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier where
    Admissible := LRA.Identity.FullLeibniz Carrier

Logical form (Lean):

```lean
def FullPredicateDomain (Carrier : Type u) :
    LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier where
  Admissible := LRA.Identity.FullLeibniz Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FullPredicateDomain (Carrier : Type u) :
    LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier where
  Admissible := LRA.Identity.FullLeibniz Carrier

/--
`FullSatisfiesLeibnizIdentity` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableEq Variable] [inst_1 : (arity : Nat) → DecidableEq (RelationVariable arity)] [inst_2 : (arity : Nat) → DecidableEq (FunctionVariable arity)] (M : LRA.ModelTheory.SecondOrder.FullModel S) (assignment : LRA.ModelTheory.SecondOrder.FullSOAssignment M Variable RelationVariable FunctionVariable) (left right : Variable) (property : RelationVariable 1), LRA.ModelTheory.SecondOrder.FullSOSatisfies M assignment (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableEq Variable] [inst_1 : (arity : Nat) → DecidableEq (RelationVariable arity)] [inst_2 : (arity : Nat) → DecidableEq (FunctionVariable arity)] (M : LRA.ModelTheory.SecondOrder.FullModel S) (assignment : LRA.ModelTheory.SecondOrder.FullSOAssignment M Variable RelationVariable FunctionVariable) (left right : Variable) (property : RelationVariable 1), LRA.ModelTheory.SecondOrder.FullSOSatisfies M assignment (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

Logical form (Lean):

```lean
def FullSatisfiesLeibnizIdentity
    {S : LRA.Logic.Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    [DecidableEq Variable]
    [forall arity, DecidableEq (RelationVariable arity)]
    [forall arity, DecidableEq (FunctionVariable arity)]
    (M : LRA.ModelTheory.SecondOrder.FullModel S)
    (assignment : LRA.ModelTheory.SecondOrder.FullSOAssignment M Variable
      RelationVariable FunctionVariable)
    (left right : Variable) (property : RelationVariable 1) : Prop :=
  LRA.ModelTheory.SecondOrder.FullSOSatisfies M assignment
    (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)
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
def FullSatisfiesLeibnizIdentity
    {S : LRA.Logic.Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    [DecidableEq Variable]
    [forall arity, DecidableEq (RelationVariable arity)]
    [forall arity, DecidableEq (FunctionVariable arity)]
    (M : LRA.ModelTheory.SecondOrder.FullModel S)
    (assignment : LRA.ModelTheory.SecondOrder.FullSOAssignment M Variable
      RelationVariable FunctionVariable)
    (left right : Variable) (property : RelationVariable 1) : Prop :=
  LRA.ModelTheory.SecondOrder.FullSOSatisfies M assignment
    (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

end LRA.Identity.ModelTheory.SOL
