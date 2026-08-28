import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.NumberSystems.NaturalNumbers.Interface.Signature

universe u

structure NaturalNumberModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  [laws : CommutativeSemiringLaws Carrier]

attribute [instance] NaturalNumberModel.addInst NaturalNumberModel.mulInst
  NaturalNumberModel.zeroInst NaturalNumberModel.oneInst
  NaturalNumberModel.carrierNonempty NaturalNumberModel.laws

def NaturalNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R]
    [CommutativeSemiringLaws R] : NaturalNumberModel :=
  { Carrier := R }

def NaturalNumberModel.signature
    (M : NaturalNumberModel) :
    LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature where
  carrier := M.Carrier
  one := 1
  add := (· + ·)
  multiply := (· * ·)

def NaturalNumberModel.firstOrderModel
    (M : NaturalNumberModel) :
    LRA.Logic.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  naturalNumbersModel M.signature

def mathlibNaturalNumberModel : NaturalNumberModel :=
  NaturalNumberModel.ofCarrier Nat

end LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory
