import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Definitions
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Theorems
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Satisfies
import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Definitions
import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Theorems
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Satisfies
import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Satisfies

/-!
The axiomatic identity construction is organized by logical strength. Shared
relation-theory scaffolding lives in `Common`; reflexivity, first-order
substitution, and full second-order Leibniz substitution each own their axiom,
definitions, immediate theorems, and satisfaction bridge. Derived identity
notions belong in `LRA.Identity.Laws`, not in this primitive layer.
-/
