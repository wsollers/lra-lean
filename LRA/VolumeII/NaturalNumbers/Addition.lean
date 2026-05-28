-- LRA/VolumeII/NaturalNumbers/Addition.lean
--
-- Landau §2: Addition on the Peano natural numbers.
--
-- Sources:
--   Landau, Foundations of Analysis, §2 (Theorems 1-8)
--   Feferman, The Number Systems, §3.4 (Theorem 3.4 applied)
--   Thurston, The Number System, Ch.A (Theorem 3, uniqueness first)
--   Mendelson, Number Systems, §2.3
--
-- Architecture: `plus` is defined by one application of N_rec.
-- Well-definedness (existence + uniqueness) is inherited from
-- the iterator machine. No separate existence proof needed beyond
-- the N_rec axioms.
--
-- Theorems proved:
--   Landau Thm 1 (succ_strict)             x ≠ y → Sx ≠ Sy
--   Landau Thm 2 (succ_ne_self)            Sx ≠ x
--   Landau Thm 3 (pred_unique)             x ≠ 1 → ∃! predecessor
--   Landau Thm 4 (addition_unique)         uniqueness of plus
--   Landau Thm 4 (addition_exists)         existence of plus
--   Helper       (plus_base)               plus x 1 = Sx
--   Helper       (plus_step)               plus x (Sy) = S(plus x y)
--   Helper       (one_plus_x)              plus 1 x = Sx
--   Helper       (add_one_comm)            plus 1 x = plus x 1
--   Helper       (successor_plus)          plus (Sx) y = S(plus x y)
--   Landau Thm 5 (addition_is_associative) (x+y)+z = x+(y+z)
--   Landau Thm 6 (addition_is_commutative) x+y = y+x
--   Landau Thm 7 (add_ne_self)             y ≠ x+y
--   Landau Thm 8 (landau_thm8)             y≠z → x+y ≠ x+z

import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace Landau

open Peano

-- ============================================================
-- Landau Theorem 1: x ≠ y → successor x ≠ successor y
-- Contrapositive of Peano Axiom P4.
-- ============================================================

/--
**[Theorem — Successor Is Strictly Monotone]** *(Landau Thm 1)*

`x ≠ y → successor x ≠ successor y`

Contrapositive of `A4` (injectivity of successor).

*Dependencies:* `A4`
*Sources:* Landau, *Foundations of Analysis*, §2 Theorem 1
*Notes cross-ref:* §1.1 #theorem-succ-strict
-/
theorem succ_strict : ∀ x y : N, x ≠ y → successor x ≠ successor y := by
  intro x y hne heq
  exact hne (A4 x y heq)

-- ============================================================
-- Landau Theorem 2: successor x ≠ x
-- ============================================================

/--
**[Theorem — Successor Is Not Self]** *(Landau Thm 2)*

`successor x ≠ x` for every `x : N`.

*Dependencies:* `A3`, `succ_strict`, `A5_Induction`
*Sources:* Landau, *Foundations of Analysis*, §2 Theorem 2
*Notes cross-ref:* §1.1 #theorem-succ-ne-self
-/
theorem succ_ne_self : ∀ x : N, successor x ≠ x := by
  apply A5_Induction (fun x => successor x ≠ x)
  · exact A3 one
  · intro x ih
    exact succ_strict (successor x) x ih

-- ============================================================
-- Landau Theorem 3: x ≠ one → unique predecessor exists
-- Note: ∃! unavailable without Mathlib; spelled out explicitly.
-- ============================================================

private def UniqueSucc (y : N) : Prop :=
  ∃ u : N, y = successor u ∧ ∀ v : N, y = successor v → v = u

private theorem cover : ∀ y : N, y = one ∨ UniqueSucc y := by
  apply A5_Induction (fun y => y = one ∨ UniqueSucc y)
  · left; rfl
  · intro y _ih
    right
    exact ⟨y, rfl, fun v hv => A4 v y hv.symm⟩

/--
**[Theorem — Unique Predecessor]** *(Landau Thm 3)*

Every element other than `one` has a unique predecessor:
`x ≠ one → ∃ u, x = successor u ∧ ∀ v, x = successor v → v = u`

