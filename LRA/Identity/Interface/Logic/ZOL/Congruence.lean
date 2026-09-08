import LRA.Identity.Interface.Logic.ZOL.Equivalence

namespace LRA.Identity.Logic.ZOL

open LRA.Logic.Propositional

/-- A propositional connective respects zero-order formula equivalence.

Logical form: `phi ~= psi -> connective phi ~= connective psi`.
-/
def RespectsFormulaEquivalence {L : PropositionalLanguage}
    (connective : Formula L -> Formula L) : Prop :=
  forall {phi psi}, FormulaEquivalence phi psi ->
    FormulaEquivalence (connective phi) (connective psi)

end LRA.Identity.Logic.ZOL
