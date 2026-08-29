import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.Model

namespace LRA.NumberSystems.PositiveNaturals.Constructions.LRAInHouse

open LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory
open LRA.AlgebraicStructures

abbrev LRA_InHouseCarrier := LRA.NumberSystems.PositiveNaturals.LRA_N1
axiom lraInHouseAddInst : Add LRA_InHouseCarrier
axiom lraInHouseMulInst : Mul LRA_InHouseCarrier
axiom lraInHouseZeroInst : OfNat LRA_InHouseCarrier 0
axiom lraInHouseOneInst : OfNat LRA_InHouseCarrier 1
axiom lraInHouseNonempty : Nonempty LRA_InHouseCarrier

noncomputable instance : Add LRA_InHouseCarrier := lraInHouseAddInst
noncomputable instance : Mul LRA_InHouseCarrier := lraInHouseMulInst
noncomputable instance : OfNat LRA_InHouseCarrier 0 := lraInHouseZeroInst
noncomputable instance : OfNat LRA_InHouseCarrier 1 := lraInHouseOneInst
noncomputable instance : Nonempty LRA_InHouseCarrier := lraInHouseNonempty
axiom lraInHouseSemiringLaws : CommutativeSemiringLaws LRA_InHouseCarrier
noncomputable instance : CommutativeSemiringLaws LRA_InHouseCarrier := lraInHouseSemiringLaws

abbrev Carrier := LRA_InHouseCarrier

noncomputable def genericModel : PositiveNaturalsModel :=
  PositiveNaturalsModel.ofCarrier LRA_InHouseCarrier

theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  rfl

noncomputable def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.PositiveNaturals.Constructions.LRAInHouse
