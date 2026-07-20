-- LRA/VolumeIII/Contracts/Rational.lean
--
-- THE ℚ CONTRACT  (ordered field, Archimedean, densely ordered — NOT complete).
--
-- Gains over ℤ: multiplicative inverses (field). Distinguishing obligation:
-- `IsDenselyOrdered`. Pointedly LACKS a completeness obligation — that gap is
-- exactly what ℝ fills. Partner: Mathlib `ℚ`.

import Mathlib
import LRA.Foundation
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

abbrev addOperation : LRA.Foundation.BinaryOperation LraRat := (· + ·)
abbrev negOperation : LRA.Foundation.UnaryOperation LraRat := Neg.neg
abbrev mulOperation : LRA.Foundation.BinaryOperation LraRat := (· * ·)
abbrev leRelation : LRA.Foundation.Endorelation LraRat := (· ≤ ·)

-- ── OBLIGATIONS (ordered field + density) ──
/-- **[Addition Is Commutative]** -/ theorem AdditionIsCommutative : LRA.Foundation.Algebra.commutative addOperation := sorry
/-- **[Addition Is Associative]** -/ theorem AdditionIsAssociative : LRA.Foundation.Algebra.associative addOperation := sorry
/-- **[Zero Is an Additive Identity]** -/ theorem ZeroIsLeftIdentity : LRA.Foundation.Algebra.leftIdentity addOperation 0 := sorry
/-- **[Negation Is an Additive Inverse]** -/ theorem NegationIsLeftInverse : LRA.Foundation.Algebra.leftInverse addOperation 0 negOperation := sorry
/-- **[Multiplication Is Commutative]** -/ theorem MultiplicationIsCommutative : LRA.Foundation.Algebra.commutative mulOperation := sorry
/-- **[Multiplication Is Associative]** -/ theorem MultiplicationIsAssociative : LRA.Foundation.Algebra.associative mulOperation := sorry
/-- **[One Is a Multiplicative Identity]** -/ theorem OneIsLeftIdentity : LRA.Foundation.Algebra.leftIdentity mulOperation 1 := sorry
/-- **[Multiplication Distributes]** -/ theorem MultiplicationLeftDistributes : LRA.Foundation.Algebra.leftDistributive mulOperation addOperation := sorry
/-- **[Inverse Is a Left Inverse]** THE field obligation: every nonzero is invertible. -/
theorem InverseIsLeftInverse {a : LraRat} (ha : a ≠ 0) : a⁻¹ * a = 1 := sorry
/-- **[Zero Is Not One]** -/ theorem ZeroIsNotOne : (0 : LraRat) ≠ 1 := sorry
/-- **[Order Is Total]** -/ theorem OrderIsTotal : LRA.Foundation.Order.total leRelation := sorry
/-- **[Order Is Antisymmetric]** -/ theorem OrderIsAntisymmetric : LRA.Foundation.Order.antisymmetric leRelation := sorry
/-- **[Addition Preserves Order]** -/ theorem AdditionPreservesOrder : LRA.Foundation.Order.strictlyPreservesLeftTranslation leRelation addOperation := sorry
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
