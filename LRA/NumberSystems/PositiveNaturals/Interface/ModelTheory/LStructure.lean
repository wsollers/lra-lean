import LRA.NumberSystems.PositiveNaturals.Interface.Signature.Definition
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory.Model

namespace LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory

open LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory

abbrev PositiveNaturalsSignature :=
  LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature

def positiveNaturalsModel
    (positive_model : PositiveNaturalsSignature) :
    LRA.Logic.FirstOrder.Model
      LRA.NumberSystems.PositiveNaturals.Interface.Signature.PositiveNaturalsFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel positive_model

end LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory
