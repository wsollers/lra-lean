import LRA.VolumeII.PeanoSystems.Recursion
import LRA.VolumeII.PeanoSystems.BasicTheorems

namespace Peano

inductive PN : Type where
  | one  : PN
  | succ : PN → PN

def PN_is_peano_system : PeanoSystem where
  carrier             := PN
  one                 := PN.one
  successor           := PN.succ
  one_not_successor   := by
    intro element
    exact PN.noConfusion
  successor_injective := by
    intro first_element second_element h
    exact PN.succ.inj h
  induction           := by
    intro predicate base_case successor_step element
    induction element with
    | one       => exact base_case
    | succ n ih => exact successor_step n ih

theorem PN_peano_system_exists : Nonempty PeanoSystem :=
  ⟨PN_is_peano_system⟩

theorem pn_iso_any_peano_system
    (ps : PeanoSystem) :
    ∃ f : PN → ps.carrier,
      f PN.one = ps.one ∧
      (∀ n : PN, f (PN.succ n) = ps.successor (f n)) ∧
      (∀ g : PN → ps.carrier,
        g PN.one = ps.one →
        (∀ n : PN, g (PN.succ n) = ps.successor (g n)) →
        ∀ n : PN, g n = f n) := by
  let f : PN → ps.carrier :=
    iter PN_is_peano_system ps.carrier ps.one ps.successor
  refine ⟨f, ?_, ?_, ?_⟩
  · exact iter_base PN_is_peano_system ps.carrier ps.one ps.successor
  · intro n
    exact iter_step PN_is_peano_system ps.carrier ps.one ps.successor n
  · intro g g_base g_step
    exact
      iterator_function_unique
        PN_is_peano_system
        ps.carrier ps.one ps.successor
        g f
        ⟨g_base, g_step⟩
        ⟨iter_base PN_is_peano_system ps.carrier ps.one ps.successor,
         iter_step PN_is_peano_system ps.carrier ps.one ps.successor⟩

end Peano
