import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Instances

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.AlgebraicStructures

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- The 0-based Presburger construction canonically realizes additive
commutative semigroup structure. -/
theorem satisfiesAdditiveCommutativeSemigroup
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveCommutativeSemigroupLaws Element := by
  sorry

/-- The 0-based Presburger construction canonically realizes additive monoid
structure. -/
theorem satisfiesAdditiveMonoid
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : OfNat Element 0 := PresburgerZeroOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveMonoidLaws Element := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
