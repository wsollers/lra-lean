import LRA.Logic.Syntax.SecondOrder.Formula
import LRA.ModelTheory.SecondOrder.Semantics.FullSOAssignment
import LRA.Logic.Semantics.Assignment

open LRA.Logic
open LRA.Logic.SecondOrder

namespace LRA.ModelTheory.SecondOrder

def FullSOSatisfies
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    [DecidableEq Variable]
    [∀ arity, DecidableEq (RelationVariable arity)]
    [∀ arity, DecidableEq (FunctionVariable arity)]
    (M : FullModel S)
    (assignment : FullSOAssignment M Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable → Prop
  | .relation r args =>
      M.interpretRelation r
        (fun i => FullSOAssignment.evaluateTerm (assignment.forgetRelations) (args i))
  | .relationVar X args =>
      assignment.relationAssignment X
        (fun i => FullSOAssignment.evaluateTerm (assignment.forgetRelations) (args i))
  | .equal t₁ t₂ =>
      FullSOAssignment.evaluateTerm (assignment.forgetRelations) t₁ =
      FullSOAssignment.evaluateTerm (assignment.forgetRelations) t₂
  | .neg φ =>
      ¬ FullSOSatisfies M assignment φ
  | .impl φ ψ =>
      FullSOSatisfies M assignment φ → FullSOSatisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain,
        FullSOSatisfies M
          { assignment with elementAssignment := updateAssignment assignment.elementAssignment v a }
          φ
  | .forallRel X φ =>
      ∀ relation_ : (Fin _ → M.Domain) → Prop,
          FullSOSatisfies M
            (assignment.updateRelationAssignment X relation_)
            φ
  | .forallFun F φ =>
      ∀ function_ : (Fin _ → M.Domain) → M.Domain,
          FullSOSatisfies M
            (assignment.updateFunctionAssignment F function_)
            φ

end LRA.ModelTheory.SecondOrder
