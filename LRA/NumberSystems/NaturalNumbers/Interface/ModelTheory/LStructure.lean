import LRA.NumberSystems.NaturalNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory.Model

namespace LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

open LRA.NumberSystems.NaturalNumbers.Interface.Signature
open LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory

def naturalNumbersModel
    (natural_model : LRA.AlgebraicStructures.CommutativeSemiringConceptSignature) :
    LRA.Logic.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  BuildCommutativeSemiringModel natural_model

end LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory
