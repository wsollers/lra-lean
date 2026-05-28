-- LRA/VolumeII/NaturalNumbers/Axioms.lean
--
-- The Peano Axioms — foundational primitives for VolumeII.
-- No Mathlib. No imports. This file is the entire foundation.
--
-- All Peano primitives live in namespace Peano.
-- Downstream files use `open Peano` to access them directly.
--
-- Notation: we write `successor x` for the successor of x
-- (Landau writes x'; Mendelson writes S(x); Feferman writes Sc(x)).
-- A plain prefix function avoids parser ambiguity with postfix tokens.

namespace Peano

-- ============================================================
-- Primitive notions
-- ============================================================

/--
**[Axiom — N : Type]**

The carrier set of the Peano system. Its elements are the
positive integers.

*Sources:* Landau, *Foundations of Analysis*, §1 Axiom 1
*Notes cross-ref:* §1.1 #axiom-p1
-/
axiom N : Type

/--
**[Axiom — one : N]**

The distinguished initial element of the Peano system.

*Sources:* Landau, *Foundations of Analysis*, §1 Axiom 1
*Notes cross-ref:* §1.1 #axiom-p1
-/
axiom one : N

/--
**[Axiom — successor : N → N]**

The successor function. `successor x` is the unique element
immediately following `x` in the Peano system.
(Landau: x'; Mendelson: S(x); Feferman: Sc(x))

*Sources:* Landau, *Foundations of Analysis*, §1 Axiom 2
*Notes cross-ref:* §1.1 #axiom-p2
-/
axiom successor : N → N

-- ============================================================
-- The Five Peano Axioms
-- ============================================================
-- Axiom 1: 1 ∈ N  (witnessed by `one : N` above)
-- Axiom 2: S x ∈ N for all x  (witnessed by `successor : N → N` above)

/--
**[Axiom P3 — One Is Not a Successor]**

`successor x ≠ one` for every `x : N`.
The distinguished element `one` is not in the range of `successor`.

*Sources:* Landau §1 Axiom 3; Feferman A3; Mendelson P3
*Notes cross-ref:* §1.1 #axiom-p3
-/
axiom A3 : ∀ x : N, successor x ≠ one

/--
**[Axiom P4 — Successor Is Injective]**

`successor x = successor y → x = y` for all `x y : N`.

*Sources:* Landau §1 Axiom 4; Feferman A4; Mendelson P4
*Notes cross-ref:* §1.1 #axiom-p4
-/
axiom A4 : ∀ x y : N, successor x = successor y → x = y

/--
**[Axiom P5 — Induction]**

If a property holds at `one` and is preserved by `successor`,
then it holds for every element of `N`.

*Sources:* Landau §1 Axiom 5; Feferman A5; Mendelson P5
*Notes cross-ref:* §1.1 #axiom-p5
-/
axiom A5_Induction : ∀ (P : N → Prop),
    P one →
    (∀ x : N, P x → P (successor x)) →
    ∀ x : N, P x

/--
**[Theorem — Induction Principle]**

A named wrapper around `A5_Induction` that integrates with
Lean 4's `induction` tactic via `@[recursor 4]`.

*Dependencies:* `A5_Induction`
*Sources:* Landau §1 Axiom 5
*Notes cross-ref:* §1.1 #induction-principle
-/
@[recursor 4]
theorem N_Induction {P : N → Prop}
    (base : P one)
    (step : ∀ n, P n → P (successor n)) :
    ∀ x : N, P x :=
  A5_Induction P base step

-- ============================================================
-- The Recursion Machine — N_rec
-- ============================================================
-- N_rec is the iterator theorem in axiom form.
-- It is the single construction tool for all arithmetic.
-- See Recursion.lean for the full Peano Iterator Theorem.

/--
**[Axiom — N_rec : iterator machine]**

For any type `T`, initial value `base : T`, and step rule
`step : T → T`, `N_rec base step` is the unique function
`N → T` satisfying the two iterator clauses.

This is the Peano Iterator Theorem stated as an axiom.
All arithmetic operations are defined by one application
of `N_rec`.

*Sources:*
  Feferman, *The Number Systems*, §3.4 Theorem 3.4
  Mendelson, *Number Systems*, §2.2 Theorem 2.1
*Notes cross-ref:* §1.2 #n-rec
-/
axiom N_rec : ∀ {T : Type}, T → (T → T) → N → T

/--
**[Axiom — N_rec base clause]**

`N_rec base step one = base`

The iterator-generated function starts at `base`.

*Dependencies:* `N_rec`, `one`
*Notes cross-ref:* §1.2 #theorem-iterator-base-clause
-/
axiom N_rec_one : ∀ {T : Type} (base : T) (step : T → T),
    N_rec base step one = base

/--
**[Axiom — N_rec successor clause]**

`N_rec base step (successor n) = step (N_rec base step n)`

The iterator-generated function advances by `step` at each stage.

*Dependencies:* `N_rec`, `successor`
*Notes cross-ref:* §1.2 #theorem-iterator-successor-clause
-/
axiom N_rec_succ : ∀ {T : Type} (base : T) (step : T → T) (n : N),
    N_rec base step (successor n) = step (N_rec base step n)

end Peano
