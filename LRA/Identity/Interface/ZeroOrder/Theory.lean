import LRA.Identity.Interface.ZeroOrder.Model

namespace LRA.Identity.Interface.ZeroOrder

/--
`Theory` TODO

Predicate logic:

  ∀ {L : LRA.Identity.Interface.ZeroOrder.LStructure} {M : LRA.Identity.Interface.ZeroOrder.Model L}, ((∀ (formula : L.Formula), formula = formula) ∧ (∀ {left right : L.Formula}, left = right → M.Holds left ↔ M.Holds right))

Predicate logic (unfolded):

  ∀ {L : LRA.Identity.Interface.ZeroOrder.LStructure} {M : LRA.Identity.Interface.ZeroOrder.Model L}, ((∀ (formula : L.Formula), formula = formula) ∧ (∀ {left right : L.Formula}, left = right → M.Holds left ↔ M.Holds right))

Logical form (Lean):

```lean
structure Theory (L : LStructure) (M : Model L) : Prop where
  reflexivity : forall formula : L.Formula, formula = formula
  substitution : forall {left right : L.Formula}, left = right ->
    (M.Holds left <-> M.Holds right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure Theory (L : LStructure) (M : Model L) : Prop where
  reflexivity : forall formula : L.Formula, formula = formula
  substitution : forall {left right : L.Formula}, left = right ->
    (M.Holds left <-> M.Holds right)

end LRA.Identity.Interface.ZeroOrder
