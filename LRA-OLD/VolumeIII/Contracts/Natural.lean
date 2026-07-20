-- LRA/VolumeIII/Contracts/Natural.lean
--
-- THE ℕ CONTRACT  (one-based: {1, 2, 3, …}; no zero, no subtraction).
--
-- Template-identical to Contracts/Real.lean. The one-based convention is
-- encoded by what is ABSENT: there is no additive-identity obligation, no
-- negation, no subtraction. The distinguishing obligation is `IsWellOrdered`.
-- Bidirectional partner for the well-formedness tests: Mathlib `ℕ`.

import Mathlib
import LRA.Foundation

namespace LraNaturals

/-- **[LraNat]** One-based naturals as the inductive successor type, `1`
distinguished. (Construction is real; arithmetic is stubbed for Claude Code.) -/
inductive LraNat where
  | one
  | succ (n : LraNat)

namespace LraNat

-- Data stubs so the obligation statements typecheck.
instance : One LraNat := ⟨LraNat.one⟩
instance : Add LraNat := ⟨fun _ _ => sorry⟩
instance : Mul LraNat := ⟨fun _ _ => sorry⟩
instance : Preorder LraNat where
  le _ _ := sorry
  le_refl _ := sorry
  le_trans _ _ _ _ _ := sorry

abbrev addOperation : LRA.Foundation.BinaryOperation LraNat := (· + ·)
abbrev mulOperation : LRA.Foundation.BinaryOperation LraNat := (· * ·)
abbrev leRelation : LRA.Foundation.Endorelation LraNat := (· ≤ ·)

-- ── OBLIGATIONS (ordered, cancellative comm. structure; NO additive identity) ──
/-- **[Addition Is Commutative]** -/ theorem AdditionIsCommutative : LRA.Foundation.Algebra.commutative addOperation := sorry
/-- **[Addition Is Associative]** -/ theorem AdditionIsAssociative : LRA.Foundation.Algebra.associative addOperation := sorry
/-- **[Addition Is Cancellative]** -/ theorem AdditionIsCancellative {a b c : LraNat} (h : a + c = b + c) : a = b := sorry
/-- **[Multiplication Is Commutative]** -/ theorem MultiplicationIsCommutative : LRA.Foundation.Algebra.commutative mulOperation := sorry
/-- **[Multiplication Is Associative]** -/ theorem MultiplicationIsAssociative : LRA.Foundation.Algebra.associative mulOperation := sorry
/-- **[One Is a Left Identity]** -/ theorem OneIsLeftIdentity : LRA.Foundation.Algebra.leftIdentity mulOperation 1 := sorry
/-- **[Multiplication Distributes]** -/ theorem MultiplicationLeftDistributes : LRA.Foundation.Algebra.leftDistributive mulOperation addOperation := sorry
/-- **[Order Is Total]** -/ theorem OrderIsTotal : LRA.Foundation.Order.total leRelation := sorry
/-- **[Order Is Antisymmetric]** -/ theorem OrderIsAntisymmetric : LRA.Foundation.Order.antisymmetric leRelation := sorry
/-- **[Addition Preserves Order]** -/ theorem AdditionPreservesOrder : LRA.Foundation.Order.strictlyPreservesLeftTranslation leRelation addOperation := sorry
/-- **[ℕ Is Well-Ordered]** Every nonempty set of naturals has a least element.
THE distinguishing obligation (ℕ's analogue of completeness). -/
theorem IsWellOrdered (S : Set LraNat) (hne : S.Nonempty) : ∃ m ∈ S, ∀ s ∈ S, m ≤ s := sorry

-- Target capstone: assembled from the obligations the way Contracts/Real.lean
-- shows. One-based ℕ has no clean single Mathlib class (no zero); the obligations
-- stand on their own and the bidirectional partner is Mathlib `ℕ` / `PNat`.

namespace Tests
-- (1) WELL-FORMEDNESS: each obligation, on Mathlib's ℕ, is provable — certifying
--     the statements are correctly formed. (ℕ has a 0 ours lacks; used only to
--     validate the SHARED laws.) All GREEN.
example : ∀ a b : ℕ, a + b = b + a              := fun a b => by ring
example : ∀ a b c : ℕ, a * (b + c) = a*b + a*c  := fun a b c => by ring
example : ∀ a b c : ℕ, a + c = b + c → a = b    := fun _ _ _ h => by omega
example : ∀ a b : ℕ, a ≤ b ∨ b ≤ a              := fun a b => by omega
-- (2) SHAPE GATE
#check (@LraNat.AdditionIsCommutative)
-- (3) SCOREBOARD (sorryAx = truth)
-- #print axioms AdditionIsCommutative   -- RED until proved
end Tests

end LraNat
end LraNaturals
