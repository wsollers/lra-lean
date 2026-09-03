import LRA.ProofTheory.System

namespace LRA.ProofTheory

/--
Thin compatibility spine for first-order proof theory. This re-exports the
generic proof-system layer together with the current Takeuti calculi.
-/
abbrev FOLProofSystem := System.ProofSystem
abbrev FOLDERivable := System.Derivable
abbrev FOLLK := System.Takeuti.LK
abbrev FOLLJ := System.Takeuti.LJ

end LRA.ProofTheory
