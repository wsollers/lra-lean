import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Laws.Definition
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Builders

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- The one-based Landau addition law package is cancellative even though this
carrier does not admit an additive identity. -/
theorem LandauAdditiveCancellativeLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    AdditiveCancellativeLaws Element := by
  sorry
/-- Landau multiplication on the Chapter I carrier has `1` as a two-sided
identity. -/
theorem LandauMultiplicativeIdentityLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    MultiplicativeIdentityLaws Element := by
  sorry
/-- The one-based Landau multiplication law package is cancellative on the
positive carrier. -/
theorem LandauMultiplicativeCancellativeLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    MultiplicativeCancellativeLaws Element := by
  sorry
/-- Combined one-based semiring-without-zero package for the Landau Chapter I
carrier. This is the natural algebraic endpoint for the construction before a
zero is adjoined in the whole-number layer. -/
theorem LandauCommutativeSemiringWithoutZeroLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    CommutativeSemiringWithoutZeroLaws Element := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
