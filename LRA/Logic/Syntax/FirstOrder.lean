import LRA.Logic.Syntax.FirstOrder.Formula
import LRA.Logic.Syntax.FirstOrder.FreeVariablesInTerm
import LRA.Logic.Syntax.FirstOrder.FreeVariables
import LRA.Logic.Syntax.FirstOrder.AllVariables
import LRA.Logic.Syntax.FirstOrder.IsSubstitutable
import LRA.Logic.Syntax.FirstOrder.SubstituteInTerm
import LRA.Logic.Syntax.FirstOrder.Substitute
import LRA.Logic.Syntax.FirstOrder.SubstitutionFreeVariables
import LRA.Logic.Syntax.FirstOrder.Subformula
import LRA.Logic.Syntax.FirstOrder.Sentence

/-!
Aggregate import for `Syntax/FirstOrder/`: first-order formulas, free
variables of terms and formulas, the capture-avoidance side condition
`IsSubstitutable`, substitution itself (`substituteInTerm`/`substitute`),
free-variable bounds for substitution, the collection of all (free and
bound) variables (`allVariables`), the subformula relation
(`IsSubformula`), and closed formulas/sentences.
-/
