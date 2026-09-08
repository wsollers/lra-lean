import LRA.Logic.Syntax.Propositional.Formula

namespace LRA.Identity.Logic.ZOL

open LRA.Logic.Propositional

/-- At the zero-order level, the identity-like notion between formulas is
semantic logical equivalence, not object-language equality.

Logical form: `forall valuation, eval valuation phi = eval valuation psi`.
-/
def FormulaEquivalence {L : PropositionalLanguage} (phi psi : Formula L) : Prop :=
  forall valuation : L.Atoms -> Bool, evaluate valuation phi = evaluate valuation psi

end LRA.Identity.Logic.ZOL
