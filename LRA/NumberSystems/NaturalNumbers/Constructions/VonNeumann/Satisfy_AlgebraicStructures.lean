import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Instances

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.AlgebraicStructures

/-- The concrete von Neumann construction canonically realizes additive monoid
structure. -/
theorem satisfiesAdditiveMonoid :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    AdditiveMonoidLaws NaturalElement := by
  sorry
/-- The concrete von Neumann construction canonically realizes multiplicative
commutative monoid structure. -/
theorem satisfiesCommutativeMonoid :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    CommutativeMonoidLaws NaturalElement := by
  sorry
/-- The concrete von Neumann construction canonically realizes semiring
structure. -/
theorem satisfiesSemiring :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    SemiringLaws NaturalElement := by
  sorry
/-- The concrete von Neumann construction canonically realizes commutative
semiring structure. -/
theorem satisfiesCommutativeSemiring :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    CommutativeSemiringLaws NaturalElement := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
