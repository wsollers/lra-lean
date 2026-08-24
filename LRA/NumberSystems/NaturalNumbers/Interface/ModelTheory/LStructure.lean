import LRA.NumberSystems.NaturalNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory.Model

namespace LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

open LRA.NumberSystems.NaturalNumbers.Interface.Signature
open LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory

def naturalNumbersModel
    (natural_model : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel natural_model

end LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory
