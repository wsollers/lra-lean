import Mathlib.Algebra.Order.Archimedean.Defs
import LRA.AlgebraicStructures.Archimedean.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- `IteratedSelfSum` is one-indexed (`IteratedSelfSum 0 x = x = 1 • x`), Mathlib's
`nsmul` is zero-indexed (`0 • x = 0`) — this is the reindexing between them. -/
theorem iteratedSelfSum_eq_nsmul {R : Type u} [AddMonoid R] (n : Nat) (x : R) :
    IteratedSelfSum n x = (n + 1) • x := by
  sorry
/-- Mathlib already has this exact concept (`Archimedean`, for ordered additive
commutative monoids): "for `y > 0`, every `x` is below some multiple of `y`". The
only real work is the strict-vs-non-strict mismatch (`Multiples` needs `<`, Mathlib's
`arch` gives `≤`) and the one-indexing above — both handled by taking one extra
copy of `x`. -/
instance {R : Type u} [AddCommMonoid R] [PartialOrder R]
    [CovariantClass R R (· + ·) (· < ·)] [_root_.Archimedean R] : ArchimedeanLaw R where
  MultiplesAreCofinal := by
    sorry
end LRA.AlgebraicStructures