*Dependencies:* `A4`, `A5_Induction`
*Sources:* Landau, *Foundations of Analysis*, §2 Theorem 3
*Notes cross-ref:* §1.1 #theorem-pred-unique
-/
theorem pred_unique : ∀ x : N, x ≠ one → UniqueSucc x := by
  intro x hne
  cases cover x with
  | inl h => exact absurd h hne
  | inr h => exact h

-- ============================================================
-- Landau Theorem 4: Existence and Uniqueness of Addition
-- ============================================================

/--
**[Theorem — Addition Is Unique]** *(Landau Thm 4, Part I)*

Any two functions `f g : N → N → N` satisfying the two
defining equations of addition agree everywhere.

*Dependencies:* `A5_Induction`
*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 4
  Thurston, *The Number System*, Ch.A Theorem 3 Part 1
*Notes cross-ref:* §1.2 #lemma-a
-/
theorem addition_unique :
    ∀ f g : N → N → N,
    (∀ x : N, f x one = successor x) →
    (∀ x : N, g x one = successor x) →
    (∀ x y : N, f x (successor y) = successor (f x y)) →
    (∀ x y : N, g x (successor y) = successor (g x y)) →
    ∀ x y : N, f x y = g x y := by
  intro f g hfx hgx hfs hgs x y
  apply A5_Induction (fun v => f x v = g x v)
  · rw [hfx x, hgx x]
  · intro v ih
    rw [hfs x v, hgs x v]
    congr

/--
**[Theorem — Addition Exists]** *(Landau Thm 4, Part II)*

A function satisfying the two defining equations of addition exists,
constructed by one application of `N_rec`.

*Dependencies:* `N_rec`, `N_rec_one`, `N_rec_succ`
*Sources:* Landau, *Foundations of Analysis*, §2 Theorem 4
*Notes cross-ref:* §1.2 #lemma-b
-/
theorem addition_exists :
    ∃ f : N → N → N,
    (∀ x : N, f x one = successor x) ∧
    (∀ x y : N, f x (successor y) = successor (f x y)) := by
  let f : N → N → N :=
    fun x y => N_rec (successor x) (fun prev => successor prev) y
  refine ⟨f, ?_, ?_⟩
  · intro x
    show N_rec (successor x) (fun prev => successor prev) one = successor x
    rw [N_rec_one]
  · intro x y
    show N_rec (successor x) (fun prev => successor prev) (successor y) =
         successor (N_rec (successor x) (fun prev => successor prev) y)
    rw [N_rec_succ]

-- ============================================================
-- Definition of plus
-- ============================================================

/--
**[Definition 8 — Addition on a Peano System]**

`plus x y` is the sum of `x` and `y`.

*Iterator configuration:*
  W = N
  c = successor x
  g = successor

*Dependencies:* `N_rec`
*Sources:*
  Landau, *Foundations of Analysis*, §2 (Axioms 6–7)
  Feferman, *The Number Systems*, §3.4 (Theorem 3.4 applied)
  Mendelson, *Number Systems*, §2.3
*Notes cross-ref:* §1.2 #definition-8
-/
noncomputable def plus (x y : N) : N :=
  N_rec (successor x) (fun prev => successor prev) y

/--
**[Theorem — Addition Base Clause]**

`plus x one = successor x`

*Dependencies:* `plus`, `N_rec_one`
*Notes cross-ref:* §1.2 #theorem-addition-base-clause
-/
theorem plus_base : ∀ x : N, plus x one = successor x := by
  intro x
  show N_rec (successor x) (fun prev => successor prev) one = successor x
  rw [N_rec_one]

/--
**[Theorem — Addition Successor Clause]**

`plus x (successor y) = successor (plus x y)`

*Dependencies:* `plus`, `N_rec_succ`
*Notes cross-ref:* §1.2 #theorem-addition-successor-clause
-/
theorem plus_step : ∀ x y : N, plus x (successor y) = successor (plus x y) := by
  intro x y
  show N_rec (successor x) (fun prev => successor prev) (successor y) =
       successor (N_rec (successor x) (fun prev => successor prev) y)
  rw [N_rec_succ]

-- ============================================================
-- Helper lemmas
-- ============================================================

theorem one_plus_x : ∀ x : N, plus one x = successor x := by
  intro x
  induction x using A5_Induction
  · rw [plus_base]
  · rename_i x ih
    rw [plus_step, ih]

