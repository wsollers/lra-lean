import Mathlib.Data.Set.Defs
import LRA.Logic.Syntax.SecondOrderMonadic.Formula
import LRA.ModelTheory.SecondOrderMonadic.Semantics.FullSOAssignment
import LRA.Logic.Semantics.TermEvaluation
import LRA.Logic.Semantics.Assignment

open LRA.Logic
open LRA.Logic.SecondOrderMonadic

namespace LRA.ModelTheory.SecondOrderMonadic

/--
`FullSOSatisfies` Satisfaction for the current monadic second-order syntax under full semantics. The second-order quantifier clause ranges over all subsets of the domain.

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable SetVariable : Type} [inst : DecidableVariable] = [inst_1 : DecidableSetVariable](M : LRA.ModelTheory.SecondOrderMonadic.FullModel S) = assignment : LRA.ModelTheory.SecondOrderMonadic.FullSOAssignment M Variable SetVariable (a : LRA.Logic.SecondOrderMonadic.SOFormula S Variable SetVariable), (LRA.Logic.SecondOrderMonadic.SOFormula.brecOn.go (motive := fun x => LRA.ModelTheory.SecondOrderMonadic.FullSOAssignment M Variable SetVariable → Prop) a (LRA.ModelTheory.SecondOrderMonadic.FullSOSatisfies._f M)).1 assignment

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Logic.SecondOrderMonadic.SOFormula.brecOn.go (motive := fun x => LRA.ModelTheory.SecondOrderMonadic.FullSOAssignment M Variable SetVariable → Prop) a (LRA.ModelTheory.SecondOrderMonadic.FullSOSatisfies._f M)).1 assignment

Logical form (Lean):

```lean
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
