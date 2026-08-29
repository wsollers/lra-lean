import LRA.NumberSystems.ZeroBasedNaturals.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory

open LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory

abbrev ZeroBasedNaturalsSignature :=
  LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory.OrderedSemiringSignature

def zeroBasedNaturalsModel
    (zero_based_model : ZeroBasedNaturalsSignature) :
    LRA.Logic.FirstOrder.Model
      LRA.NumberSystems.ZeroBasedNaturals.Interface.Signature.ZeroBasedNaturalsFirstOrderSignature :=
  BuildOrderedSemiringModel zero_based_model

end LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory
