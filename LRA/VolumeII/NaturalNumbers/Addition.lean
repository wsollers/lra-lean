-- LRA/VolumeII/NaturalNumbers/Addition.lean
--
-- Landau §2: Addition
--
-- Axiom 6:  plus x one         = successor x
-- Axiom 7:  plus x (successor y) = successor (plus x y)
--
-- Theorems proved in this file:
--   Theorem 1 (succ_strict):             x ≠ y → successor x ≠ successor y
--   Theorem 2 (succ_ne_self):            successor x ≠ x
--   Theorem 3 (pred_unique):             x ≠ one → ∃ u, x = successor u ∧ ∀ v, x = successor v → v = u
--   Theorem 4 (addition_unique):         uniqueness of the addition function
--   Theorem 4 (addition_exists):         existence of the addition function
--   Helper    (plus_base):               plus x one = successor x
--   Helper    (plus_step):               plus x (successor y) = successor (plus x y)
--   Helper    (one_plus_x):              plus one x = successor x
--   Helper    (successor_plus):          plus (successor x) y = successor (plus x y)
--   Helper    (add_one_comm):            plus one x = plus x one
--   Theorem 5 (addition_is_associative): (x + y) + z = x + (y + z)
--   Theorem 6 (addition_is_commutative): x + y = y + x
--   Theorem 7 (add_ne_self):             y ≠ plus x y

import LRA.VolumeII.NaturalNumbers.Axioms

namespace Landau



-- ============================================================
-- Theorem 1: x ≠ y → successor x ≠ successor y
-- Proof: contrapositive of A4.
-- ============================================================

theorem succ_strict : ∀ x y : N, x ≠ y → successor x ≠ successor y := by
  intro x y hne heq
  exact hne (A4 x y heq)

-- ============================================================
-- Theorem 2: successor x ≠ x
-- Proof: induction on x.
--   Base:  successor one ≠ one                     by A3
--   Step:  successor x ≠ x → successor(successor x) ≠ successor x   by Theorem 1
-- ============================================================

theorem succ_ne_self : ∀ x : N, successor x ≠ x := by
  apply A5_Induction (fun x => successor x ≠ x)
  · exact A3 one
  · intro x ih
    exact succ_strict (successor x) x ih

-- ============================================================
-- Theorem 3: x ≠ one → ∃ u, x = successor u ∧ ∀ v, x = successor v → v = u
--
-- Note: ∃! is not available without Mathlib.
-- We spell out existence and uniqueness explicitly.
-- ============================================================

private def UniqueSucc (y : N) : Prop :=
  ∃ u : N, y = successor u ∧ ∀ v : N, y = successor v → v = u

private theorem cover : ∀ y : N, y = one ∨ UniqueSucc y := by
  apply A5_Induction (fun y => y = one ∨ UniqueSucc y)
  · left; rfl
  · intro y _ih
    right
    exact ⟨y, rfl, fun v hv => A4 v y hv.symm⟩

theorem pred_unique : ∀ x : N, x ≠ one → UniqueSucc x := by
  intro x hne
  cases cover x with
  | inl h => exact absurd h hne
  | inr h => exact h

-- ============================================================
-- Theorem 4 (Landau, Foundations of Analysis) — Part I: Uniqueness
-- If two functions f g : N → N → N both satisfy the two
-- defining equations of addition (A6 and A7), they agree
-- pointwise — i.e. f x y = g x y for all x y : N.
-- There is therefore at most one such function.
--
-- Theorem 4 — Part II: Existence
-- A function f : N → N → N satisfying A6 and A7 exists,
-- constructed explicitly by recursion on the second argument.
-- Together, Parts I and II establish that there is exactly
-- one function satisfying the equations of addition.
-- This unique function is called addition and written x + y.
-- ============================================================
theorem addition_unique :
    ∀ f g : N → N → N,
    (∀ x : N, f x one = successor x) →
    (∀ x : N, g x one = successor x) →
    (∀ x y : N, f x (successor y) = successor (f x y)) →
    (∀ x y : N, g x (successor y) = successor (g x y)) →
    ∀ x y : N, f x y = g x y := by
    intro f g -- Introduce the functions since they are technically variables.
    intro hfx -- Introduce the hypothesis that f x one = successor x
    intro hgx -- Introduce the hypothesis that g x one = successor x
    intro hfs -- Introduce the hypothesis that f x (successor y) = successor (f x y)
    intro hgs -- Introduce the hypothesis that g x (successor y) = successor (g x y)
    intro x y -- now we fix arbitrary x y and prove f x y = g x y by induction on y
    apply A5_Induction (fun v => f x v = g x v)
    · rw [hfx x, hgx x]
    · intro v ih
      rw [hfs x v, hgs x v]
      congr

