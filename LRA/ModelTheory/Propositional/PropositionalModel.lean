import LRA.Logic.Syntax.Propositional.Formula

open LRA.Logic

open LRA.Logic.Propositional

namespace LRA.ModelTheory.Propositional

/--
`PropositionalModel` TODO

Predicate logic:

  structure PropositionalModel (L : PropositionalLanguage) where
  valuation : L.Atoms -> Bool

Predicate logic (unfolded):

  structure PropositionalModel (L : PropositionalLanguage) where
  valuation : L.Atoms -> Bool (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PropositionalModel (L : PropositionalLanguage) where
  valuation : L.Atoms -> Bool
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
structure PropositionalModel (L : PropositionalLanguage) where
  valuation : L.Atoms -> Bool

/--
`PropositionalModel.satisfies` TODO

Predicate logic:

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (M : LRA.ModelTheory.Propositional.PropositionalModel L) (φ : LRA.ModelTheory.Propositional.Formula L), LRA.ModelTheory.Propositional.evaluate M.valuation φ = Bool.true

Predicate logic (unfolded):

  ∀ {L : LRA.ModelTheory.Propositional.PropositionalLanguage} (M : LRA.ModelTheory.Propositional.PropositionalModel L) (φ : LRA.ModelTheory.Propositional.Formula L), LRA.ModelTheory.Propositional.evaluate M.1 φ = Bool.true

Logical form (Lean):

```lean
def PropositionalModel.satisfies
    {L : PropositionalLanguage} (M : PropositionalModel L) (φ : Formula L) : Prop :=
  evaluate M.valuation φ = true
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def PropositionalModel.satisfies
    {L : PropositionalLanguage} (M : PropositionalModel L) (φ : Formula L) : Prop :=
  evaluate M.valuation φ = true

scoped notation:50 M " ⊨ₚ " φ => PropositionalModel.satisfies M φ

end LRA.ModelTheory.Propositional
