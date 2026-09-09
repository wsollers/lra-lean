import LRA.Identity.Interface.FirstOrder.Model
import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Interface.FirstOrder

/--
`Theory` TODO

Predicate logic:

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} {Variable : Type} [inst : DecidableEq Variable] {M : LRA.Identity.Interface.FirstOrder.Model L}, ((∀ (x : M.interpretation.Domain), M.Identity x x) ∧ LRA.Identity.Logic.FOL.LeibnizSchema (LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation) M.Identity)

Predicate logic (unfolded):

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} {Variable : Type} [inst : DecidableEq Variable] {M : LRA.Identity.Interface.FirstOrder.Model L}, ((∀ (x : M.interpretation.Domain), M.Identity x x) ∧ (∀ (x y : M.interpretation.Domain), M.Identity x y → ∀ (P : M.interpretation.Domain → Prop), (∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.interpretation.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M.interpretation (LRA.Logic.updateAssignment assignment distinguished value) formula) → P x → P y))

Logical form (Lean):

```lean
structure Theory (L : LStructure) (Variable : Type) [DecidableEq Variable]
    (M : Model L) : Prop where
  reflexivity : forall x, M.Identity x x
  leibniz : LRA.Identity.Logic.FOL.LeibnizSchema
    (LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation)
    M.Identity
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
structure Theory (L : LStructure) (Variable : Type) [DecidableEq Variable]
    (M : Model L) : Prop where
  reflexivity : forall x, M.Identity x x
  leibniz : LRA.Identity.Logic.FOL.LeibnizSchema
    (LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation)
    M.Identity

end LRA.Identity.Interface.FirstOrder
