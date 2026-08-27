import LRA.Order.Bounds.Cofinal.Definition
import LRA.Set.Constructions.TypeSet.Definition

namespace LRA.AlgebraicStructures

universe u

/-- `n`-fold self-sum of `x`, indexed from `0` rather than `1`:
`IteratedSelfSum 0 x = x` (one copy), `IteratedSelfSum n x = (n + 1) • x` in
Mathlib's `nsmul` terms. Harmless for the Archimedean property below — a
cofinal set of "at least one copy" multiples is cofinal iff the set including
the `0`-copy (`0 • x = 0`) is, since `0` is never a needed witness except when
`point < 0`, and `IteratedSelfSum 0 x = x` already covers that case. -/
def IteratedSelfSum {R : Type u} [Add R] : Nat → R → R
  | 0, x => x
  | n + 1, x => IteratedSelfSum n x + x

/-- The set of (one-indexed) multiples of `x`. -/
def Multiples {R : Type u} [Add R] (x : R) : LRA.Set.Constructions.TypeSet R :=
  fun y => exists n : Nat, y = IteratedSelfSum n x

/-- The Archimedean property for an ordered additive structure `(R, +, <, 0)`:
for every positive `x`, the multiples of `x` are cofinal under `<` — for every
`point : R`, some multiple of `x` exceeds it. This is the standard formulation
for ordered groups and ordered fields alike (`∀ a > 0, ∀ b, ∃ n, n·a > b`); the
purely-algebraic (unordered) formulation via divisibility in a commutative
semigroup, and the valuation-theoretic (Ostrowski) formulation for absolute
values, are different mathematical settings entirely and are not what this
class states — they'd need their own home if ever formalized, not a case split
inside this one. -/
class ArchimedeanLaw (R : Type u)
    [Add R] [LT R] [OfNat R 0] : Prop where
  MultiplesAreCofinal :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x)

section Wrappers

variable {R : Type u}

theorem MultiplesAreCofinal
    [Add R] [LT R] [OfNat R 0] [ArchimedeanLaw R] :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x) := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
