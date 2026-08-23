import LRA.Set.TGSet.Instances
import LRA.Set.Interface.SymmetricDifference

namespace LRA.Set.TGSet

                                                                           

theorem SymmetricDifferenceAsUnionDifferences :
    forall A B : Set, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry


theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    forall A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry


theorem SymmetricDifferenceCommutative :
    forall A B : Set, A ∆ B = B ∆ A := by
  sorry


theorem SymmetricDifferenceAssociative :
    forall A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry


theorem SymmetricDifferenceEmpty : forall A : Set, A ∆ (∅ : Set) = A := by
  sorry


theorem EmptySymmetricDifference : forall A : Set, (∅ : Set) ∆ A = A := by
  sorry


theorem SymmetricDifferenceSelf : forall A : Set, A ∆ A = (∅ : Set) := by
  sorry


theorem SymmetricDifferenceEqEmptyIff :
    forall A B : Set, A ∆ B = (∅ : Set) <-> A = B := by
  sorry


theorem SymmetricDifferenceSubsetUnion :
    forall A B : Set, A ∆ B ⊆ A ∪ B := by
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

end LRA.Set.TGSet
