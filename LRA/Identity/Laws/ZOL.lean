import LRA.Identity.Interface.Logic.ZOL

namespace LRA.Identity.Logic.ZOL

open LRA.Logic.Propositional

/-- Zero-order formula equivalence is reflexive.

Logical form: `phi ~= phi`.
-/
theorem FormulaEquivalenceReflexive {L : PropositionalLanguage} (phi : Formula L) :
    FormulaEquivalence phi phi := by
  sorry

end LRA.Identity.Logic.ZOL
