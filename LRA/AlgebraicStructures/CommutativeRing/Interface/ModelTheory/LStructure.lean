import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.CommutativeRing.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory

universe u

/-! Law-free `L`-structure builders for the first-order commutative-ring language. -/

open LRA.AlgebraicStructures.CommutativeRing.Interface.Signature

abbrev CommutativeRingSignature :=
  LRA.AlgebraicStructures.RingConceptSignature

def BuildCommutativeRingModel
    (signature : CommutativeRingSignature) :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.BuildRingModel signature

def commutativeRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model CommutativeRingFirstOrderSignature :=
  LRA.AlgebraicStructures.Ring.Interface.ModelTheory.ringFirstOrderModel R

end LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory
