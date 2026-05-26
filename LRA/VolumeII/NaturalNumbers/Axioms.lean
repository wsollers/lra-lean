-- LRA/VolumeII/NaturalNumbers/Axioms.lean
--
-- Landau's Peano Axioms (Foundations of Analysis §1).
-- No Mathlib. No imports. This file is the entire foundation.
--
-- Notation: we write S x for the successor of x (Landau: x')
-- Using a plain prefix function avoids all parser/language-server
-- ambiguity with postfix unicode tokens.

namespace Landau

-- ============================================================
-- Primitive notions
-- ============================================================

axiom N    : Type
axiom one  : N
axiom successor    : N → N      -- S x is the successor of x (Landau: x')

-- ============================================================
-- The Five Peano Axioms (Landau §1)
-- ============================================================

-- Axiom 1: 1 ∈ N  (witnessed by `one : N`)
-- Axiom 2: S x ∈ N for all x  (witnessed by `S : N → N`)

-- Axiom 3: S x ≠ 1 for all x
axiom A3 : ∀ x : N, successor x ≠ one

-- Axiom 4: S x = S y → x = y  (successor is injective)
axiom A4 : ∀ x y : N, successor x = successor y → x = y

-- Axiom 5: Induction
axiom A5_Induction : ∀ (P : N → Prop),
    P one →
    (∀ x : N, P x → P (successor x)) →
    ∀ x : N, P x

/--
  A wrapper to give names to the induction steps.
  The @[recursor 4] tells Lean to use this for the 'induction' tactic.
  The '4' refers to the 4th argument (x) as the one being 'split'.
--/
@[recursor 4]
theorem N_Induction {P : N → Prop} (one : P one)
    (successor : ∀ n, P n → P (successor n)) :
    ∀ x : N, P x :=
  A5_Induction P one successor


axiom N_rec : ∀ {T : Type}, T → (T → T) → N → T

axiom N_rec_one : ∀ {T : Type} (base : T) (step : T → T),
    N_rec base step one = base

axiom N_rec_succ : ∀ {T : Type} (base : T) (step : T → T) (n : N),
    N_rec base step (successor n) = step (N_rec base step n)




end Landau
