import LRA.NumberSystems.ComplexNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.Field.Interface.ModelTheory.Model
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

namespace LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory

open LRA.NumberSystems.ComplexNumbers.Interface.Signature
open LRA.AlgebraicStructures.Field.Interface.ModelTheory
open LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

universe u

def complexNumbersModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  fieldFirstOrderModel (ComplexNumber R)

noncomputable def complexNumbersOverMathlibReals :
    LRA.Logic.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  complexNumbersModel Real

end LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory
