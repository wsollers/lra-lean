import LRA.VolumeI.Set.Enderton.Instances
import LRA.VolumeI.Set.Interface.SymmetricDifference

namespace LRA.VolumeI.Set.Enderton

/-!
Symmetric-difference laws for Enderton sets: the backend's certificate for
`LRA.VolumeI.Set.SymmDiffLaws`.

`A ∆ B` resolves through the `HasSymmDiff Set` instance in
`Instances.lean`, backed by `TheSymmetricDifference` -- the union of the
two relative complements, derived in `Theorems/SymmetricDifference.lean`
with no new axiom and no universal set.

Note for the prover: `SymmetricDifferenceAsUnionDifferences` is
definitional -- `TheSymmetricDifference` is literally
`TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)` -- so
its proof should be immediate once attempted.
-/

theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : Set, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

theorem SymmetricDifferenceCommutative :
    ∀ A B : Set, A ∆ B = B ∆ A := by
  sorry

theorem SymmetricDifferenceAssociative :
    ∀ A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

theorem SymmetricDifferenceEmpty : ∀ A : Set, A ∆ (∅ : Set) = A := by
  sorry

theorem EmptySymmetricDifference : ∀ A : Set, (∅ : Set) ∆ A = A := by
  sorry

theorem SymmetricDifferenceSelf : ∀ A : Set, A ∆ A = (∅ : Set) := by
  sorry

theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : Set, A ∆ B = (∅ : Set) ↔ A = B := by
  sorry

theorem SymmetricDifferenceSubsetUnion :
    ∀ A B : Set, A ∆ B ⊆ A ∪ B := by
  sorry

/-- Registration: Enderton sets satisfy the symmetric-difference laws. Pure
delegation to the theorems above. -/
instance : SymmDiffLaws Set where
  SymmetricDifferenceAsUnionDifferences :=
    LRA.VolumeI.Set.Enderton.SymmetricDifferenceAsUnionDifferences
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    LRA.VolumeI.Set.Enderton.SymmetricDifferenceAsUnionDifferenceIntersection
  SymmetricDifferenceCommutative :=
    LRA.VolumeI.Set.Enderton.SymmetricDifferenceCommutative
  SymmetricDifferenceAssociative :=
    LRA.VolumeI.Set.Enderton.SymmetricDifferenceAssociative
  SymmetricDifferenceEmpty :=
    LRA.VolumeI.Set.Enderton.SymmetricDifferenceEmpty
  EmptySymmetricDifference :=
    LRA.VolumeI.Set.Enderton.EmptySymmetricDifference
  SymmetricDifferenceSelf :=
    LRA.VolumeI.Set.Enderton.SymmetricDifferenceSelf
  SymmetricDifferenceEqEmptyIff :=
    LRA.VolumeI.Set.Enderton.SymmetricDifferenceEqEmptyIff
  SymmetricDifferenceSubsetUnion :=
    LRA.VolumeI.Set.Enderton.SymmetricDifferenceSubsetUnion

end LRA.VolumeI.Set.Enderton
