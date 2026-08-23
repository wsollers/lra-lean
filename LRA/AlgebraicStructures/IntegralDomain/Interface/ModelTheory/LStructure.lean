import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.IntegralDomain.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory

universe u

                                                                                    

open LRA.AlgebraicStructures.IntegralDomain.Interface.Signature

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

end LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory
