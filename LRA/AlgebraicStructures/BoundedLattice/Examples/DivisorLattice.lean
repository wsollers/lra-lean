import Mathlib.Data.Nat.GCD.Basic
import LRA.AlgebraicStructures.BoundedLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.BoundedLattice.Examples

variable {n : Nat}

/-- The divisors of a fixed `n > 0`, ordered by divisibility — `(𝒟_n, lcm,
gcd, 1, n)`. Bottom is `1` (divides everything, including every divisor of
`n`), top is `n` itself (every divisor of `n` divides `n`, trivially). `lcm`/
`gcd` of two divisors of `n` stay divisors of `n` — `lcmStaysDivisor` is the
one non-trivial closure fact (`gcdStaysDivisor` is immediate, `gcd a b ∣ a`).
-/
def Divisors (n : Nat) : Type := {d : Nat // d ∣ n}

theorem lcmStaysDivisor (a b : Divisors n) : Nat.lcm a.1 b.1 ∣ n := by
  sorry
theorem gcdStaysDivisor (a b : Divisors n) : Nat.gcd a.1 b.1 ∣ n := by
  sorry
def divisorJoin (a b : Divisors n) : Divisors n := ⟨Nat.lcm a.1 b.1, lcmStaysDivisor a b⟩
def divisorMeet (a b : Divisors n) : Divisors n := ⟨Nat.gcd a.1 b.1, gcdStaysDivisor a b⟩

theorem divisorLatticeIsBounded :
    LRA.AlgebraicStructures.BoundedLatticeLaws
      (divisorJoin (n := n)) (divisorMeet (n := n))
      (⟨1, one_dvd n⟩ : Divisors n) (⟨n, dvd_refl n⟩ : Divisors n) := by
  sorry
end LRA.AlgebraicStructures.BoundedLattice.Examples
