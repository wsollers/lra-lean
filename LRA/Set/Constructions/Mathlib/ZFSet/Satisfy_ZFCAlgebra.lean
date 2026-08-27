import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra
import LRA.Set.Constructions.Mathlib.ZFSet.Instances
import LRA.Identity.Interface.UniversalAlgebra

/-! Mathlib's ZFSet interprets ZFCSet's exported algebraic signature. -/

namespace LRA.Set.MathlibZFSet

open LRA.Set.Constructions.ZFCSet.Interface.UniversalAlgebra

noncomputable def ZFSetAlgebra : LRA.Identity.AlgebraicStructure SetAlgebraicSignature where
  Carrier := ZFSet
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

theorem ZFSetAlgebraEqualityIsCongruence :
    LRA.Identity.IsCongruence ZFSetAlgebra (· = ·) := by
  sorry

end LRA.Set.MathlibZFSet
