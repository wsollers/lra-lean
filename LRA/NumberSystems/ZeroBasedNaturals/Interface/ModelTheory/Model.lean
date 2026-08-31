import LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory.Theory
import LRA.NumberSystems.ZeroBasedNaturals.Definition
import LRA.AlgebraicStructures
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

structure ZeroBasedNaturalsModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : OrderedSemiringLaws Carrier]
  [strictOrderCert : LRA.Order.StrictOrderCompatibilityLaw Carrier]

attribute [instance] ZeroBasedNaturalsModel.addInst ZeroBasedNaturalsModel.mulInst
  ZeroBasedNaturalsModel.zeroInst ZeroBasedNaturalsModel.oneInst
  ZeroBasedNaturalsModel.ltInst ZeroBasedNaturalsModel.leInst
  ZeroBasedNaturalsModel.carrierNonempty ZeroBasedNaturalsModel.laws
  ZeroBasedNaturalsModel.strictOrderCert

def ZeroBasedNaturalsModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
    [OrderedSemiringLaws R] [LRA.Order.StrictOrderCompatibilityLaw R] :
    ZeroBasedNaturalsModel :=
  { Carrier := R
    addition := AdditionModel.ofCarrier R
    multiplication := MultiplicationModel.ofCarrier R }

def ZeroBasedNaturalsModel.signature
    (M : ZeroBasedNaturalsModel) :
    ZeroBasedNaturalsSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := M.addition.realization.spec.add
  multiply := M.multiplication.realization.spec.mul
  le := (· ≤ ·)
  StrictOrder := (· < ·)

def ZeroBasedNaturalsModel.firstOrderModel
    (M : ZeroBasedNaturalsModel) :
    LRA.Logic.FirstOrder.Model
      LRA.NumberSystems.ZeroBasedNaturals.Interface.Signature.ZeroBasedNaturalsFirstOrderSignature :=
  zeroBasedNaturalsModel M.signature

def mathlibZeroBasedNaturalsModel : ZeroBasedNaturalsModel :=
  ZeroBasedNaturalsModel.ofCarrier LRA.NumberSystems.ZeroBasedNaturals.LRA_MATHLIB_N0

end LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory
