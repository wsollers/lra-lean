import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.SymmetricDifference

namespace LRA.Set.ZFCSet

/-! Symmetric-difference law certificate for the concrete ZFCSet backend. -/

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

instance : SymmDiffLaws Set where
  SymmetricDifferenceAsUnionDifferences := SymmetricDifferenceAsUnionDifferences
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    SymmetricDifferenceAsUnionDifferenceIntersection
  SymmetricDifferenceCommutative := SymmetricDifferenceCommutative
  SymmetricDifferenceAssociative := SymmetricDifferenceAssociative
  SymmetricDifferenceEmpty := SymmetricDifferenceEmpty
  EmptySymmetricDifference := EmptySymmetricDifference
  SymmetricDifferenceSelf := SymmetricDifferenceSelf
  SymmetricDifferenceEqEmptyIff := SymmetricDifferenceEqEmptyIff
  SymmetricDifferenceSubsetUnion := SymmetricDifferenceSubsetUnion

end LRA.Set.ZFCSet

namespace LRA.Set.Enderton

abbrev SymmetricDifferenceAsUnionDifferences :=
  LRA.Set.ZFCSet.SymmetricDifferenceAsUnionDifferences
abbrev SymmetricDifferenceAsUnionDifferenceIntersection :=
  LRA.Set.ZFCSet.SymmetricDifferenceAsUnionDifferenceIntersection
abbrev SymmetricDifferenceCommutative := LRA.Set.ZFCSet.SymmetricDifferenceCommutative
abbrev SymmetricDifferenceAssociative := LRA.Set.ZFCSet.SymmetricDifferenceAssociative
abbrev SymmetricDifferenceEmpty := LRA.Set.ZFCSet.SymmetricDifferenceEmpty
abbrev EmptySymmetricDifference := LRA.Set.ZFCSet.EmptySymmetricDifference
abbrev SymmetricDifferenceSelf := LRA.Set.ZFCSet.SymmetricDifferenceSelf
abbrev SymmetricDifferenceEqEmptyIff := LRA.Set.ZFCSet.SymmetricDifferenceEqEmptyIff
abbrev SymmetricDifferenceSubsetUnion := LRA.Set.ZFCSet.SymmetricDifferenceSubsetUnion

end LRA.Set.Enderton
