import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.Model
import LRA.NumberSystems.PositiveNaturals.Definition

namespace LRA.NumberSystems.PositiveNaturals.Constructions.Mathlib

open LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory

abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.PositiveNaturals.LRA_MATHLIB_N1

abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

abbrev Carrier := LRA_MathlibCarrier

def genericModel : PositiveNaturalsModel :=
  mathlibPositiveNaturalsModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  rfl

def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.PositiveNaturals.Constructions.Mathlib
