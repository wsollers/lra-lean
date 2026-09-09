import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Axiom

namespace LRA.Identity.Constructions.Axiomatic

/--
`SecondOrderLeibnizImpliesFirstOrderLeibniz` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (Variable : Type) [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S), LRA.Identity.Constructions.Axiomatic.FirstOrderLeibnizPrinciple Variable M

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (Variable : Type) [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S) (x y : M.Domain), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : M.Domain → Prop), ((∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M (LRA.Logic.updateAssignment assignment distinguished value) formula) ∧ P x) → P y

Logical form (Lean):

```lean
theorem SecondOrderLeibnizImpliesFirstOrderLeibniz
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    FirstOrderLeibnizPrinciple Variable M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SecondOrderLeibnizImpliesFirstOrderLeibniz
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    FirstOrderLeibnizPrinciple Variable M := by

  intro x y h P hDef hx
  exact Ax_LeibnizLaw h P hx



end LRA.Identity.Constructions.Axiomatic
