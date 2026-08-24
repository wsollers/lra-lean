import LRA.NumberSystems.Interface.ModelTheory.Model
import LRA.NumberSystems.Integers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Integers.Interface.Signature
open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory

def integersModel
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    LRA.Logic.FirstOrder.Model IntegersFirstOrderSignature :=
  BuildOrderedRingModel integer_model.signature

end LRA.NumberSystems.Integers.Interface.ModelTheory
