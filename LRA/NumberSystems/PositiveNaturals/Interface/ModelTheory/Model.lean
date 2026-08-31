import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.Theory
import LRA.NumberSystems.PositiveNaturals.Definition
import LRA.AlgebraicStructures
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

structure PositiveNaturalsModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : CommutativeSemiringLaws Carrier]

attribute [instance] PositiveNaturalsModel.addInst PositiveNaturalsModel.mulInst
  PositiveNaturalsModel.zeroInst PositiveNaturalsModel.oneInst
  PositiveNaturalsModel.carrierNonempty PositiveNaturalsModel.laws

def PositiveNaturalsModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R]
    [CommutativeSemiringLaws R] : PositiveNaturalsModel :=
  { Carrier := R
    addition := AdditionModel.ofCarrier R
    multiplication := MultiplicationModel.ofCarrier R }

def PositiveNaturalsModel.signature
    (M : PositiveNaturalsModel) :
    PositiveNaturalsSignature where
  carrier := M.Carrier
  one := 1
  add := M.addition.realization.spec.add
  multiply := M.multiplication.realization.spec.mul

def PositiveNaturalsModel.firstOrderModel
    (M : PositiveNaturalsModel) :
    LRA.Logic.FirstOrder.Model
      LRA.NumberSystems.PositiveNaturals.Interface.Signature.PositiveNaturalsFirstOrderSignature :=
  positiveNaturalsModel M.signature

def mathlibPositiveNaturalsModel : PositiveNaturalsModel :=
  PositiveNaturalsModel.ofCarrier LRA.NumberSystems.PositiveNaturals.LRA_MATHLIB_N1

end LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory
