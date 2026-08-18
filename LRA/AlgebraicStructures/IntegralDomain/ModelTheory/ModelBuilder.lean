import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.IntegralDomain.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.IntegralDomain.ModelTheory

universe u

/-! Law-free model builders for the first-order integral-domain language. -/

abbrev IntegralDomainSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingSignature

def BuildIntegralDomainModel
    (signature : IntegralDomainSignature) :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.BuildCommutativeRingModel signature

def integralDomainFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model IntegralDomainFirstOrderSignature :=
  LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.commutativeRingFirstOrderModel R

end LRA.AlgebraicStructures.IntegralDomain.ModelTheory
