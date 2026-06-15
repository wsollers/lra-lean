-- LRA/VolumeII/NaturalNumbers/Arithmetic.lean
--
-- ℕ as a MODEL of the algebraic bundles. Natural-number addition and
-- multiplication are concrete binary operations on Lean's `Nat`; their
-- law certificates cite core `Nat.*` lemmas (the same convention StandardN
-- uses for the Nat-backed Peano system), and the certificates travel into
-- the CommutativeMonoid fields.
--
-- The characterization lemmas (ApplyNaturalNumber…) are proven by rewriting
-- with Foundations.pair_fst / pair_snd rather than bare `rfl`, so they do not
-- depend on the `pair` reduction being definitional.

import LRA.VolumeI.Algebra.Bundles

namespace LRA.VolumeII.NaturalNumbers.Arithmetic

open LRA.VolumeI.Foundations
open LRA.VolumeI.Algebra.Operations
open LRA.VolumeI.Algebra.Laws
open LRA.VolumeI.Algebra.Bundles

-- ── Concrete operations on ℕ ────────────────────────────────────────────────

/-- Natural-number addition as a binary operation (tuple form). -/
def NaturalNumberAddition : BinaryOperation Nat :=
  fun tuple => tuple i₀ + tuple i₁

/-- Natural-number multiplication as a binary operation (tuple form). -/
def NaturalNumberMultiplication : BinaryOperation Nat :=
  fun tuple => tuple i₀ * tuple i₁

-- ── Characterization lemmas (pay the pair plumbing once, each) ──────────────

/-- Applying the addition operation to `first` and `second` is `first + second`. -/
theorem ApplyNaturalNumberAddition (first second : Nat) :
    ApplyBinaryOperation NaturalNumberAddition first second = first + second := by
  show pair first second i₀ + pair first second i₁ = first + second
  rw [pair_fst first second, pair_snd first second]

/-- Applying the multiplication operation to `first` and `second` is `first * second`. -/
theorem ApplyNaturalNumberMultiplication (first second : Nat) :
    ApplyBinaryOperation NaturalNumberMultiplication first second = first * second := by
  show pair first second i₀ * pair first second i₁ = first * second
  rw [pair_fst first second, pair_snd first second]

-- ── Additive certificates ───────────────────────────────────────────────────

theorem NaturalNumberAdditionIsAssociative : IsAssociative NaturalNumberAddition := by
  intro first second third
  simp only [ApplyNaturalNumberAddition]
  exact Nat.add_assoc first second third

theorem NaturalNumberAdditionIsCommutative : IsCommutative NaturalNumberAddition := by
  intro first second
  simp only [ApplyNaturalNumberAddition]
  exact Nat.add_comm first second

theorem NaturalNumberAdditionHasIdentityZero : IsIdentity NaturalNumberAddition 0 := by
  constructor
  · intro element
    simp only [ApplyNaturalNumberAddition]
    exact Nat.zero_add element
  · intro element
    simp only [ApplyNaturalNumberAddition]
    exact Nat.add_zero element

-- ── Multiplicative certificates ─────────────────────────────────────────────

theorem NaturalNumberMultiplicationIsAssociative : IsAssociative NaturalNumberMultiplication := by
  intro first second third
  simp only [ApplyNaturalNumberMultiplication]
  exact Nat.mul_assoc first second third

theorem NaturalNumberMultiplicationIsCommutative : IsCommutative NaturalNumberMultiplication := by
  intro first second
  simp only [ApplyNaturalNumberMultiplication]
  exact Nat.mul_comm first second

theorem NaturalNumberMultiplicationHasIdentityOne : IsIdentity NaturalNumberMultiplication 1 := by
  constructor
  · intro element
    simp only [ApplyNaturalNumberMultiplication]
    exact Nat.one_mul element
  · intro element
    simp only [ApplyNaturalNumberMultiplication]
    exact Nat.mul_one element

-- ── ℕ as a model of CommutativeMonoid (additive and multiplicative) ─────────

/-- ℕ under addition, with `0`, is a commutative monoid. -/
def NaturalNumberAdditiveMonoid : CommutativeMonoid where
  Carrier := Nat
  Operation := NaturalNumberAddition
  IdentityElement := 0
  OperationIsAssociative := NaturalNumberAdditionIsAssociative
  OperationIsCommutative := NaturalNumberAdditionIsCommutative
  OperationHasIdentity := NaturalNumberAdditionHasIdentityZero

/-- ℕ under multiplication, with `1`, is a commutative monoid. -/
def NaturalNumberMultiplicativeMonoid : CommutativeMonoid where
  Carrier := Nat
  Operation := NaturalNumberMultiplication
  IdentityElement := 1
  OperationIsAssociative := NaturalNumberMultiplicationIsAssociative
  OperationIsCommutative := NaturalNumberMultiplicationIsCommutative
  OperationHasIdentity := NaturalNumberMultiplicationHasIdentityOne

/-- Existence witness: the CommutativeMonoid interface is inhabited (not vacuous). -/
theorem CommutativeMonoidExists : Nonempty CommutativeMonoid :=
  ⟨NaturalNumberAdditiveMonoid⟩

end LRA.VolumeII.NaturalNumbers.Arithmetic
