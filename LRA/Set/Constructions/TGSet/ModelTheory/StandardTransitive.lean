import LRA.Set.Constructions.GrothendieckUniverse.ModelTheory
import LRA.Set.Constructions.TGSet.Theorems

namespace LRA.Set.Constructions.TGSet

open LRA.Set.Constructions.GrothendieckUniverse

instance : GrothendieckUniverseAxiom LRA.Set.Constructions.TGSet where
  universeExists A :=
    LRA.Set.Constructions.TGSet.GrothendieckUniverseExistsAsGenericUniverse A

end LRA.Set.Constructions.TGSet

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

@[reducible] noncomputable def TGSetCanonicalGrothendieckUniverseMembershipModel
    (A : LRA.Set.Constructions.TGSet) :
    Model MembershipSignature :=
  CanonicalGrothendieckUniverseMembershipModel A

theorem tgSetCanonicalGrothendieckUniverseModelsZFC
    (A : LRA.Set.Constructions.TGSet) :
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory := by
  simpa [TGSetCanonicalGrothendieckUniverseMembershipModel] using
    (canonicalGrothendieckUniverseModelsZFC A)

end LRA.Set.ModelTheory

