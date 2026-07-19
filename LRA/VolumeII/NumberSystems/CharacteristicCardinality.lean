-- LRA/VolumeII/NumberSystems/CharacteristicCardinality.lean
-- Characteristic and cardinality obligations for the number-system tower.

import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace NumberSystems
namespace CharacteristicCardinality

/-!
Volume II label: characteristic-and-cardinality
Lean module: LRA.VolumeII.NumberSystems.CharacteristicCardinality
Source: docs/number-systems/gpt-09a-characteristic-cardinality.md
Verification status: statement-accepted-proof-pending
-/

def characteristic_zero (signature : OrderedRingSignature) : Prop :=
  ∀ n : Nat,
    n ≠ 0 →
      Nat.rec signature.zero
        (fun _ previous => signature.addition previous signature.one)
        n ≠ signature.zero

def countable (α : Type u) : Prop :=
  ∃ enumerate : Nat → α, ∀ value : α, ∃ index, enumerate index = value

def uncountable (α : Type u) : Prop :=
  ¬ countable α

theorem integer_rational_real_have_characteristic_zero
    (integer_model : IntegerModel)
    (rational_model : RationalModel)
    (real_model : RealModel) :
    characteristic_zero integer_model.signature ∧
      characteristic_zero rational_model.signature.toOrderedRingSignature ∧
      characteristic_zero real_model.signature.toOrderedRingSignature := by
  sorry

theorem rationals_are_countable
    (rational_model : RationalModel) :
    countable rational_model.signature.carrier := by
  sorry

theorem reals_are_uncountable
    (real_model : RealModel) :
    uncountable real_model.signature.carrier := by
  sorry

end CharacteristicCardinality
end NumberSystems
end VolumeII
end LRA
