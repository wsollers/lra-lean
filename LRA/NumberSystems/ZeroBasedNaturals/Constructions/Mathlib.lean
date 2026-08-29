import LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory.Model
import LRA.NumberSystems.ZeroBasedNaturals.Definition

namespace LRA.NumberSystems.ZeroBasedNaturals.Constructions.Mathlib

open LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory

abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.ZeroBasedNaturals.LRA_MATHLIB_N0

abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

abbrev Carrier := LRA_MathlibCarrier

def genericModel : ZeroBasedNaturalsModel :=
  mathlibZeroBasedNaturalsModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  rfl

def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.ZeroBasedNaturals.Constructions.Mathlib
