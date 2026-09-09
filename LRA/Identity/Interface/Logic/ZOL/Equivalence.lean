import LRA.Logic.Syntax.Propositional.Formula

namespace LRA.Identity.Logic.ZOL

open LRA.Logic.Propositional

/--
`FormulaEquivalence` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (phi psi : LRA.Logic.Propositional.Formula L) (valuation : L.Atoms → Bool), LRA.Logic.Propositional.evaluate valuation phi = LRA.Logic.Propositional.evaluate valuation psi

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (phi psi : LRA.Logic.Propositional.Formula L) (valuation : L.Atoms → Bool), LRA.Logic.Propositional.evaluate valuation phi = LRA.Logic.Propositional.evaluate valuation psi

Logical form (Lean):

```lean
def FormulaEquivalence {L : PropositionalLanguage} (phi psi : Formula L) : Prop :=
  forall valuation : L.Atoms -> Bool, evaluate valuation phi = evaluate valuation psi
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
def FormulaEquivalence {L : PropositionalLanguage} (phi psi : Formula L) : Prop :=
  forall valuation : L.Atoms -> Bool, evaluate valuation phi = evaluate valuation psi

end LRA.Identity.Logic.ZOL
