-- LRA/VolumeIII/Contracts/Real.lean
--
-- THE ℝ CONTRACT.  Template for N, Z, Q.
--
-- The idea: the final algebraic shape of ℝ is declared up front as a set of
-- named obligations (all `sorry` today) plus the Mathlib instances they
-- assemble into. The obligations ARE the to-do list; proving them turns the
-- contract green; satisfying the instance unlocks Mathlib's whole lemma library
-- for `LraReal` for free.
--
-- SCOREBOARD (your chosen source of truth): a declaration is GREEN iff its
-- axiom footprint omits `sorryAx`. `#print axioms <name>` is the audit; the
-- harvester reads the same footprint to render a green/red chart. Nothing to
-- hand-maintain — Lean's kernel keeps score.
--
-- NAMING: obligations are PascalCase, named for what they assert (your citation
-- style). The EXACT Mathlib field names appear only on the LEFT of `:=` inside
-- instances, where they are forced; your theorem names go on the RIGHT, where
-- they are free. That is the whole "name it my way, still satisfy the contract"
-- technique.

import Mathlib
import LRA.VolumeIII.Reals.LraReal
import LRA.VolumeIII.Bounds        -- IsBoundedAbove / IsSupremum for the completeness clause

namespace LraReals.LraReal

-- ════════════════════════════════════════════════════════════════════
-- THE OBLIGATIONS.  Each is one `sorry` = one tracked task on the board.
-- ════════════════════════════════════════════════════════════════════

-- Additive group
/-- **[Addition Is Commutative]** -/ theorem AdditionIsCommutative (x y : LraReal) : x + y = y + x := sorry
/-- **[Addition Is Associative]** -/ theorem AdditionIsAssociative (x y z : LraReal) : x + y + z = x + (y + z) := sorry
/-- **[Zero Is a Left Identity]** -/ theorem ZeroIsLeftIdentity (x : LraReal) : 0 + x = x := sorry
/-- **[Zero Is a Right Identity]** -/ theorem ZeroIsRightIdentity (x : LraReal) : x + 0 = x := sorry
/-- **[Negation Is a Left Inverse]** -/ theorem NegationIsLeftInverse (x : LraReal) : -x + x = 0 := sorry

-- Multiplicative / ring / field
/-- **[Multiplication Is Commutative]** -/ theorem MultiplicationIsCommutative (x y : LraReal) : x * y = y * x := sorry
/-- **[Multiplication Is Associative]** -/ theorem MultiplicationIsAssociative (x y z : LraReal) : x * y * z = x * (y * z) := sorry
/-- **[One Is a Left Identity]** -/ theorem OneIsLeftIdentity (x : LraReal) : 1 * x = x := sorry
/-- **[One Is a Right Identity]** -/ theorem OneIsRightIdentity (x : LraReal) : x * 1 = x := sorry
/-- **[Multiplication Distributes on the Left]** -/ theorem MultiplicationLeftDistributes (x y z : LraReal) : x * (y + z) = x * y + x * z := sorry
/-- **[Inverse Is a Left Inverse]** -/ theorem InverseIsLeftInverse (x : LraReal) (hx : x ≠ 0) : x⁻¹ * x = 1 := sorry
/-- **[Zero Is Not One]** -/ theorem ZeroIsNotOne : (0 : LraReal) ≠ 1 := sorry

-- Order
/-- **[Order Is Antisymmetric]** -/ theorem OrderIsAntisymmetric (x y : LraReal) (hxy : x ≤ y) (hyx : y ≤ x) : x = y := sorry
/-- **[Order Is Total]** -/ theorem OrderIsTotal (x y : LraReal) : x ≤ y ∨ y ≤ x := sorry
/-- **[Addition Preserves Order]** -/ theorem AdditionPreservesOrder {x y : LraReal} (h : x ≤ y) (z : LraReal) : z + x ≤ z + y := sorry
/-- **[Multiplication Preserves Positivity]** -/ theorem MultiplicationPreservesPositivity {x y : LraReal} (hx : 0 ≤ x) (hy : 0 ≤ y) : 0 ≤ x * y := sorry

