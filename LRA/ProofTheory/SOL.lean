import LRA.ProofTheory.System.Basic
import LRA.ProofTheory.System.Derivation

namespace LRA.ProofTheory

/--
Thin compatibility spine for second-order proof theory. This currently exposes
the generic proof-system layer only; second-order-specific calculi can be added
under this standardized surface later.
-/
abbrev SOLProofSystem := System.ProofSystem
abbrev SOLDERivable := System.Derivable

end LRA.ProofTheory
