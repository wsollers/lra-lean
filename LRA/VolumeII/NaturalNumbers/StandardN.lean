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
--   Def     | nat_zero_based_peano_system | Nat with 0 as basepoint
--   Def     | PositiveNat                 | subtype of nonzero Nat values
--   Def     | positive_nat_peano_system   | PositiveNat with 1 as basepoint
--   Theorem | pn_iso_nat                  | PN ≅ Nat as PeanoSystems
--   Theorem | pn_iso_positive_nat         | PN ≅ PositiveNat as PeanoSystems
--   Theorem | standard_n_convention       | the Lean Nat bridge

import LRA.VolumeII.NaturalNumbers.PeanoN

namespace LRA
namespace VolumeII
namespace NaturalNumbers

open LRA.VolumeII.PeanoSystems


-- ============================================================
-- Nat is a zero-based Peano system
-- ============================================================

/--
**[Definition — Zero-Based Nat Peano System]**

The full Lean type `Nat` is a Peano system when `Nat.zero` is
the distinguished basepoint and `Nat.succ` is successor.

Here the field name `one` means the distinguished element of the
abstract Peano system, not the Lean numeral `1`.

*Dependencies:* `PeanoSystem`
-/
def nat_zero_based_peano_system : PeanoSystem where
  carrier             := Nat
  one                 := Nat.zero
  successor           := Nat.succ
  one_not_successor   := Nat.succ_ne_zero
  successor_injective := fun _ _ h => Nat.succ.inj h
  induction           := fun _ b s n => Nat.rec b (fun k ih => s k ih) n

/--
**[Sanity Check — Nat Successor of Basepoint]**

In the zero-based Lean `Nat` bridge, the successor of the
distinguished Peano element is Lean's numeral `1`.

*Dependencies:* `nat_zero_based_peano_system`
-/
theorem nat_zero_based_successor_of_one_is_one :
    nat_zero_based_peano_system.successor
      nat_zero_based_peano_system.one =
      Nat.succ Nat.zero :=
  rfl

-- ============================================================
-- PositiveNat is a one-based Peano system
-- ============================================================

/--
**[Definition — PositiveNat]**

`PositiveNat` is the subtype of Lean natural numbers excluding
`Nat.zero`. It is the one-based bridge from Lean's `Nat` into the
abstract Peano-system interface.

*Dependencies:* `Nat`
-/
def PositiveNat := { n : Nat // n ≠ Nat.zero }

namespace PositiveNat

/-- The first positive natural, represented by Lean's numeral `1`. -/
def one : PositiveNat :=
  ⟨Nat.succ Nat.zero, Nat.succ_ne_zero Nat.zero⟩

/-- Successor on positive naturals, inherited from Lean's `Nat.succ`. -/
def succ (n : PositiveNat) : PositiveNat :=
  ⟨Nat.succ n.val, Nat.succ_ne_zero n.val⟩

end PositiveNat

/--
**[Definition — PositiveNat Peano System]**

The subtype of nonzero Lean naturals is a one-based Peano system:
its distinguished element is Lean's `1`, and successor is inherited
from `Nat.succ`.

*Dependencies:* `PositiveNat`, `PeanoSystem`
-/
def positive_nat_peano_system : PeanoSystem where
  carrier             := PositiveNat
  one                 := PositiveNat.one
  successor           := PositiveNat.succ
  one_not_successor   := by
    intro element h
    have h_val :
        Nat.succ element.val = Nat.succ Nat.zero :=
      congrArg Subtype.val h
    have element_is_zero : element.val = Nat.zero :=
      Nat.succ.inj h_val
    exact element.property element_is_zero
  successor_injective := by
    intro first_element second_element h
    exact Subtype.ext (Nat.succ.inj (congrArg Subtype.val h))
  induction           := by
    intro predicate base_case successor_step element
    cases element with
    | mk value positive =>
      cases value with
      | zero =>
        exact False.elim (positive rfl)
      | succ k =>
        induction k with
        | zero =>
          exact base_case
        | succ k ih =>
          let previous : PositiveNat :=
            ⟨Nat.succ k, Nat.succ_ne_zero k⟩
          exact successor_step previous (ih (Nat.succ_ne_zero k))

/--
**[Sanity Check — PositiveNat Basepoint]**

In the one-based `PositiveNat` bridge, the distinguished Peano
element is represented by Lean's numeral `1`.

*Dependencies:* `positive_nat_peano_system`
-/
theorem positive_nat_one_value_is_one :
    positive_nat_peano_system.one.val = Nat.succ Nat.zero :=
  rfl

/--
**[Sanity Check — PositiveNat Successor of Basepoint]**

In the one-based `PositiveNat` bridge, the successor of the
distinguished Peano element is represented by Lean's numeral `2`.

*Dependencies:* `positive_nat_peano_system`
-/
theorem positive_nat_successor_of_one_value_is_two :
    (positive_nat_peano_system.successor
      positive_nat_peano_system.one).val =
      Nat.succ (Nat.succ Nat.zero) :=
  rfl

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

/--
**[Theorem — PN Is Isomorphic to the PositiveNat System]**

The canonical Peano type `PN` and the positive subtype of Lean's
`Nat` are isomorphic as one-based Peano systems.

*Dependencies:* `PN_is_peano_system`, `positive_nat_peano_system`,
`pn_iso_any_peano_system`
-/
theorem pn_iso_positive_nat :
    ∃ f : PN → PositiveNat,
      f PN.one = PositiveNat.one ∧
      (∀ n : PN, f (PN.succ n) = PositiveNat.succ (f n)) ∧
      (∀ g : PN → PositiveNat,
        g PN.one = PositiveNat.one →
        (∀ n : PN, g (PN.succ n) = PositiveNat.succ (g n)) →
        ∀ n, g n = f n) :=
  pn_iso_any_peano_system positive_nat_peano_system

-- ============================================================
-- The standard N convention
-- ============================================================

/--
**[Theorem — The Standard Natural Number Convention]**

The zero-based Nat Peano system has carrier `Nat`, distinguished
element `Nat.zero`, and successor `Nat.succ`. All theorems proved
for an abstract `PeanoSystem` apply by instantiation.

The one-based counterpart is `positive_nat_peano_system`, whose
carrier is `PositiveNat`.

*Dependencies:* `nat_zero_based_peano_system`

*Sources:* Landau, *Foundations of Analysis*, §1, p.5

*Notes cross-ref:* §1.1 [thm:standard-n-convention](../notes/section_1_1_main.md)
-/
theorem standard_n_convention :
    nat_zero_based_peano_system.carrier = Nat ∧
    nat_zero_based_peano_system.one = Nat.zero ∧
    nat_zero_based_peano_system.successor = Nat.succ :=
  ⟨rfl, rfl, rfl⟩

end NaturalNumbers
end VolumeII
end LRA
