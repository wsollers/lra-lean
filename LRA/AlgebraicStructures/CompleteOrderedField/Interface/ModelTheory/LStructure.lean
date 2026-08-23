import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory

universe u

                                                                   

open LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature

abbrev CompleteOrderedFieldSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature

def BuildCompleteOrderedFieldFirstOrderReduct
    (signature : CompleteOrderedFieldSignature) :
    LRA.Logic.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.BuildOrderedFieldModel signature

def completeOrderedFieldFirstOrderReduct (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.orderedFieldFirstOrderModel R

end LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory
