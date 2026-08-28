import LRA.NumberSystems.Interface.ModelTheory.LStructure
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.Constructions.Mathlib

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Integers.Interface.ModelTheory

abbrev Carrier := Int

def genericModel : DiscretelyOrderedIntegralDomainModel :=
  mathlibDiscretelyOrderedIntegralDomainModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

def firstOrderModel := integersModel genericModel

end LRA.NumberSystems.Integers.Constructions.Mathlib
