import LRA.Set.Constructions.GrothendieckUniverse.Satisfy_ZFC
import LRA.Set.Constructions.TGSet.Theorems
import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory

namespace LRA.Set.Constructions.TGSet

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.GrothendieckUniverse
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

instance : GrothendieckUniverseAxiom LRA.Set.Constructions.TGSet := by
  sorry

@[reducible] noncomputable def TGSetCanonicalGrothendieckUniverseMembershipModel
    (A : LRA.Set.Constructions.TGSet) :
    Model MembershipSignature :=
  CanonicalGrothendieckUniverseMembershipModel A

theorem tgSetCanonicalGrothendieckUniverseModelsZFC
    (A : LRA.Set.Constructions.TGSet) :
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.Constructions.TGSet
