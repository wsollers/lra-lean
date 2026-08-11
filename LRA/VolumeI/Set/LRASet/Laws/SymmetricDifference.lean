import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.SymmetricDifference

namespace LRA.VolumeI.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Symmetric-difference laws for predicate sets: the backend's certificate
for `LRA.VolumeI.Set.SymmDiffLaws`. `A ∆ B` resolves through the
`HasSymmDiff (LRASet Alpha)` instance in `Instances.lean`, backed by
`Operations.SymmetricDifference`.
-/

theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : LRASet Alpha, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : LRASet Alpha, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

theorem SymmetricDifferenceCommutative :
    ∀ A B : LRASet Alpha, A ∆ B = B ∆ A := by
  sorry

theorem SymmetricDifferenceAssociative :
    ∀ A B C : LRASet Alpha, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

theorem SymmetricDifferenceEmpty :
    ∀ A : LRASet Alpha, A ∆ (∅ : LRASet Alpha) = A := by
  sorry

theorem EmptySymmetricDifference :
    ∀ A : LRASet Alpha, (∅ : LRASet Alpha) ∆ A = A := by
  sorry

theorem SymmetricDifferenceSelf :
    ∀ A : LRASet Alpha, A ∆ A = (∅ : LRASet Alpha) := by
  sorry

theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : LRASet Alpha, A ∆ B = (∅ : LRASet Alpha) ↔ A = B := by
  sorry

theorem SymmetricDifferenceSubsetUnion :
    ∀ A B : LRASet Alpha, A ∆ B ⊆ A ∪ B := by
  sorry

/-- Registration: predicate sets satisfy the symmetric-difference laws.
Pure delegation to the theorems above. -/
instance : SymmDiffLaws (LRASet Alpha) where
  SymmetricDifferenceAsUnionDifferences :=
    LRA.VolumeI.Set.LRASet.SymmetricDifferenceAsUnionDifferences
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    LRA.VolumeI.Set.LRASet.SymmetricDifferenceAsUnionDifferenceIntersection
  SymmetricDifferenceCommutative :=
    LRA.VolumeI.Set.LRASet.SymmetricDifferenceCommutative
  SymmetricDifferenceAssociative :=
    LRA.VolumeI.Set.LRASet.SymmetricDifferenceAssociative
  SymmetricDifferenceEmpty :=
    LRA.VolumeI.Set.LRASet.SymmetricDifferenceEmpty
  EmptySymmetricDifference :=
    LRA.VolumeI.Set.LRASet.EmptySymmetricDifference
  SymmetricDifferenceSelf :=
    LRA.VolumeI.Set.LRASet.SymmetricDifferenceSelf
  SymmetricDifferenceEqEmptyIff :=
    LRA.VolumeI.Set.LRASet.SymmetricDifferenceEqEmptyIff
  SymmetricDifferenceSubsetUnion :=
    LRA.VolumeI.Set.LRASet.SymmetricDifferenceSubsetUnion

end LRA.VolumeI.Set.LRASet
