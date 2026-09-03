import LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.AlgebraicStructures.Field.Interface.ModelTheory
open LRA.NumberSystems.ComplexNumbers.Interface.Signature

universe u

structure ComplexNumberModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  [laws : FieldLaws Carrier]

attribute [instance] ComplexNumberModel.addInst ComplexNumberModel.mulInst
  ComplexNumberModel.negInst ComplexNumberModel.invInst
  ComplexNumberModel.zeroInst ComplexNumberModel.oneInst
  ComplexNumberModel.carrierNonempty ComplexNumberModel.laws

def ComplexNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R]
    [FieldLaws R] : ComplexNumberModel :=
  { Carrier := R }

def ComplexNumberModel.signature
    (M : ComplexNumberModel) :
    LRA.AlgebraicStructures.FieldConceptSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  inv := (·⁻¹)

def ComplexNumberModel.firstOrderModel
    (M : ComplexNumberModel) :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  BuildFieldModel M.signature

noncomputable def mathlibComplexNumberModel : ComplexNumberModel :=
  ComplexNumberModel.ofCarrier Complex

end LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory
