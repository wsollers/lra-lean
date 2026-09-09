import LRA.Identity.Interface.Logic.SOL.Theory
import LRA.Identity.Interface.Logic.FOL.Language
import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.ModelTheory.SecondOrder.HenkinModel
import LRA.ModelTheory.SecondOrder.Semantics.SOSatisfaction
import LRA.Identity.Interface.Logic.SOL.Syntax

namespace LRA.Identity.ModelTheory.SOL

open LRA.Logic

/--
`UnaryPredicateDomain` TODO

Predicate logic:

  def UnaryPredicateDomain {S : Signature}
      (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
      LRA.Identity.Logic.SOL.HenkinPredicateDomain M.Domain where
    Admissible P := (fun arguments => P (arguments 0)) ∈ M.RelationDomain 1

Predicate logic (unfolded):

  def UnaryPredicateDomain {S : Signature}
      (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
      LRA.Identity.Logic.SOL.HenkinPredicateDomain M.Domain where
    Admissible P := (fun arguments => P (arguments 0)) ∈ M.RelationDomain 1

Logical form (Lean):

```lean
def UnaryPredicateDomain {S : Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
    LRA.Identity.Logic.SOL.HenkinPredicateDomain M.Domain where
  Admissible P := (fun arguments => P (arguments 0)) ∈ M.RelationDomain 1
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
def UnaryPredicateDomain {S : Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
    LRA.Identity.Logic.SOL.HenkinPredicateDomain M.Domain where
  Admissible P := (fun arguments => P (arguments 0)) ∈ M.RelationDomain 1

/--
`ToHenkinModel` TODO

Predicate logic:

  noncomputable def ToHenkinModel
      (E : LRA.Identity.EqualityStructure)
      (RelationDomain : forall arity,
        Set ((Fin arity -> E.Carrier) -> Prop))
      (FunctionDomain : forall arity,
        Set ((Fin arity -> E.Carrier) -> E.Carrier)) :
      LRA.ModelTheory.SecondOrder.HenkinModel
        LRA.Identity.pureEqualitySignature

Predicate logic (unfolded):

  noncomputable def ToHenkinModel
      (E : LRA.Identity.EqualityStructure)
      (RelationDomain : forall arity,
        Set ((Fin arity -> E.Carrier) -> Prop))
      (FunctionDomain : forall arity,
        Set ((Fin arity -> E.Carrier) -> E.Carrier)) :
      LRA.ModelTheory.SecondOrder.HenkinModel
        LRA.Identity.pureEqualitySignature

Logical form (Lean):

```lean
noncomputable def ToHenkinModel
    (E : LRA.Identity.EqualityStructure)
    (RelationDomain : forall arity,
      Set ((Fin arity -> E.Carrier) -> Prop))
    (FunctionDomain : forall arity,
      Set ((Fin arity -> E.Carrier) -> E.Carrier)) :
    LRA.ModelTheory.SecondOrder.HenkinModel
      LRA.Identity.pureEqualitySignature
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
noncomputable def ToHenkinModel
    (E : LRA.Identity.EqualityStructure)
    (RelationDomain : forall arity,
      Set ((Fin arity -> E.Carrier) -> Prop))
    (FunctionDomain : forall arity,
      Set ((Fin arity -> E.Carrier) -> E.Carrier)) :
    LRA.ModelTheory.SecondOrder.HenkinModel
      LRA.Identity.pureEqualitySignature := by
  sorry

/--
`HenkinSatisfiesLeibnizIdentity` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableEq Variable] [inst_1 : (arity : Nat) → DecidableEq (RelationVariable arity)] [inst_2 : (arity : Nat) → DecidableEq (FunctionVariable arity)] (M : LRA.ModelTheory.SecondOrder.HenkinModel S) (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable RelationVariable FunctionVariable) (left right : Variable) (property : RelationVariable 1), LRA.ModelTheory.SecondOrder.SOSatisfies M assignment (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableEq Variable] [inst_1 : (arity : Nat) → DecidableEq (RelationVariable arity)] [inst_2 : (arity : Nat) → DecidableEq (FunctionVariable arity)] (M : LRA.ModelTheory.SecondOrder.HenkinModel S) (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable RelationVariable FunctionVariable) (left right : Variable) (property : RelationVariable 1), LRA.ModelTheory.SecondOrder.SOSatisfies M assignment (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

Logical form (Lean):

```lean
def HenkinSatisfiesLeibnizIdentity
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    [DecidableEq Variable]
    [forall arity, DecidableEq (RelationVariable arity)]
    [forall arity, DecidableEq (FunctionVariable arity)]
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S)
    (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable
      RelationVariable FunctionVariable)
    (left right : Variable) (property : RelationVariable 1) : Prop :=
  LRA.ModelTheory.SecondOrder.SOSatisfies M assignment
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
def HenkinSatisfiesLeibnizIdentity
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    [DecidableEq Variable]
    [forall arity, DecidableEq (RelationVariable arity)]
    [forall arity, DecidableEq (FunctionVariable arity)]
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S)
    (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable
      RelationVariable FunctionVariable)
    (left right : Variable) (property : RelationVariable 1) : Prop :=
  LRA.ModelTheory.SecondOrder.SOSatisfies M assignment
    (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

end LRA.Identity.ModelTheory.SOL
