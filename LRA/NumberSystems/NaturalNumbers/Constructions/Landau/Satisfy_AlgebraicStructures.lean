import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Instances

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- The one-based Landau construction canonically realizes additive
commutative semigroup structure. -/
theorem satisfiesAdditiveCommutativeSemigroup
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    AdditiveCommutativeSemigroupLaws Element := by
  sorry

/-- The one-based Landau construction canonically realizes multiplicative
commutative monoid structure. -/
theorem satisfiesCommutativeMonoid
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    CommutativeMonoidLaws Element := by
  sorry

/-- The one-based Landau construction canonically realizes the positive-naturals
endpoint of the algebraic hierarchy: a commutative semiring without zero. -/
theorem satisfiesCommutativeSemiringWithoutZero
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    CommutativeSemiringWithoutZeroLaws Element := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
