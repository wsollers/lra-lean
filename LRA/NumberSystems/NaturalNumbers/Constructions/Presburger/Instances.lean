import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.AlgebraicStructures

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- The concrete Presburger zero acts as the additive identity constant. -/
abbrev PresburgerZeroOn (model : PresburgerModel Element SetObject) :
    OfNat Element 0 :=
  ⟨model.zero⟩

/-- Presburger arithmetic keeps the primitive successor visible alongside the
recursive addition layer. -/
abbrev PresburgerSuccOn (model : PresburgerModel Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩

theorem PresburgerNonemptyOn (model : PresburgerModel Element SetObject) :
    Nonempty Element := by
  sorry
noncomputable abbrev PresburgerAddOn (model : PresburgerModel Element SetObject) :
    Add Element :=
  ⟨PresburgerAddition model⟩

theorem PresburgerAdditiveSemigroupLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveSemigroupLaws Element := by
  sorry
theorem PresburgerAdditiveIdentityLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : OfNat Element 0 := PresburgerZeroOn model
    AdditiveIdentityLaws Element := by
  sorry
theorem PresburgerAdditiveCommutativeLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    AdditiveCommutativeLaws Element := by
  sorry
theorem PresburgerAdditiveMonoidLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : OfNat Element 0 := PresburgerZeroOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveMonoidLaws Element := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
