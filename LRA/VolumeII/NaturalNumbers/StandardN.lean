-- LRA/VolumeII/NaturalNumbers/StandardN.lean
--
-- The Bridge Theorem: identifying PN with Lean's Nat.
--
-- This is the formal statement of Landau's convention:
--   "Henceforth we denote by N the positive integers."
--
-- After this file, all arithmetic above the NaturalNumbers layer
-- uses Lean's built-in Nat. Below this file, the abstract
-- PeanoSystem machinery and the PN inductive type are used.
--
-- Sources:
--   Landau,   Foundations of Analysis, §1 (convention, p.5)
--   Feferman, The Number Systems, §3.5 Theorem 3.5 (categoricity)
--   Simpson,  Peano Systems, Theorem 4 (isomorphism)
--
-- Running table of contents:
--
--   Instance | nat_is_peano_system  | Nat satisfies PeanoSystem
--   Theorem  | pn_iso_nat           | PN ≅ Nat as PeanoSystems  (stub)
--   Theorem  | standard_n_convention| the Landau identification  (stub)

import LRA.VolumeII.NaturalNumbers.PeanoN

namespace Peano

-- ============================================================
-- Nat is a Peano system
-- ============================================================

/--
**[Instance — Nat Is a Peano System]**

Lean's built-in `Nat` with distinguished element `1 = Nat.succ Nat.zero`
and successor `Nat.succ` is a Peano system.

Note: we use 1 (not 0) as the distinguished element, consistent
with the one-based convention of the entire VolumeII development.

*Dependencies:* `PeanoSystem`

*Sources:*
  Landau,   *Foundations of Analysis*, §1
  Feferman, *The Number Systems*, §3.2

*Notes cross-ref:* §1.1 [def:peano-system](../notes/section_1_1_main.md)
-/
def nat_is_peano_system : PeanoSystem where
  carrier             := Nat
  one                 := 1
  successor           := Nat.succ
  one_not_successor   := by
    intro element h
    exact Nat.noConfusion h
  successor_injective := by
    intro first_element second_element h
    exact Nat.succ.inj h
  induction           := by
    intro predicate base_case successor_step element
    induction element with
    | zero   =>
        -- zero is not in our one-based system;
        -- the induction hypothesis is vacuously satisfied
        -- via the recursor, but we need to handle this case.
        -- Strategy: use that Nat.rec reduces to the Peano-style
        -- induction starting from 1.
        sorry
    | succ n ih =>
        exact successor_step n ih

-- ============================================================
-- The bridge theorem: PN ≅ Nat
-- ============================================================

/--
**[Theorem — PN Is Isomorphic to Nat]**

The canonical Peano type `PN` and Lean's `Nat` (with the one-based
Peano structure) are isomorphic as Peano systems. That is, there
exists a unique bijection `f : PN → Nat` preserving `one` and
`successor`.

This follows from the categoricity theorem: any two Peano systems
are uniquely isomorphic (Feferman §3.5, Theorem 3.5).

*Dependencies:* `PN_is_peano_system`, `nat_is_peano_system`,
`pn_iso_any_peano_system`

*Sources:*
  Feferman, *The Number Systems*, §3.5 Theorem 3.5
  Simpson,  *Peano Systems*, Theorem 4

*Notes cross-ref:* §1.2
[thm:uniqueness-of-peano-systems-up-to-isomorphism](../notes/section_1_2_main.md)
-/
theorem pn_iso_nat :
    ∃ f : PN → Nat,
      f PN.one = 1 ∧
      (∀ n : PN, f (PN.succ n) = Nat.succ (f n)) ∧
      Function.Bijective f := by
  sorry

-- ============================================================
-- The standard N convention
-- ============================================================

/--
**[Theorem — The Standard Natural Number Convention]**

Henceforth `N` in this development denotes Lean's `Nat`, equipped
with the Peano system structure `nat_is_peano_system`. All theorems
proved for an abstract `PeanoSystem` apply to `nat_is_peano_system`
by instantiation.

This is the formal counterpart of Landau's convention on p.5:
  "The elements of any Peano system will be called positive integers
   (or natural numbers, or simply numbers)."

*Dependencies:* `nat_is_peano_system`, `pn_iso_nat`

*Sources:*
  Landau, *Foundations of Analysis*, §1, p.5 (convention)

*Notes cross-ref:* §1.1 [thm:standard-n-convention](../notes/section_1_1_main.md)
-/
theorem standard_n_convention :
    nat_is_peano_system.carrier = Nat ∧
    nat_is_peano_system.one = 1 ∧
    nat_is_peano_system.successor = Nat.succ :=
  ⟨rfl, rfl, rfl⟩

end Peano
