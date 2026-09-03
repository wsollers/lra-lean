import LRA.ProofTheory.System.Basic
import LRA.ProofTheory.System.Derivation

namespace LRA.ProofTheory

/--
Thin compatibility spine for zero-order/propositional proof theory. This
currently exposes the generic proof-system layer while dedicated propositional
calculi are developed.
-/
abbrev ZOLProofSystem := System.ProofSystem
abbrev ZOLDerivable := System.Derivable

end LRA.ProofTheory
