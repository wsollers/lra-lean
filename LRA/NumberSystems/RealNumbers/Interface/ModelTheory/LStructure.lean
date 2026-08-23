import LRA.NumberSystems.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Interface.ModelTheory

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

def realNumbersModel
    (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model RealNumbersFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature

end LRA.NumberSystems.RealNumbers.Interface.ModelTheory
