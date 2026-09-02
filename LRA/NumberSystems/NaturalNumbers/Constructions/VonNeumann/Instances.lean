import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.AlgebraicStructures

noncomputable abbrev VonNeumannZeroOn : OfNat NaturalElement 0 :=
  ⟨NaturalZero⟩

noncomputable abbrev VonNeumannOneOn : OfNat NaturalElement 1 :=
  ⟨NaturalOne⟩

noncomputable abbrev VonNeumannSuccOn : HasSuccessor NaturalElement :=
  ⟨NaturalSuccessor⟩

theorem VonNeumannNonemptyOn :
    Nonempty NaturalElement := by
  sorry

noncomputable abbrev VonNeumannAddOn : Add NaturalElement :=
  ⟨VonNeumannAddition⟩

noncomputable abbrev VonNeumannMulOn : Mul NaturalElement :=
  ⟨VonNeumannMultiplication⟩

theorem VonNeumannAdditiveSemigroupLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    AdditiveSemigroupLaws NaturalElement := by
  sorry

theorem VonNeumannAdditiveIdentityLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    AdditiveIdentityLaws NaturalElement := by
  sorry

theorem VonNeumannAdditiveCommutativeLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    AdditiveCommutativeLaws NaturalElement := by
  sorry

theorem VonNeumannAdditiveMonoidLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    AdditiveMonoidLaws NaturalElement := by
  sorry

theorem VonNeumannMultiplicativeSemigroupLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    MultiplicativeSemigroupLaws NaturalElement := by
  sorry

theorem VonNeumannMultiplicativeIdentityLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    MultiplicativeIdentityLaws NaturalElement := by
  sorry

theorem VonNeumannMultiplicativeCommutativeLawsOn :
    let _ : Mul NaturalElement := VonNeumannMulOn
    MultiplicativeCommutativeLaws NaturalElement := by
  sorry

theorem VonNeumannDistributiveLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    DistributiveLaws NaturalElement := by
  sorry

theorem VonNeumannSemiringLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    SemiringLaws NaturalElement := by
  sorry

theorem VonNeumannCommutativeSemiringLawsOn :
    let _ : Add NaturalElement := VonNeumannAddOn
    let _ : Mul NaturalElement := VonNeumannMulOn
    let _ : OfNat NaturalElement 0 := VonNeumannZeroOn
    let _ : OfNat NaturalElement 1 := VonNeumannOneOn
    let _ : Nonempty NaturalElement := VonNeumannNonemptyOn
    CommutativeSemiringLaws NaturalElement := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
