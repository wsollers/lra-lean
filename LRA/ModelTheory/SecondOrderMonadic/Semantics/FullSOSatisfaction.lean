import Mathlib.Data.Set.Defs
import LRA.Logic.Syntax.SecondOrderMonadic.Formula
import LRA.ModelTheory.SecondOrderMonadic.Semantics.FullSOAssignment
import LRA.Logic.Semantics.TermEvaluation
import LRA.Logic.Semantics.Assignment

open LRA.Logic
open LRA.Logic.SecondOrderMonadic

namespace LRA.ModelTheory.SecondOrderMonadic

/--
Satisfaction for the current monadic second-order syntax under full semantics.
The second-order quantifier clause ranges over all subsets of the domain.
-/
def FullSOSatisfies
    {S : Signature} {Variable SetVariable : Type} [DecidableEq Variable] [DecidableEq SetVariable]
    (M : FullModel S) (assignment : FullSOAssignment M Variable SetVariable) :
    SOFormula S Variable SetVariable → Prop
  | .relation r args =>
      M.interpretRelation r
        (fun i => FirstOrder.evaluateTerm M.toModel assignment.elementAssignment (args i))
  | .equal t₁ t₂ =>
      FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t₁ =
        FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t₂
  | .neg φ =>
      ¬ FullSOSatisfies M assignment φ
  | .impl φ ψ =>
      FullSOSatisfies M assignment φ → FullSOSatisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain,
        FullSOSatisfies M
          { assignment with elementAssignment := updateAssignment assignment.elementAssignment v a }
          φ
  | .setMember X t =>
      FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t ∈ assignment.setAssignment X
  | .forallSet X φ =>
      ∀ Y : Set M.Domain,
        FullSOSatisfies M
          (assignment.updateSetAssignment X Y)
          φ

end LRA.ModelTheory.SecondOrderMonadic
