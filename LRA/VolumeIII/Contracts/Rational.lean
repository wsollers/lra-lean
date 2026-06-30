-- LRA/VolumeIII/Contracts/Rational.lean
--
-- THE ℚ CONTRACT  (ordered field, Archimedean, densely ordered — NOT complete).
--
-- Gains over ℤ: multiplicative inverses (field). Distinguishing obligation:
-- `IsDenselyOrdered`. Pointedly LACKS a completeness obligation — that gap is
-- exactly what ℝ fills. Partner: Mathlib `ℚ`.

import Mathlib
import LRA.VolumeIII.Contracts.Integer

namespace LraRationals
open LraIntegers (LraInt)

/-- **[LraRat]** Rationals as fractions of integers: the quotient of
`LraInt × {d : LraInt // d ≠ 0}` by `(a,b) ~ (c,d) ↔ a*d = c*b`. The pair
structure is the pre-quotient stub; the genuine quotient is built in Claude
Code, where equality respects cross-multiplication. -/
structure LraRat where
  num : LraInt
  den : LraInt
  den_nonzero : den ≠ 0

namespace LraRat

instance : Zero LraRat := ⟨sorry⟩
instance : One LraRat := ⟨sorry⟩
instance : Add LraRat := ⟨fun _ _ => sorry⟩
instance : Neg LraRat := ⟨fun _ => sorry⟩
instance : Mul LraRat := ⟨fun _ _ => sorry⟩
instance : Inv LraRat := ⟨fun _ => sorry⟩
instance : Preorder LraRat where
  le _ _ := sorry
  le_refl _ := sorry
  le_trans _ _ _ _ _ := sorry

-- ── OBLIGATIONS (ordered field + density) ──
/-- **[Addition Is Commutative]** -/ theorem AdditionIsCommutative (a b : LraRat) : a + b = b + a := sorry
/-- **[Addition Is Associative]** -/ theorem AdditionIsAssociative (a b c : LraRat) : a + b + c = a + (b + c) := sorry
/-- **[Zero Is an Additive Identity]** -/ theorem ZeroIsLeftIdentity (a : LraRat) : 0 + a = a := sorry
/-- **[Negation Is an Additive Inverse]** -/ theorem NegationIsLeftInverse (a : LraRat) : -a + a = 0 := sorry
/-- **[Multiplication Is Commutative]** -/ theorem MultiplicationIsCommutative (a b : LraRat) : a * b = b * a := sorry
/-- **[Multiplication Is Associative]** -/ theorem MultiplicationIsAssociative (a b c : LraRat) : a * b * c = a * (b * c) := sorry
/-- **[One Is a Multiplicative Identity]** -/ theorem OneIsLeftIdentity (a : LraRat) : 1 * a = a := sorry
/-- **[Multiplication Distributes]** -/ theorem MultiplicationLeftDistributes (a b c : LraRat) : a * (b + c) = a * b + a * c := sorry
/-- **[Inverse Is a Left Inverse]** THE field obligation: every nonzero is invertible. -/
theorem InverseIsLeftInverse {a : LraRat} (ha : a ≠ 0) : a⁻¹ * a = 1 := sorry
/-- **[Zero Is Not One]** -/ theorem ZeroIsNotOne : (0 : LraRat) ≠ 1 := sorry
/-- **[Order Is Total]** -/ theorem OrderIsTotal (a b : LraRat) : a ≤ b ∨ b ≤ a := sorry
/-- **[Order Is Antisymmetric]** -/ theorem OrderIsAntisymmetric {a b : LraRat} (hab : a ≤ b) (hba : b ≤ a) : a = b := sorry
/-- **[Addition Preserves Order]** -/ theorem AdditionPreservesOrder {a b : LraRat} (h : a ≤ b) (c : LraRat) : c + a ≤ c + b := sorry
/-- **[ℚ Is Densely Ordered]** THE distinguishing obligation: a rational lies
strictly between any two. (Compare ℝ's completeness — ℚ is dense but has gaps.) -/
theorem IsDenselyOrdered {a b : LraRat} (h : a < b) : ∃ c, a < c ∧ c < b := sorry

-- Target capstone: `Field LraRat` + `LinearOrder` + `IsOrderedRing` + `Archimedean`
-- + `DenselyOrdered`. NOT `ConditionallyComplete…` — that omission is the point.

namespace Tests
-- (1) WELL-FORMEDNESS against Mathlib's ℚ. All GREEN.
example : ∀ a b : ℚ, a + b = b + a              := fun a b => by ring
example : ∀ a b c : ℚ, a * (b + c) = a*b + a*c  := fun a b c => by ring
example : ∀ a : ℚ, a ≠ 0 → a⁻¹ * a = 1          := fun _ h => inv_mul_cancel₀ h
example : ∀ a b : ℚ, a < b → ∃ c, a < c ∧ c < b := fun _ _ h => exists_between h
example : ∀ a b : ℚ, a ≤ b ∨ b ≤ a              := fun a b => le_total a b
-- (2) SHAPE GATE
#check (@LraRat.IsDenselyOrdered)
-- (3) SCOREBOARD
-- #print axioms InverseIsLeftInverse   -- RED until proved
end Tests

end LraRat
end LraRationals
