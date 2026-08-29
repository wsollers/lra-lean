import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.RealNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.Constructions.Mathlib

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.RealNumbers.LRA_MATHLIB_R

abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

abbrev Carrier := LRA_MathlibCarrier

noncomputable def genericModel : RealModel :=
  mathlibRealModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

noncomputable def firstOrderModel := realNumbersModel genericModel

end LRA.NumberSystems.RealNumbers.Constructions.Mathlib
