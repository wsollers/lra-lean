import LRA.Logic.Syntax.SecondOrder.Formula
import LRA.ModelTheory.SecondOrder.Semantics.SOAssignment
import LRA.Logic.Semantics.Assignment

open LRA.Logic
open LRA.Logic.SecondOrder

namespace LRA.ModelTheory.SecondOrder

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
