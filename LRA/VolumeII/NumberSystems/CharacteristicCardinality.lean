-- LRA/VolumeII/NumberSystems/CharacteristicCardinality.lean
-- Characteristic and cardinality obligations for the number-system tower.

import LRA.VolumeII.NumberSystems.Models
import LRA.Carrier.Countability

namespace LRA.NumberSystems.Models.CharacteristicCardinality

open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory

/-!
Volume II label: characteristic-and-cardinality
Lean module: LRA.NumberSystems.Models.CharacteristicCardinality
Source: docs/number-systems/gpt-09a-characteristic-cardinality.md
Verification status: statement-accepted-proof-pending
-/

/-- A ring signature has characteristic zero when no positive natural multiple
of one is zero. -/
def CharacteristicZero (signature : OrderedRingSignature) : Prop :=
  ∀ n : Nat,
    n ≠ 0 →
      Nat.rec signature.zero
        (fun _ previous => signature.add previous signature.one)
        n ≠ signature.zero

/-- Integer models, densely ordered field models, and real models all have
characteristic zero. This is a structural theorem; the middle model is not
assumed to be the rational numbers. -/
theorem IntegerDenselyOrderedFieldRealHaveCharacteristicZero
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel)
    (SelectedRealModel : RealModel) :
    CharacteristicZero SelectedIntegerModel.signature ∧
      CharacteristicZero
        SelectedDenselyOrderedFieldModel.signature.toOrderedRingSignature ∧
      CharacteristicZero SelectedRealModel.signature.toOrderedRingSignature := by
  sorry

/-- Every real model is uncountable. `RealModel` carries full order completeness
relative to `Set Carrier`, so this is a theorem about the complete ordered-field
structure rather than a first-order cardinality axiom. -/
theorem RealsAreUncountable
    (SelectedRealModel : RealModel) :
    LRA.Carrier.IsUncountable SelectedRealModel.Carrier := by
  sorry

end LRA.NumberSystems.Models.CharacteristicCardinality
