import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.SymmetricDifference

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

theorem SymmetricDifferenceCommutative :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = B ∆ A := by
  sorry

theorem SymmetricDifferenceAssociative :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

theorem SymmetricDifferenceEmpty :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∆ (∅ : LRA.Set.PredicateSet Alpha) = A := by
  sorry

theorem EmptySymmetricDifference :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∆ A = A := by
  sorry

theorem SymmetricDifferenceSelf :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∆ A = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : LRA.Set.PredicateSet Alpha,
      A ∆ B = (∅ : LRA.Set.PredicateSet Alpha) ↔ A = B := by
  sorry

theorem SymmetricDifferenceSubsetUnion :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B ⊆ A ∪ B := by
  sorry

instance : SymmDiffLaws (LRA.Set.PredicateSet Alpha) where
  SymmetricDifferenceAsUnionDifferences :=
    LRA.Set.PredicateSet.SymmetricDifferenceAsUnionDifferences
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    LRA.Set.PredicateSet.SymmetricDifferenceAsUnionDifferenceIntersection
  SymmetricDifferenceCommutative :=
    LRA.Set.PredicateSet.SymmetricDifferenceCommutative
  SymmetricDifferenceAssociative :=
    LRA.Set.PredicateSet.SymmetricDifferenceAssociative
  SymmetricDifferenceEmpty :=
    LRA.Set.PredicateSet.SymmetricDifferenceEmpty
  EmptySymmetricDifference :=
    LRA.Set.PredicateSet.EmptySymmetricDifference
  SymmetricDifferenceSelf :=
    LRA.Set.PredicateSet.SymmetricDifferenceSelf
  SymmetricDifferenceEqEmptyIff :=
    LRA.Set.PredicateSet.SymmetricDifferenceEqEmptyIff
  SymmetricDifferenceSubsetUnion :=
    LRA.Set.PredicateSet.SymmetricDifferenceSubsetUnion

end LRA.Set.PredicateSet

namespace LRA.Set.LRASet
export LRA.Set.PredicateSet
  (SymmetricDifferenceAsUnionDifferences
   SymmetricDifferenceAsUnionDifferenceIntersection
   SymmetricDifferenceCommutative SymmetricDifferenceAssociative
   SymmetricDifferenceEmpty EmptySymmetricDifference SymmetricDifferenceSelf
   SymmetricDifferenceEqEmptyIff SymmetricDifferenceSubsetUnion)
end LRA.Set.LRASet
