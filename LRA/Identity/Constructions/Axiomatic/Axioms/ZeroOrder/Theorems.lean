import LRA.Identity.Constructions.Axiomatic.Axioms.ZeroOrder.Axiom

namespace LRA.Identity.Constructions.Axiomatic.ZeroOrder

/--
`Theory` TODO

Predicate logic:

  ∀ (L : LRA.Identity.Interface.ZeroOrder.LStructure) (M : LRA.Identity.Interface.ZeroOrder.Model L), LRA.Identity.Interface.ZeroOrder.Theory L M

Predicate logic (unfolded):

  ∀ (L : LRA.Identity.Interface.ZeroOrder.LStructure) (M : LRA.Identity.Interface.ZeroOrder.Model L), ((∀ (formula : L.Formula), formula = formula) ∧ (∀ {left right : L.Formula}, left = right → M.Holds left ↔ M.Holds right))

Logical form (Lean):

```lean
theorem Theory
    (L : LRA.Identity.Interface.ZeroOrder.LStructure)
    (M : LRA.Identity.Interface.ZeroOrder.Model L) :
    LRA.Identity.Interface.ZeroOrder.Theory L M
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
theorem Theory
    (L : LRA.Identity.Interface.ZeroOrder.LStructure)
    (M : LRA.Identity.Interface.ZeroOrder.Model L) :
    LRA.Identity.Interface.ZeroOrder.Theory L M := by
  exact {
    reflexivity := by
      intro formula
      rfl
    substitution := by
      intro left right h
      cases h
      exact Iff.rfl
  }

end LRA.Identity.Constructions.Axiomatic.ZeroOrder
