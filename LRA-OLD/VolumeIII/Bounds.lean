-- LRA/VolumeIII/Bounds.lean
--
-- §3.2  The Bounds Interface.
--
-- Carrier-agnostic by construction: every definition is over an arbitrary
-- ordered `F`, never over ℝ. So the same `Bounds.IsSupremum` runs on Mathlib's
-- ℝ and on `LraReal` with no per-carrier code — that IS the bidirectionality.
-- Mathlib's ℝ already has the order instances; `LraReal` has a real `Preorder`
-- (cut inclusion), so both are legitimate carriers today.
--
-- Naming: properties are `Is…` (stated); facts are named for the law (cited).
-- `Bounds.Algebra` holds the sup/inf arithmetic (sup of a sum, scaling, the
-- sup↔inf duality under negation).
--
-- SIGNATURE PASS: bodies are `sorry`, except a couple of order-only facts and
-- the concrete ℝ tests, which are genuinely proved so the surface is exercised.

import Mathlib
import LRA.VolumeIII.Reals.LraReal

open scoped Pointwise   -- pointwise `A + B`, `-A` on `Set F`

namespace Bounds

variable {F : Type*}

-- ════════════════════════════════════════════════════════════════════
-- Primitives — properties (`Is…`), stated over any ordered carrier.
-- ════════════════════════════════════════════════════════════════════

/-- **[Upper Bound]** `u` dominates every element of `A`. -/
def IsUpperBound [LE F] (u : F) (A : Set F) : Prop := ∀ x ∈ A, x ≤ u

/-- **[Lower Bound]** `l` is dominated by every element of `A`. -/
def IsLowerBound [LE F] (l : F) (A : Set F) : Prop := ∀ x ∈ A, l ≤ x

/-- **[Bounded Above]** `A` has some upper bound. -/
def IsBoundedAbove [LE F] (A : Set F) : Prop := ∃ u, IsUpperBound u A

/-- **[Bounded Below]** `A` has some lower bound. -/
def IsBoundedBelow [LE F] (A : Set F) : Prop := ∃ l, IsLowerBound l A

/-- **[Bounded]** `A` is bounded above and below. -/
def IsBounded [LE F] (A : Set F) : Prop := IsBoundedAbove A ∧ IsBoundedBelow A

/-- **[Maximum]** A realized upper bound: in `A`, and above all of `A`. -/
def IsMaximum [LE F] (m : F) (A : Set F) : Prop := m ∈ A ∧ IsUpperBound m A

/-- **[Minimum]** A realized lower bound. -/
def IsMinimum [LE F] (m : F) (A : Set F) : Prop := m ∈ A ∧ IsLowerBound m A

/-- **[Supremum]** Least upper bound: an upper bound below every upper bound. -/
def IsSupremum [Preorder F] (s : F) (A : Set F) : Prop :=
  IsUpperBound s A ∧ ∀ u, IsUpperBound u A → s ≤ u

/-- **[Infimum]** Greatest lower bound. -/
def IsInfimum [Preorder F] (i : F) (A : Set F) : Prop :=
  IsLowerBound i A ∧ ∀ l, IsLowerBound l A → l ≤ i

-- ════════════════════════════════════════════════════════════════════
-- Facts — the order-only ones are proved; the Mathlib bridge is stubbed.
-- ════════════════════════════════════════════════════════════════════

/-- **[A Maximum Is a Supremum]** -/
theorem MaximumIsSupremum [Preorder F] {m : F} {A : Set F}
    (h : IsMaximum m A) : IsSupremum m A :=
  ⟨h.2, fun _u hu => hu m h.1⟩

/-- **[Supremum Is Unique]** -/
theorem SupremumUnique [PartialOrder F] {s t : F} {A : Set F}
    (hs : IsSupremum s A) (ht : IsSupremum t A) : s = t :=
  le_antisymm (hs.2 t ht.1) (ht.2 s hs.1)

