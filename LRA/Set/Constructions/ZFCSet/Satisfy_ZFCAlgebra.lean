import LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra
import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Identity.Interface.UniversalAlgebra

/-! ZFCSet interprets its own exported algebraic signature. -/

namespace LRA.Set.Constructions.ZFCSet

open LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra

noncomputable def ZFCSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
  Carrier := LRA.Set.Constructions.ZFCSet
  carrierNonempty := ⟨∅⟩
  interpretOperation := fun symbol args =>
    match symbol with
    | .union => args ⟨0, by decide⟩ ∪ args ⟨1, by decide⟩
    | .inter => args ⟨0, by decide⟩ ∩ args ⟨1, by decide⟩
    | .difference => args ⟨0, by decide⟩ \ args ⟨1, by decide⟩
    | .symmDiff => HasSymmDiff.symmDiff (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .powerSet => HasPowerset.powerset (args ⟨0, by decide⟩)
    | .collectionUnion => HasCollectionUnion.collectionUnion (args ⟨0, by decide⟩)
    | .collectionIntersection =>
        HasCollectionIntersection.collectionIntersection (args ⟨0, by decide⟩)
  interpretConstant := fun constant =>
    match constant with
    | .emptySet => ∅

theorem ZFCSetAlgebraEqualityIsCongruence :
    LRA.Identity.IsCongruence ZFCSetAlgebra (· = ·) := by
  sorry

end LRA.Set.Constructions.ZFCSet
