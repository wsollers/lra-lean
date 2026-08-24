import LRA.Logic.Syntax.SecondOrderMonadic.Formula
import LRA.Logic.Semantics.SecondOrderMonadic.SOAssignment
import LRA.Logic.Semantics.TermEvaluation
import LRA.Logic.Semantics.Assignment

namespace LRA.Logic.SecondOrderMonadic

/--
`SOSatisfies` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable SetVariable : Type} [inst : DecidableVariable] = [inst_1 : DecidableSetVariable](M : LRA.Logic.SecondOrderMonadic.HenkinModel S) = assignment : LRA.Logic.SecondOrderMonadic.SOAssignment M Variable SetVariable (a : LRA.Logic.SecondOrderMonadic.SOFormula S Variable SetVariable), (LRA.Logic.SecondOrderMonadic.SOFormula.brecOn.go (motive := fun x => LRA.Logic.SecondOrderMonadic.SOAssignment M Variable SetVariable → Prop) a (LRA.Logic.SecondOrderMonadic.SOSatisfies._f M)).1 assignment

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable SetVariable : Type} [inst : (a b : Variable) → Decidable (a = b)] [inst_1 : (a b : SetVariable) → Decidable (a = b)](M : LRA.Logic.SecondOrderMonadic.HenkinModel S) (assignment : LRA.Logic.SecondOrderMonadic.SOAssignment M Variable SetVariable) (a : LRA.Logic.SecondOrderMonadic.SOFormula S Variable SetVariable), (LRA.Logic.SecondOrderMonadic.SOFormula.brecOn.go (motive := fun x => LRA.Logic.SecondOrderMonadic.SOAssignment M Variable SetVariable → Prop) a (LRA.Logic.SecondOrderMonadic.SOSatisfies._f M)).1 assignment

Logical form (Lean):

```lean
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
      ∀ Y, ∀ hY : Y ∈ M.SecondOrderDomain,
        SOSatisfies M
          (assignment.updateSetAssignment X Y hY)
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
      ∀ Y, ∀ hY : Y ∈ M.SecondOrderDomain,
        SOSatisfies M
          (assignment.updateSetAssignment X Y hY)
          φ

end LRA.Logic.SecondOrderMonadic
