import LRA.VolumeI.Logic.Syntax.SecondOrderMonadic.Formula
import LRA.VolumeI.Logic.Semantics.SecondOrderMonadic.SOAssignment
import LRA.VolumeI.Logic.Semantics.TermEvaluation
import LRA.VolumeI.Logic.Semantics.Assignment

namespace LRA.VolumeI.Logic.SecondOrderMonadic

/-!
Second-order satisfaction.

`SOSatisfies M assignment φ` says the monadic second-order formula `φ`
holds in the Henkin model `M` under the second-order assignment
`assignment`. Every case matching a construct `SOFormula` shares with
`FirstOrder.Formula` unfolds exactly as `Satisfies` already does, using
`assignment.elementAssignment` in place of `Satisfies`'s bare assignment;
the two new cases are:

  - `setMember X t` holds when the term `t`, evaluated under
    `assignment.elementAssignment`, is a member of whatever set
    `assignment.setAssignment` currently assigns to `X`;
  - `forallSet X φ` holds when, for *every* set `Y` in `M.SecondOrderDomain`
    (not every subset of `M.Domain` whatsoever -- this is exactly where the
    Henkin restriction takes effect), `φ` holds under the assignment
    updated to send `X` to `Y`.

This is the only place `M.SecondOrderDomain` is actually consulted. Full
semantics would instead quantify over all of `Set M.Domain`; deliberately
avoided here per the standard caution against full second-order semantics
(no complete proof system; compactness and Löwenheim-Skolem both fail).
-/

/-- The second-order satisfaction relation: `M`, under the second-order
assignment `assignment`, satisfies the monadic second-order formula `φ`. -/
def SOSatisfies
    {S : Signature} {Variable SetVariable : Type} [DecidableEq Variable] [DecidableEq SetVariable]
    (M : HenkinModel S) (assignment : SOAssignment M Variable SetVariable) :
    SOFormula S Variable SetVariable -> Prop
  | .relation r args =>
      M.interpretRelation r
        (fun i => FirstOrder.evaluateTerm M.toModel assignment.elementAssignment (args i))
  | .equal t₁ t₂ =>
      FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t₁ =
        FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t₂
  | .neg φ =>
      ¬ SOSatisfies M assignment φ
  | .impl φ ψ =>
      SOSatisfies M assignment φ -> SOSatisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain,
        SOSatisfies M
          { assignment with elementAssignment := updateAssignment assignment.elementAssignment v a }
          φ
  | .setMember X t =>
      FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t ∈ assignment.setAssignment X
  | .forallSet X φ =>
      ∀ Y ∈ M.SecondOrderDomain,
        SOSatisfies M
          { assignment with setAssignment := updateAssignment assignment.setAssignment X Y }
          φ

end LRA.VolumeI.Logic.SecondOrderMonadic
