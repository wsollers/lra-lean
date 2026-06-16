import LRA.VolumeII.NaturalNumbers.PeanoN

namespace Peano

def nat_zero_based_peano_system : PeanoSystem where
  carrier             := Nat
  one                 := Nat.zero
  successor           := Nat.succ
  one_not_successor   := Nat.succ_ne_zero
  successor_injective := fun _ _ h => Nat.succ.inj h
  induction           := fun _ b s n => Nat.rec b (fun k ih => s k ih) n

theorem nat_zero_based_successor_of_one_is_one :
    nat_zero_based_peano_system.successor
      nat_zero_based_peano_system.one =
      Nat.succ Nat.zero :=
  rfl

def PositiveNat := { n : Nat // n ≠ Nat.zero }

namespace PositiveNat

def one : PositiveNat :=
  ⟨Nat.succ Nat.zero, Nat.succ_ne_zero Nat.zero⟩

def succ (n : PositiveNat) : PositiveNat :=
  ⟨Nat.succ n.val, Nat.succ_ne_zero n.val⟩

end PositiveNat

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

theorem positive_nat_one_value_is_one :
    positive_nat_peano_system.one.val = Nat.succ Nat.zero :=
  rfl

theorem positive_nat_successor_of_one_value_is_two :
    (positive_nat_peano_system.successor
      positive_nat_peano_system.one).val =
      Nat.succ (Nat.succ Nat.zero) :=
  rfl

theorem pn_iso_nat :
    ∃ f : PN → Nat,
      f PN.one = Nat.zero ∧
      (∀ n : PN, f (PN.succ n) = Nat.succ (f n)) ∧
      (∀ g : PN → Nat,
        g PN.one = Nat.zero →
        (∀ n : PN, g (PN.succ n) = Nat.succ (g n)) →
        ∀ n, g n = f n) :=
  pn_iso_any_peano_system nat_zero_based_peano_system

theorem pn_iso_positive_nat :
    ∃ f : PN → PositiveNat,
      f PN.one = PositiveNat.one ∧
      (∀ n : PN, f (PN.succ n) = PositiveNat.succ (f n)) ∧
      (∀ g : PN → PositiveNat,
        g PN.one = PositiveNat.one →
        (∀ n : PN, g (PN.succ n) = PositiveNat.succ (g n)) →
        ∀ n, g n = f n) :=
  pn_iso_any_peano_system positive_nat_peano_system

theorem standard_n_convention :
    nat_zero_based_peano_system.carrier = Nat ∧
    nat_zero_based_peano_system.one = Nat.zero ∧
    nat_zero_based_peano_system.successor = Nat.succ :=
  ⟨rfl, rfl, rfl⟩

end Peano
