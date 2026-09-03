import LRA.Logic.Syntax.Term
import LRA.Logic.Syntax.FirstOrder

namespace LRA.Logic

/--
Thin compatibility spine for first-order syntax. This keeps the generic term
and formula layer available under a stable `FOL`-named import.
-/
abbrev FOLTerm := FirstOrder.Term
abbrev FOLFormula := FirstOrder.Formula
abbrev FOLSentence := FirstOrder.Sentence

end LRA.Logic
