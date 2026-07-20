-- LRA/VolumeII/NaturalNumbers/Presburger.lean
-- Presburger arithmetic as a Peano system with primitive addition.

import LRA.VolumeII.NaturalNumbers.Order
import LRA.VolumeI.FirstOrderLogic.PresburgerArithmetic

namespace LRA
namespace VolumeII
namespace NaturalNumbers
namespace Presburger

/-!
Volume II label: presburger-natural-number-system
Lean module: LRA.VolumeII.NaturalNumbers.Presburger
Source: Volume I Presburger arithmetic, brought into Volume II as a Peano system
Verification status: statement-accepted-proof-pending

Presburger arithmetic is represented here as a one-based Peano carrier equipped
with primitive addition satisfying the Peano addition equations.  The sibling
Volume I file formalizes the first-order theory; this file exposes the
number-system interface needed by Volume II.
-/

open LRA.VolumeII.PeanoSystems

structure PresburgerPeanoSystem extends PeanoSystem where
  addition : carrier → carrier → carrier
  addition_base :
    ∀ left : carrier, addition left one = successor left
  addition_step :
    ∀ left right : carrier,
      addition left (successor right) = successor (addition left right)
  addition_is_associative :
    Foundation.Algebra.associative addition
  addition_is_commutative :
    Foundation.Algebra.commutative addition

def as_peano_system (presburger_system : PresburgerPeanoSystem) : PeanoSystem :=
  presburger_system.toPeanoSystem

theorem presburger_addition_agrees_with_peano_iteration
    (presburger_system : PresburgerPeanoSystem)
    (left right : presburger_system.carrier) :
    presburger_system.addition left right =
      plus (as_peano_system presburger_system) left right := by
  sorry

theorem volume_i_standard_presburger_model_yields_volume_ii_system :
    ∃ presburger_system : PresburgerPeanoSystem,
      Nonempty presburger_system.carrier := by
  sorry

end Presburger
end NaturalNumbers
end VolumeII
end LRA
