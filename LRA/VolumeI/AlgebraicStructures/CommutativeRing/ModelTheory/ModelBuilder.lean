import LRA.VolumeI.AlgebraicStructures.Ring.ModelTheory.ModelBuilder
import LRA.VolumeI.AlgebraicStructures.CommutativeRing.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.CommutativeRing.ModelTheory

universe u

/-! Law-free model builders for the first-order commutative-ring language. -/

abbrev CommutativeRingSignature :=
  LRA.AlgebraicStructures.Ring.ModelTheory.RingSignature

def BuildCommutativeRingModel
    (signature : CommutativeRingSignature) :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.ModelTheory.BuildRingModel signature

def commutativeRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.ModelTheory.ringFirstOrderModel R

end LRA.AlgebraicStructures.CommutativeRing.ModelTheory