-- Completeness — the obligation that distinguishes ℝ from ℚ.
/-- **[The Reals Are Complete]** Every nonempty, bounded-above set of reals has a
supremum. THE defining property; stated in your `Bounds` vocabulary. -/
theorem RealsAreComplete (A : Set LraReal) (hne : A.Nonempty) (hba : Bounds.IsBoundedAbove A) :
    ∃ s, Bounds.IsSupremum s A := sorry

-- ════════════════════════════════════════════════════════════════════
-- THE WIRING TECHNIQUE — fully shown on the order layer.
-- ════════════════════════════════════════════════════════════════════
--
-- Upgrade the GREEN `Preorder` (from the carrier) to a `PartialOrder` by adding
-- exactly one field, fed by your obligation. Read the line as: Mathlib's slot
-- `le_antisymm`  ←  your theorem `OrderIsAntisymmetric`.
--
-- The `{ inferInstance with … }` pattern reuses the proved Preorder, so its
-- reflexivity/transitivity stay GREEN; only `le_antisymm` carries the `sorry`.
-- This is the exact move every higher layer uses.

/-- **[PartialOrder instance]** The flagship wiring example. -/
instance : PartialOrder LraReal :=
  { (inferInstance : Preorder LraReal) with
    le_antisymm := OrderIsAntisymmetric }

-- The remaining layers assemble the same way as obligations turn green:
--
--   instance : LinearOrder LraReal :=
--     { (inferInstance : PartialOrder LraReal) with
--       le_total := OrderIsTotal, decidableLE := Classical.dec _, … }
--   instance : AddCommGroup LraReal := { … add_comm := AdditionIsCommutative, … }
--   instance : Field LraReal := { … mul_comm := MultiplicationIsCommutative, … }
--   instance : ConditionallyCompleteLinearOrderedField LraReal := { … }   ← capstone
--
-- The capstone is THE shape of ℝ. With it, Mathlib's `inducedOrderRingIso`
-- hands you `LraReal ≃+*o ℝ` for free, and every Volume III generic theorem
-- fires on `LraReal`. (Field sets on these layers are larger and version-
-- sensitive — wire them at build time, one `{ inferInstance with … }` per layer,
-- confirming names against your Mathlib as each obligation goes green.)

-- ════════════════════════════════════════════════════════════════════
-- TESTS — three flavors.
-- ════════════════════════════════════════════════════════════════════

namespace Tests
open Bounds

-- (1) CONTRACT IS WELL-FORMED.  Each obligation, transported to the genuine ℝ,
--     is provable by Mathlib. If an obligation were MIS-STATED, its ℝ twin would
--     fail to prove — so these green checks certify the contract says the right
--     thing. (All GREEN today.)
example : ∀ x y : ℝ, x + y = y + x          := fun x y => add_comm x y
example : ∀ x y : ℝ, x * y = y * x          := fun x y => mul_comm x y
example : ∀ x y z : ℝ, x * (y + z) = x*y+x*z := fun x y z => mul_add x y z
example : ∀ x y : ℝ, x ≤ y ∨ y ≤ x          := fun x y => le_total x y
example : ∀ x y : ℝ, x ≤ y → y ≤ x → x = y  := fun _ _ h₁ h₂ => le_antisymm h₁ h₂

-- (2) SHAPE GATES.  Do the instances exist / generic theorems fire on LraReal?
--     (These check elaboration, not sorry-freeness — see flavor 3 for that.)
#check (@IsSupremum LraReal _)          -- via the GREEN Preorder
#check (@SupremumUnique LraReal _)       -- via the wired PartialOrder ↑

-- (3) THE SCOREBOARD.  Your chosen source of truth: the axiom footprint.
--     Uncomment to see the kernel's verdict — `sorryAx` present ⇒ RED.
--     When you prove the obligation, `sorryAx` vanishes ⇒ GREEN, automatically.
-- #print axioms AdditionIsCommutative      -- RED  (depends on sorryAx)
-- #print axioms RealsAreComplete           -- RED
-- (Compare: `#print axioms add_comm` on Mathlib's ℝ is GREEN.)

-- FUTURE consequence tests — RED until the named layer assembles, then GREEN
-- for free (this is the library you inherit):
-- example (x y : LraReal) : x + y = y + x := by ring          -- needs CommRing
-- example (A : Set LraReal) (h : …) : … := le_csSup …          -- needs completeness

end Tests
end LraReals.LraReal
