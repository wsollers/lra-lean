import LRA.Identity.Interface.Logic.ZOL.Equivalence

namespace LRA.Identity.Logic.ZOL

open LRA.Logic.Propositional

/--
`RespectsFormulaEquivalence` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (connective : LRA.Logic.Propositional.Formula L → LRA.Logic.Propositional.Formula L) {phi psi : LRA.Logic.Propositional.Formula L}, LRA.Identity.Logic.ZOL.FormulaEquivalence phi psi → LRA.Identity.Logic.ZOL.FormulaEquivalence (connective phi) (connective psi)

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Propositional.PropositionalLanguage} (connective : LRA.Logic.Propositional.Formula L → LRA.Logic.Propositional.Formula L) {phi psi : LRA.Logic.Propositional.Formula L}, (∀ (valuation : L.Atoms → Bool), LRA.Logic.Propositional.evaluate valuation phi = LRA.Logic.Propositional.evaluate valuation psi) → ∀ (valuation : L.Atoms → Bool), LRA.Logic.Propositional.evaluate valuation (connective phi) = LRA.Logic.Propositional.evaluate valuation (connective psi)

Logical form (Lean):

```lean
def RespectsFormulaEquivalence {L : PropositionalLanguage}
    (connective : Formula L -> Formula L) : Prop :=
  forall {phi psi}, FormulaEquivalence phi psi ->
    FormulaEquivalence (connective phi) (connective psi)
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
def RespectsFormulaEquivalence {L : PropositionalLanguage}
    (connective : Formula L -> Formula L) : Prop :=
  forall {phi psi}, FormulaEquivalence phi psi ->
    FormulaEquivalence (connective phi) (connective psi)

end LRA.Identity.Logic.ZOL
