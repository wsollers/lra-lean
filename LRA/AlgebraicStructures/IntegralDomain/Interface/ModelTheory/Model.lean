import LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted integral-domain model packaging the additive and multiplicative
operator interfaces together with the integral-domain law bundle. -/
structure IntegralDomainModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.IntegralDomainLaws Carrier]

/-- The integral-domain signature induced by a promoted model. -/
def IntegralDomainModel.signature {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    IntegralDomainSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    neg := (- ·)
    multiply := model.multiplication.realization.spec.mul }

/-- The first-order model induced by a promoted integral-domain model. -/
def IntegralDomainModel.firstOrderModel {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    LRA.Logic.FirstOrder.Model
      LRA.AlgebraicStructures.IntegralDomain.Interface.Signature.IntegralDomainFirstOrderSignature :=
  BuildIntegralDomainModel model.signature

/-- Forget an integral-domain model down to its commutative-ring reduct. -/
def IntegralDomainModel.toCommutativeRingModel {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI := model.laws
  { addInst := model.addInst
    mulInst := model.mulInst
    negInst := model.negInst
    zeroInst := model.zeroInst
    oneInst := model.oneInst
    carrierNonempty := model.carrierNonempty
    addition := model.addition
    multiplication := model.multiplication
    laws := inferInstance }

end LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory
