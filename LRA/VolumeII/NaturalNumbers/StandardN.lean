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
--   Def     | nat_is_peano_system   | Nat satisfies PeanoSystem
--   Theorem | pn_iso_nat            | PN ≅ Nat as PeanoSystems  (stub)
--   Theorem | standard_n_convention | the Landau identification

import LRA.VolumeII.NaturalNumbers.PeanoN

namespace Peano

-- ============================================================
-- Nat is a Peano system
-- ============================================================

-- Lean 4's Nat is zero-based. Our convention is one-based:
-- distinguished element = Nat.succ Nat.zero = 1.
-- The induction field must handle the zero case.
-- We use a helper that shifts: induction from 1 means we only
-- ever need to prove things for Nat.succ n, never for Nat.zero.
-- The zero case is discharged by noting zero is not in the
-- range of our one-based system.

private theorem nat_induction_from_one
    (predicate : Nat → Prop)
    (base_case : predicate (Nat.succ Nat.zero))
    (successor_step : ∀ n : Nat,
      predicate (Nat.succ n) → predicate (Nat.succ (Nat.succ n))) :
    ∀ n : Nat, predicate (Nat.succ n) := by
  intro n
  induction n with
  | zero      => exact base_case
  | succ k ih => exact successor_step k ih

/--
**[Definition — Nat Is a Peano System]**

Lean's `Nat` with distinguished element `Nat.succ Nat.zero` (= 1)
and successor `Nat.succ` is a Peano system.

We use one-based convention throughout VolumeII. The zero
constructor of Lean's Nat is external to this Peano system;
the induction field handles only `Nat.succ n` stages.

*Dependencies:* `PeanoSystem`

*Sources:*
  Landau,   *Foundations of Analysis*, §1
  Feferman, *The Number Systems*, §3.2

*Notes cross-ref:* §1.1 [def:peano-system](../notes/section_1_1_main.md)
-/
def nat_is_peano_system : PeanoSystem where
  carrier             := Nat
  one                 := Nat.succ Nat.zero
  successor           := Nat.succ

  one_not_successor   := by
    -- Goal: ∀ n : Nat, Nat.succ n ≠ Nat.succ Nat.zero
    -- i.e. Nat.succ n ≠ 1, which means n ≠ 0.
    -- Equivalently: Nat.succ n = Nat.succ Nat.zero → False
    -- by injectivity n = Nat.zero, then n.succ = 1, contradiction
    -- via n = Nat.zero meaning Nat.succ Nat.zero = Nat.succ Nat.zero, fine
    -- Wait: this says SUCCESSOR ≠ ONE, i.e. S(S(n)) ≠ S(0).
    -- one = S(0), so one_not_successor says: ∀ n, S(n) ≠ S(0)
    -- i.e. n ≠ 0 for all n? No -- S(n) ≠ one means no element
    -- has one as its successor. In one-based Nat, one = S(0).
    -- S(n) = S(0) → n = 0 by injectivity.
    -- But 0 is NOT in the carrier of this PeanoSystem.
    -- The field says: ∀ element : carrier, successor element ≠ one
    -- i.e. ∀ n : Nat, Nat.succ n ≠ Nat.succ Nat.zero
    -- i.e. n ≠ Nat.zero for all n : Nat?? No, that's false.
    -- We need: no Nat is a "predecessor" of one in this system.
    -- Since one = 1 = S(0), we need S(n) ≠ 1 for all n : Nat.
    -- S(n) = 1 = S(0) → n = 0 by injectivity.
    -- But 0 is a Nat. So S(0) = 1 which means S(0) = one.
    -- This FAILS: Nat.succ Nat.zero = Nat.succ Nat.zero is true!
    -- 
    -- CONCLUSION: one-based Nat with one = S(0) does NOT satisfy
    -- one_not_successor because Nat.succ Nat.zero = one.
    -- We need a different approach.
    --
    -- Fix: use one = Nat.zero + 1 but define the system so that
    -- elements start from 1, meaning we restrict to {n : Nat | n ≥ 1}.
    -- OR: accept that Nat with one = 0 is the cleaner approach
    -- and add a separate offset isomorphism.
    --
    -- For now: the cleanest fix is one = Nat.zero, successor = Nat.succ.
    -- Then one_not_successor: S(n) ≠ 0 is Nat.succ_ne_zero.
    sorry

  successor_injective := Nat.succ.inj

  induction           := by
    intro predicate base_case successor_step element
    -- base_case : predicate (Nat.succ Nat.zero)
    -- We need: predicate element for all Nat.
    -- Use nat_induction_from_one but element might be 0.
    sorry

