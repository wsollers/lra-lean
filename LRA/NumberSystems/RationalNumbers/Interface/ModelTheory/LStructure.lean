import LRA.NumberSystems.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

def rationalNumbersModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.Logic.FirstOrder.Model RationalNumbersFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature

end LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
