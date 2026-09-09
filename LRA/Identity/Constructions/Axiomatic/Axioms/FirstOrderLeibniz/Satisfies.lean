import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Satisfies

namespace LRA.Identity.Constructions.Axiomatic

/--
`SatisfiesFOLModelIdentity` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (Variable : Type) [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S), LRA.Identity.Logic.FOL.ModelIdentityTheory Variable M LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (Variable : Type) [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S), ((∀ (x : M.Domain), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : M.Domain), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : M.Domain → Prop), (∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M (LRA.Logic.updateAssignment assignment distinguished value) formula) → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesFOLModelIdentity
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    LRA.Identity.Logic.FOL.ModelIdentityTheory Variable M
      (Ax_IdentityRelation : M.Domain -> M.Domain -> Prop)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem SatisfiesFOLModelIdentity
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    LRA.Identity.Logic.FOL.ModelIdentityTheory Variable M
      (Ax_IdentityRelation : M.Domain -> M.Domain -> Prop) := by

  constructor
  . -- reflexive
    intro x
    have xEx := Ax_IdentityReflexivity x
    exact xEx

  . -- Leibniz
    intro x y hIdentity
    intro P
    intro hDefinable hPx
    --#check Ax_FirstOrderLeibnizLaw
    have hPy :=  Ax_FirstOrderLeibnizLaw Variable M x y
    have Py := hPy hIdentity P hDefinable hPx
    exact Py


end LRA.Identity.Constructions.Axiomatic