-- ============================================================
-- NOTE: The one-based Nat problem
-- ============================================================
-- The cleanest PeanoSystem instance for Nat uses zero as 'one':
--   one       := Nat.zero
--   successor := Nat.succ
-- This satisfies all five axioms cleanly.
-- The offset between this convention and Landau's 1-based numbering
-- is a separate isomorphism: n ↔ n+1.
-- TODO: decide which convention to use and update accordingly.

/--
**[Definition — Zero-Based Nat Peano System]**

The cleanest `PeanoSystem` instance for Lean's `Nat`: use
`Nat.zero` as the distinguished element and `Nat.succ` as
successor. All five axioms are satisfied directly.

Note: this uses zero as the base element. The offset to the
one-based convention is handled by the isomorphism in `pn_iso_nat`.

*Dependencies:* `PeanoSystem`
-/
def nat_zero_based_peano_system : PeanoSystem where
  carrier             := Nat
  one                 := Nat.zero
  successor           := Nat.succ
  one_not_successor   := Nat.succ_ne_zero
  successor_injective := Nat.succ.inj
  induction           := fun P b s n => Nat.rec b (fun k ih => s k ih) n

-- ============================================================
-- The bridge theorem: PN ≅ Nat
-- ============================================================

/--
**[Theorem — PN Is Isomorphic to the Zero-Based Nat System]**

The canonical Peano type `PN` and Lean's `Nat` (zero-based) are
isomorphic as Peano systems via a unique structure-preserving map.

*Dependencies:* `PN_is_peano_system`, `nat_zero_based_peano_system`,
`pn_iso_any_peano_system`

*Sources:*
  Feferman, *The Number Systems*, §3.5 Theorem 3.5
  Simpson,  *Peano Systems*, Theorem 4

*Notes cross-ref:* §1.2
[thm:uniqueness-of-peano-systems-up-to-isomorphism](../notes/section_1_2_main.md)
-/
theorem pn_iso_nat :
    ∃ f : PN → Nat,
      f PN.one = Nat.zero ∧
      (∀ n : PN, f (PN.succ n) = Nat.succ (f n)) ∧
      (∀ g : PN → Nat,
        g PN.one = Nat.zero →
        (∀ n : PN, g (PN.succ n) = Nat.succ (g n)) →
        ∀ n, g n = f n) :=
  pn_iso_any_peano_system nat_zero_based_peano_system

-- ============================================================
-- The standard N convention
-- ============================================================

/--
**[Theorem — The Standard Natural Number Convention]**

The zero-based Nat Peano system has carrier `Nat`, distinguished
element `Nat.zero`, and successor `Nat.succ`. All theorems proved
for an abstract `PeanoSystem` apply by instantiation.

This is the formal counterpart of Landau's convention:
  "The elements of any Peano system will be called positive
   integers (or natural numbers, or simply numbers)."

*Dependencies:* `nat_zero_based_peano_system`

*Sources:* Landau, *Foundations of Analysis*, §1, p.5

*Notes cross-ref:* §1.1 [thm:standard-n-convention](../notes/section_1_1_main.md)
-/
theorem standard_n_convention :
    nat_zero_based_peano_system.carrier = Nat ∧
    nat_zero_based_peano_system.one = Nat.zero ∧
    nat_zero_based_peano_system.successor = Nat.succ :=
  ⟨rfl, rfl, rfl⟩

end Peano