/-- **[Infimum Is Unique]** -/
theorem InfimumUnique [PartialOrder F] {s t : F} {A : Set F}
    (hs : IsInfimum s A) (ht : IsInfimum t A) : s = t :=
  le_antisymm (ht.2 s hs.1) (hs.2 t ht.1)

/-- **[Bridge: Supremum ↔ Mathlib IsLUB]** The single Mathlib-coupling point;
proving it is also the test that `IsSupremum` matches the standard notion. -/
theorem SupremumIffIsLUB [Preorder F] {s : F} {A : Set F} :
    IsSupremum s A ↔ IsLUB A s := sorry

-- ════════════════════════════════════════════════════════════════════
-- Bounds.Algebra — sup/inf arithmetic.
-- ════════════════════════════════════════════════════════════════════

namespace Algebra

variable {F : Type*} [Field F] [LinearOrder F] [IsStrictOrderedRing F]

/-- **[Supremum of a Sum]** `sup (A + B) = sup A + sup B`, relationally. -/
theorem SupremumOfSum {sA sB : F} {A B : Set F}
    (hA : IsSupremum sA A) (hB : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B) := sorry

/-- **[Infimum of a Sum]** `inf (A + B) = inf A + inf B`, relationally. -/
theorem InfimumOfSum {iA iB : F} {A B : Set F}
    (hA : IsInfimum iA A) (hB : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B) := sorry

/-- **[Supremum Under Nonnegative Scaling]** `sup (a · A) = a · sup A` for `a ≥ 0`. -/
theorem SupremumOfNonnegScale {a s : F} {A : Set F}
    (ha : 0 ≤ a) (h : IsSupremum s A) :
    IsSupremum (a * s) ((fun x => a * x) '' A) := sorry

/-- **[Negation Swaps Supremum and Infimum]** `sup A = -(inf (-A))`. -/
theorem NegationSwapsSupremumInfimum {s : F} {A : Set F} :
    IsSupremum s A ↔ IsInfimum (-s) (-A) := sorry

/-- **[Monotonicity of Supremum]** `A ⊆ B → sup A ≤ sup B` (when both exist). -/
theorem SupremumMonotone {sA sB : F} {A B : Set F}
    (hAB : A ⊆ B) (hA : IsSupremum sA A) (hB : IsSupremum sB B) :
    sA ≤ sB := sorry

end Algebra

-- ════════════════════════════════════════════════════════════════════
-- Bidirectional tests.
-- ════════════════════════════════════════════════════════════════════

namespace Tests

open LraReals (LraReal)

-- DIRECTION 2 — same primitive, both carriers. These elaborate only if each
-- carrier really has the order structure the definition needs. ℝ via Mathlib,
-- LraReal via its (real) Preorder instance.
section BothCarriers
#check (@IsSupremum ℝ _)
#check (@IsSupremum LraReal _)
#check (@IsBoundedAbove ℝ _)
#check (@IsBoundedAbove LraReal _)
#check (@IsMaximum LraReal _)
-- #check (@SupremumUnique LraReal _)      -- live gate: uncomment once PartialOrder LraReal is wired
end BothCarriers

-- DIRECTION 1 — MY definitions, run on the REAL ℝ, against concrete sets.
-- If `IsSupremum`/`IsMaximum` were wrong, these proofs would fail — so they
-- double as correctness tests of the definitions themselves.
section MyDefsOnRealReals
example : IsUpperBound (3 : ℝ) {1, 2, 3} := by
  intro x hx; rcases hx with rfl | rfl | rfl <;> norm_num

example : IsMaximum (3 : ℝ) {1, 2, 3} := by
  refine ⟨by norm_num, ?_⟩
  intro x hx; rcases hx with rfl | rfl | rfl <;> norm_num

example : IsSupremum (3 : ℝ) {1, 2, 3} :=
  MaximumIsSupremum (by
    refine ⟨by norm_num, ?_⟩
    intro x hx; rcases hx with rfl | rfl | rfl <;> norm_num)
end MyDefsOnRealReals

-- Algebra surface is citable on ℝ now; on LraReal once it is a field.
#check (@Algebra.SupremumOfSum ℝ _)

end Tests
end Bounds
