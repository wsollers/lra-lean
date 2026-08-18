import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.CompleteOrderedField.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.CompleteOrderedField.ModelTheory

universe u

/-! First-order ordered-field reducts of native complete ordered-field data. -/

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

end LRA.AlgebraicStructures.CompleteOrderedField.ModelTheory
