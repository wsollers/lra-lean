import LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory.Model

namespace LRA.NumberSystems.ZeroBasedNaturals.Constructions.LRAInHouse

open LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory
open LRA.AlgebraicStructures
open LRA.Order

abbrev LRA_InHouseCarrier := LRA.NumberSystems.ZeroBasedNaturals.LRA_N0
axiom lraInHouseAddInst : Add LRA_InHouseCarrier
axiom lraInHouseMulInst : Mul LRA_InHouseCarrier
axiom lraInHouseZeroInst : OfNat LRA_InHouseCarrier 0
axiom lraInHouseOneInst : OfNat LRA_InHouseCarrier 1
axiom lraInHouseLtInst : LT LRA_InHouseCarrier
axiom lraInHouseLeInst : LE LRA_InHouseCarrier
axiom lraInHouseNonempty : Nonempty LRA_InHouseCarrier

noncomputable instance : Add LRA_InHouseCarrier := lraInHouseAddInst
noncomputable instance : Mul LRA_InHouseCarrier := lraInHouseMulInst
noncomputable instance : OfNat LRA_InHouseCarrier 0 := lraInHouseZeroInst
noncomputable instance : OfNat LRA_InHouseCarrier 1 := lraInHouseOneInst
noncomputable instance : LT LRA_InHouseCarrier := lraInHouseLtInst
noncomputable instance : LE LRA_InHouseCarrier := lraInHouseLeInst
noncomputable instance : Nonempty LRA_InHouseCarrier := lraInHouseNonempty
axiom lraInHouseSemiringLaws : OrderedSemiringLaws LRA_InHouseCarrier
axiom lraInHouseStrictOrderCompatibility : StrictOrderCompatibilityLaw LRA_InHouseCarrier
noncomputable instance : OrderedSemiringLaws LRA_InHouseCarrier := lraInHouseSemiringLaws
noncomputable instance : StrictOrderCompatibilityLaw LRA_InHouseCarrier := lraInHouseStrictOrderCompatibility

abbrev Carrier := LRA_InHouseCarrier

noncomputable def genericModel : ZeroBasedNaturalsModel :=
  ZeroBasedNaturalsModel.ofCarrier LRA_InHouseCarrier

theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  rfl

noncomputable def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.ZeroBasedNaturals.Constructions.LRAInHouse
