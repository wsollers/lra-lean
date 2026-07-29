-- LRA/VolumeI/Algebra/Models/CharacteristicCardinality.lean
-- Characteristic and cardinality obligations for the number-system tower.

import LRA.VolumeI.Algebra.Models.Models

namespace LRA.VolumeI.Algebra.Models.CharacteristicCardinality

/-!
Volume II label: characteristic-and-cardinality
Lean module: LRA.VolumeI.Algebra.Models.CharacteristicCardinality
Source: docs/number-systems/gpt-09a-characteristic-cardinality.md
Verification status: statement-accepted-proof-pending
-/

def CharacteristicZero (signature : OrderedRingSignature) : Prop :=
  ∀ n : Nat,
    n ≠ 0 →
      Nat.rec signature.zero
        (fun _ previous => signature.addition previous signature.one)
        n ≠ signature.zero

def countable (α : Type u) : Prop :=
  ∃ enumerate : Nat → α, ∀ value : α, ∃ index, enumerate index = value

def uncountable (α : Type u) : Prop :=
  ¬ countable α

theorem IntegerRationalRealHaveCharacteristicZero
    (integer_model : IntegerModel)
    (rational_model : RationalModel)
    (real_model : RealModel) :
    CharacteristicZero integer_model.signature ∧
      CharacteristicZero rational_model.signature.toOrderedRingSignature ∧
      CharacteristicZero real_model.signature.toOrderedRingSignature := by
  sorry

theorem RationalsAreCountable
    (rational_model : RationalModel) :
    countable rational_model.signature.carrier := by
  sorry

theorem RealsAreUncountable
    (real_model : RealModel) :
    uncountable real_model.signature.carrier := by
  sorry

end LRA.VolumeI.Algebra.Models.CharacteristicCardinality
