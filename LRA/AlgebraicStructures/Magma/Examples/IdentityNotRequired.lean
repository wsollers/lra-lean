import LRA.Operation.Laws.Identity.Definition
import LRA.AlgebraicStructures.Magma.Examples.RockPaperScissors

namespace LRA.AlgebraicStructures.Magma.Examples

open LRA.Operation.Laws.Identity

/-- A magma needs no identity element — Rock-Paper-Scissors witnesses this: every
candidate fails to be even a *left* identity, let alone two-sided. -/
theorem rpsHasNoIdentity :
    ¬ ∃ e : RPS, TwoSidedIdentity (fun a b : RPS => a * b) e := by
  sorry

end LRA.AlgebraicStructures.Magma.Examples