/--
**[Theorem — Add One Commutes]**

`plus one x = plus x one`

*Dependencies:* `plus_base`, `plus_step`, `N_Induction`
-/
theorem add_one_comm : ∀ x : N, plus one x = plus x one := by
  intro x
  induction x using N_Induction
  case one =>
    rfl
  case successor n ih =>
    rw [plus_step, ih, plus_base, plus_base]

/--
**[Theorem — Successor on Left of Addition]**

`plus (successor x) y = successor (plus x y)`

The left-side version of the successor clause.
Needed for commutativity.

*Dependencies:* `plus_base`, `plus_step`, `N_Induction`
-/
theorem successor_plus : ∀ x y : N, plus (successor x) y = successor (plus x y) := by
  intro x y
  induction y using N_Induction
  case one =>
    rw [plus_base, plus_base]
  case successor n ih =>
    rw [plus_step, plus_step, ih]

-- ============================================================
-- Landau Theorem 5: Associativity
-- ============================================================

/--
**[Theorem — Addition Is Associative]** *(Landau Thm 5)*

`plus (plus x y) z = plus x (plus y z)`

*Dependencies:* `plus_base`, `plus_step`, `A5_Induction`
*Sources:* Landau, *Foundations of Analysis*, §2 Theorem 5
*Notes cross-ref:* §1.2 #theorem-addition-is-associative
-/
theorem addition_is_associative : ∀ x y z : N, plus (plus x y) z = plus x (plus y z) := by
  intro x y z
  induction z using A5_Induction
  · rw [plus_base, plus_base, ← plus_step]
  · rename_i z ih
    rw [plus_step, plus_step, ih, ← plus_step]

-- ============================================================
-- Landau Theorem 6: Commutativity
-- ============================================================

/--
**[Theorem — Addition Is Commutative]** *(Landau Thm 6)*

`plus x y = plus y x`

*Dependencies:* `add_one_comm`, `successor_plus`, `plus_step`, `N_Induction`
*Sources:* Landau, *Foundations of Analysis*, §2 Theorem 6
*Notes cross-ref:* §1.2 #theorem-addition-is-commutative
-/
theorem addition_is_commutative : ∀ x y : N, plus y x = plus x y := by
  intro x y
  induction y using N_Induction
  case one =>
    exact add_one_comm x
  case successor n ih =>
    rw [plus_step, ← ih, successor_plus]

-- ============================================================
-- Landau Theorem 7: y ≠ x + y
-- ============================================================

/--
**[Theorem — Addition Does Not Fix Points]** *(Landau Thm 7)*

`y ≠ plus x y` for all `x y : N`.

*Dependencies:* `plus_base`, `plus_step`, `succ_strict`, `A3`, `N_Induction`
*Sources:* Landau, *Foundations of Analysis*, §2 Theorem 7
*Notes cross-ref:* §1.2 #theorem-add-ne-self
-/
theorem add_ne_self : ∀ x y : N, y ≠ plus x y := by
  intro x y
  induction y using N_Induction
  case one =>
    rw [plus_base]
    exact Ne.symm (A3 x)
  case successor n ih =>
    rw [plus_step]
    exact succ_strict n (plus x n) ih

-- ============================================================
-- Landau Theorem 8: y ≠ z → x + y ≠ x + z
-- ============================================================

/--
**[Theorem — Addition Is Cancellative on Right]** *(Landau Thm 8)*

`y ≠ z → plus x y ≠ plus x z` for all `x y z : N`.

*Dependencies:* `one_plus_x`, `succ_strict`, `successor_plus`, `N_Induction`
*Sources:* Landau, *Foundations of Analysis*, §2 Theorem 8
*Notes cross-ref:* §1.2 #theorem-add-cancel
-/
theorem landau_thm8 (x y z : N) : y ≠ z → plus x y ≠ plus x z := by
  induction x using N_Induction
  case one =>
    intro hne
    rw [one_plus_x, one_plus_x]
    exact succ_strict y z hne
  case successor n ih =>
    intro hne
    have h_prev := ih hne
    rw [successor_plus, successor_plus]
    exact succ_strict (plus n y) (plus n z) h_prev

end Landau