theorem addition_exists :
    ∃ f : N → N → N,
    (∀ x : N, f x one = successor x) ∧
    (∀ x y : N, f x (successor y) = successor (f x y)) := by
-- Define f by recursion on the second argument
  let f : N → N → N :=
    fun x y =>
      N_rec
        (successor x)
        (fun prev => successor prev) y
  refine ⟨f, ?_, ?_⟩
  · -- A6: f x one = successor x
    intro x
    show N_rec (successor x) (fun prev => successor prev) one = successor x
    rw [N_rec_one]
  · -- A7: f x (successor y) = successor (f x y)
    intro x y
    show N_rec (successor x) (fun prev => successor prev) (successor y) =
         successor (N_rec (successor x) (fun prev => successor prev) y)
    rw [N_rec_succ]


noncomputable def plus (x y : N) : N :=
  N_rec (successor x) (fun prev => successor prev) y

theorem plus_base : ∀ x : N, plus x one = successor x := by
  intro x
  show N_rec (successor x) (fun prev => successor prev) one = successor x
  rw [N_rec_one]

theorem plus_step : ∀ x y : N, plus x (successor y) = successor (plus x y) := by
  intro x y
  show N_rec (successor x) (fun prev => successor prev) (successor y) =
       successor (N_rec (successor x) (fun prev => successor prev) y)
  rw [N_rec_succ]

theorem one_plus_x : ∀ x : N, plus one x = successor x := by
  intro x
  induction x using A5_Induction
  · rw [plus_base]
  · rename_i x ih
    rw [plus_step, ih]

-- ============================================================
-- Theorem 5 (Landau): Associative Law of Addition
-- (x + y) + z = x + (y + z) for all x y z : N
-- ============================================================

theorem addition_is_associative : ∀ x y z : N, plus (plus x y) z = plus x (plus y z) := by
  intro x y z
  induction z using A5_Induction
  · rw [plus_base, plus_base, ← plus_step]
  · rename_i z ih
    rw [plus_step, plus_step, ih, ← plus_step]

-- ============================================================
-- Theorem 6 (Landau): Commutative Law of Addition
-- x + y = y + x for all x y : N
-- ============================================================
-- ============================================================
-- Helper Lemma: S(x) + y = S(x + y)
-- Landau's Axiom 7 gives us x + S(y) = S(x + y).
-- We need this "left-side" version for the induction step.
-- ============================================================
theorem successor_plus : ∀ x y : N, plus (successor x) y = successor (plus x y) := by
  intro x y
  induction y using N_Induction
  case one =>
    -- Goal: plus (S x) one = S (plus x one)
    rw [plus_base, plus_base]
  case successor n ih =>
    -- Goal: plus (S x) (S n) = S (plus x (S n))
    rw [plus_step, plus_step, ih]
    theorem add_one_comm (x : N) : plus one x = plus x one := by
  induction x using N_Induction
  case one =>
    -- Goal: plus one one = plus one one
    rfl
  case successor n ih =>
    -- Goal: plus one (successor n) = plus (successor n) one
    rw [plus_step]  -- LHS: successor (plus one n)
    rw [ih]         -- LHS: successor (plus n one)
    rw [plus_base]  -- RHS: plus (S n) one = S(S n)
    rw [plus_base]  -- LHS: S(S n) = S(S n)
-- ============================================================
-- Theorem 6 (Landau): Commutative Law of Addition
-- Part 2: x + y = y + x
-- ============================================================
theorem addition_is_commutative : ∀ x y : N, plus y x = plus x y := by
  intro x y
  induction y using N_Induction
  case one =>
    -- Goal: plus one x = plus x one
    exact add_one_comm x
  case successor n ih =>
    -- Goal: plus (S n) x = plus x (S n)
    rw [plus_step]      -- RHS: S (plus x n)
    rw [← ih]           -- RHS: S (plus n x)
    rw [successor_plus] -- LHS: S (plus n x)
    -- Both sides are now S (plus n x)

