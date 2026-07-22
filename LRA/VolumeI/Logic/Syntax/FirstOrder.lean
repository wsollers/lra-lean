import LRA.VolumeI.Logic.Syntax.FirstOrder.Formula
import LRA.VolumeI.Logic.Syntax.FirstOrder.FreeVariablesInTerm
import LRA.VolumeI.Logic.Syntax.FirstOrder.FreeVariables
import LRA.VolumeI.Logic.Syntax.FirstOrder.AllVariables
import LRA.VolumeI.Logic.Syntax.FirstOrder.IsSubstitutable
import LRA.VolumeI.Logic.Syntax.FirstOrder.SubstituteInTerm
import LRA.VolumeI.Logic.Syntax.FirstOrder.Substitute
import LRA.VolumeI.Logic.Syntax.FirstOrder.SubstitutionFreeVariables
import LRA.VolumeI.Logic.Syntax.FirstOrder.Subformula
import LRA.VolumeI.Logic.Syntax.FirstOrder.Sentence

/-!
Aggregate import shim for `Syntax/FirstOrder/`: first-order formulas, free
variables of terms and formulas, the capture-avoidance side condition
`IsSubstitutable`, substitution itself (`substituteInTerm`/`substitute`),
free-variable bounds for substitution, the collection of all (free and
bound) variables (`allVariables`), the subformula relation
(`IsSubformula`), and closed formulas/sentences.
-/
