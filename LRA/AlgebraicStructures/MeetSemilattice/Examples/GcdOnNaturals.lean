import Mathlib.Data.Nat.GCD.Basic
import LRA.AlgebraicStructures.MeetSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.MeetSemilattice.Examples

/--
`gcdIsMeetSemilattice` `(ℕ, gcd)` is a meet-semilattice: `Nat.gcd` is associative, commutative, and idempotent. Stated on all of `ℕ` rather than the positive naturals the divisibility-order presentation usually uses (`(ℕ_{>0}, ∣)` with `a ∧ b := gcd a b`) — the three algebraic laws hold everywhere `Nat.gcd` is defined (including at `0`), so no positivity side-condition is needed to state them; the induced order (`InducedOrder.lean`, `a ≤ b ↔ gcd a b = a`) recovers exactly the divisibility order `∣` on the positives.

Predicate logic:

  LRA.AlgebraicStructures.MeetSemilatticeLaws Nat.gcd

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (first second third : Nat), (first.gcd second).gcd third = first.gcd (second.gcd third)) ∧ ((∀ (first second : Nat), first.gcd second = second.gcd first) ∧ (∀ (element : Nat), element.gcd element = element)))

Logical form (Lean):

```lean
theorem gcdIsMeetSemilattice :
    LRA.AlgebraicStructures.MeetSemilatticeLaws Nat.gcd
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem gcdIsMeetSemilattice :
    LRA.AlgebraicStructures.MeetSemilatticeLaws Nat.gcd := by
  sorry
end LRA.AlgebraicStructures.MeetSemilattice.Examples
