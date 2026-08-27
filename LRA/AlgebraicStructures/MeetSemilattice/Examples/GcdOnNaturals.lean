import Mathlib.Data.Nat.GCD.Basic
import LRA.AlgebraicStructures.MeetSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.MeetSemilattice.Examples

/-- `(ℕ, gcd)` is a meet-semilattice: `Nat.gcd` is associative, commutative,
and idempotent. Stated on all of `ℕ` rather than the positive naturals the
divisibility-order presentation usually uses (`(ℕ_{>0}, ∣)` with `a ∧ b :=
gcd a b`) — the three algebraic laws hold everywhere `Nat.gcd` is defined
(including at `0`), so no positivity side-condition is needed to state them;
the induced order (`InducedOrder.lean`, `a ≤ b ↔ gcd a b = a`) recovers exactly
the divisibility order `∣` on the positives. -/
theorem gcdIsMeetSemilattice :
    LRA.AlgebraicStructures.MeetSemilatticeLaws Nat.gcd := by
  sorry

end LRA.AlgebraicStructures.MeetSemilattice.Examples
