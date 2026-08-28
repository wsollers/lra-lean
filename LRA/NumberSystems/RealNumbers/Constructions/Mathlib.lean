import LRA.NumberSystems.Interface.ModelTheory.LStructure
import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Constructions.Mathlib

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

abbrev Carrier := Real

noncomputable def genericModel : RealModel :=
  mathlibRealModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

noncomputable def firstOrderModel := realNumbersModel genericModel

end LRA.NumberSystems.RealNumbers.Constructions.Mathlib
