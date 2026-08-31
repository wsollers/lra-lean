import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
open LRA.NumberSystems.WholeNumbers.Interface.Signature
open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

structure WholeNumberModel : Type (u + 1) where
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

attribute [instance] WholeNumberModel.addInst WholeNumberModel.mulInst
  WholeNumberModel.zeroInst WholeNumberModel.oneInst WholeNumberModel.ltInst
  WholeNumberModel.leInst WholeNumberModel.carrierNonempty WholeNumberModel.laws
  WholeNumberModel.strictOrderCert

def WholeNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
    [OrderedSemiringLaws R] [LRA.Order.StrictOrderCompatibilityLaw R] :
    WholeNumberModel :=
  { Carrier := R
    addition := AdditionModel.ofCarrier R
    multiplication := MultiplicationModel.ofCarrier R }

def WholeNumberModel.signature
    (M : WholeNumberModel) :
    OrderedSemiringSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := M.addition.realization.spec.add
  multiply := M.multiplication.realization.spec.mul
  le := (· ≤ ·)
  StrictOrder := (· < ·)

def WholeNumberModel.firstOrderModel
    (M : WholeNumberModel) :
    LRA.Logic.FirstOrder.Model WholeNumbersFirstOrderSignature :=
  BuildOrderedSemiringModel M.signature

def mathlibWholeNumberModel : WholeNumberModel :=
  WholeNumberModel.ofCarrier Nat

end LRA.NumberSystems.WholeNumbers.Interface.ModelTheory
