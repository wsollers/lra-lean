import LRA.Logic.Syntax.SecondOrder.Formula
import LRA.ModelTheory.SecondOrder.Semantics.SOAssignment
import LRA.Logic.Semantics.Assignment

open LRA.Logic
open LRA.Logic.SecondOrder

namespace LRA.ModelTheory.SecondOrder

/--
`SOSatisfies` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableVariable] = [inst_1 : (arity : Nat) → DecidableRelationVariable arity = ] [inst_2 : (arity : Nat) → DecidableFunctionVariable arity = ](M : LRA.ModelTheory.SecondOrder.HenkinModel S) (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable RelationVariable FunctionVariable) (a : LRA.Logic.SecondOrder.Formula S Variable RelationVariable FunctionVariable), (LRA.Logic.SecondOrder.Formula.brecOn.go (motive := fun x => LRA.ModelTheory.SecondOrder.SOAssignment M Variable RelationVariable FunctionVariable → Prop) a (LRA.ModelTheory.SecondOrder.SOSatisfies._f M)).1 assignment

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Logic.SecondOrder.Formula.brecOn.go (motive := fun x => LRA.ModelTheory.SecondOrder.SOAssignment M Variable RelationVariable FunctionVariable → Prop) a (LRA.ModelTheory.SecondOrder.SOSatisfies._f M)).1 assignment

Logical form (Lean):

```lean
def SOSatisfies
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [DecidableEq Variable]
    [∀ arity, DecidableEq (RelationVariable arity)]
    [∀ arity, DecidableEq (FunctionVariable arity)]
    (M : HenkinModel S)
    (assignment : SOAssignment M Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable → Prop
  | .relation r args =>
      M.interpretRelation r
        (fun i => SOAssignment.evaluateTerm (assignment.forgetRelations) (args i))
  | .relationVar X args =>
      assignment.relationAssignment X
        (fun i => SOAssignment.evaluateTerm (assignment.forgetRelations) (args i))
  | .equal t₁ t₂ =>
      SOAssignment.evaluateTerm (assignment.forgetRelations) t₁ =
      SOAssignment.evaluateTerm (assignment.forgetRelations) t₂
  | .neg φ =>
      ¬ SOSatisfies M assignment φ
  | .impl φ ψ =>
      SOSatisfies M assignment φ → SOSatisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain,
        SOSatisfies M
          { assignment with elementAssignment := updateAssignment assignment.elementAssignment v a }
          φ
  | .forallRel X φ =>
      ∀ relation_ : (Fin _ → M.Domain) → Prop,
        ∀ hRelation : relation_ ∈ M.RelationDomain _,
          SOSatisfies M
            (assignment.updateRelationAssignment X relation_ hRelation)
            φ
  | .forallFun F φ =>
      ∀ function_ : (Fin _ → M.Domain) → M.Domain,
        ∀ hFunction : function_ ∈ M.FunctionDomain _,
          SOSatisfies M
            (assignment.updateFunctionAssignment F function_ hFunction)
            φ
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
def SOSatisfies
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [DecidableEq Variable]
    [∀ arity, DecidableEq (RelationVariable arity)]
    [∀ arity, DecidableEq (FunctionVariable arity)]
    (M : HenkinModel S)
    (assignment : SOAssignment M Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable → Prop
  | .relation r args =>
      M.interpretRelation r
        (fun i => SOAssignment.evaluateTerm (assignment.forgetRelations) (args i))
  | .relationVar X args =>
      assignment.relationAssignment X
        (fun i => SOAssignment.evaluateTerm (assignment.forgetRelations) (args i))
  | .equal t₁ t₂ =>
      SOAssignment.evaluateTerm (assignment.forgetRelations) t₁ =
      SOAssignment.evaluateTerm (assignment.forgetRelations) t₂
  | .neg φ =>
      ¬ SOSatisfies M assignment φ
  | .impl φ ψ =>
      SOSatisfies M assignment φ → SOSatisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain,
        SOSatisfies M
          { assignment with elementAssignment := updateAssignment assignment.elementAssignment v a }
          φ
  | .forallRel X φ =>
      ∀ relation_ : (Fin _ → M.Domain) → Prop,
        ∀ hRelation : relation_ ∈ M.RelationDomain _,
          SOSatisfies M
            (assignment.updateRelationAssignment X relation_ hRelation)
            φ
  | .forallFun F φ =>
      ∀ function_ : (Fin _ → M.Domain) → M.Domain,
        ∀ hFunction : function_ ∈ M.FunctionDomain _,
          SOSatisfies M
            (assignment.updateFunctionAssignment F function_ hFunction)
            φ

end LRA.ModelTheory.SecondOrder