-- ============================================================
-- Theorem 7 (Landau): y ≠ x + y  for all x, y ∈ ℕ
-- Proof: fix x ∈ ℕ, induction on y.
--
--   Base case (y = one):
--     Goal: one ≠ plus x one.
--     plus x one = successor x      by plus_base (Axiom A6).
--     successor x ≠ one             by A3 (Peano axiom P3).
--     Hence one ≠ successor x = plus x one.
--
--   Inductive step (y = successor m, IH: m ≠ plus x m):
--     Goal: successor m ≠ plus x (successor m).
--     plus x (successor m) = successor (plus x m)   by plus_step (Axiom A7).
--     Goal becomes: successor m ≠ successor (plus x m).
--     By succ_strict applied to IH (m ≠ plus x m):
--       successor m ≠ successor (plus x m).
--     Done.
--
-- Note: the induction is on y (not x) because the inductive step for y
-- uses A7 (recursion on the second argument) and succ_strict directly.
-- ============================================================
theorem add_ne_self : ∀ x y : N, y ≠ plus x y := by
  intro x y -- Introduce both to avoid 'unknown identifier'
  induction y using N_Induction
  case one =>
    -- Goal: one ≠ plus x one
    rw [plus_base] -- Change 'plus x one' to 'successor x'
    -- Goal: one ≠ successor x
    -- We know 'successor x ≠ one' from Axiom A3, so use symmetry
    exact Ne.symm (A3 x)

  case successor n ih =>
    -- Goal: successor n ≠ plus x (successor n)
    -- IH: n ≠ plus x n
    rw [plus_step] -- Change 'plus x (successor n)' to 'successor (plus x n)'
    -- Goal: successor n ≠ successor (plus x n)
    -- Now apply Theorem 1 (succ_strict) to the IH
    exact succ_strict n (plus x n) ih

-- ============================================================
-- Theorem 8 (Landau): If y ≠ z, then x + y ≠ x + z for all x, y, z ∈ ℕ
-- Proof: Fix y, z ∈ ℕ such that y ≠ z. Proceed by induction on x.
--
--   Base case (x = one):
--     Goal: plus one y ≠ plus one z.
--     plus one y = successor y         by Theorem 4 (or Def of Add).
--     plus one z = successor z         by Theorem 4.
--     Since y ≠ z, successor y ≠ successor z  by Axiom 4 (P4).
--     Hence plus one y ≠ plus one z.
--
--   Inductive step (x = successor m, IH: plus m y ≠ plus m z):
--     Goal: plus (successor m) y ≠ plus (successor m) z.
--     plus (successor m) y = successor (plus m y)   by Theorem 2.
--     plus (successor m) z = successor (plus m z)   by Theorem 2.
--     By Axiom 4 applied to IH (plus m y ≠ plus m z):
--       successor (plus m y) ≠ successor (plus m z).
--     Hence plus (successor m) y ≠ plus (successor m) z.
--
-- Note: Induction is on x because Theorem 2 (successor on the first
-- argument) allows us to "pull out" the successor to apply Axiom 4.
-- ============================================================

theorem landau_thm8 (x y z : N) : (y ≠ z → plus x y ≠ plus x z) := by
  -- We use your N_Induction (Axiom 5) on x
  induction x using N_Induction
  case one =>
    -- Goal: y ≠ z → plus one y ≠ plus one z
    intro hne
    rw [one_plus_x, one_plus_x] -- Using your Helper Lemma
    exact succ_strict y z hne   -- Using your Theorem 1

  case successor n ih =>
    -- Goal: y ≠ z → plus (successor n) y ≠ plus (successor n) z
    -- ih: y ≠ z → plus n y ≠ plus n z
    intro hne
    -- 1. Apply the IH to our specific y and z
    have h_prev := ih hne
    -- 2. Use successor_plus (S x + y = S(x + y))
    rw [successor_plus, successor_plus]
    -- 3. Apply succ_strict (Thm 1) to the IH result
    exact succ_strict (plus n y) (plus n z) h_prev

end Landau
