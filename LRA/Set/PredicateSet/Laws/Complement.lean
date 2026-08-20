import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Complement

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

theorem DoubleComplement :
    ∀ A : LRA.Set.PredicateSet Alpha, Aᶜᶜ = A := by
  sorry


theorem ComplementEmpty :
    (∅ : LRA.Set.PredicateSet Alpha)ᶜ = (𝒰 : LRA.Set.PredicateSet Alpha) := by
  sorry


theorem ComplementUniversal :
    (𝒰 : LRA.Set.PredicateSet Alpha)ᶜ = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry


theorem UnionComplement :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∪ Aᶜ = (𝒰 : LRA.Set.PredicateSet Alpha) := by
  sorry


theorem IntersectionComplement :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∩ Aᶜ = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry


theorem DeMorganUnion :
    ∀ A B : LRA.Set.PredicateSet Alpha, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ := by
  sorry


theorem DeMorganIntersection :
    ∀ A B : LRA.Set.PredicateSet Alpha, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ := by
  sorry


theorem DifferenceAsIntersectionComplement :
    ∀ A B : LRA.Set.PredicateSet Alpha, A \ B = A ∩ Bᶜ := by
  sorry


theorem DifferenceUniversal :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A \ (𝒰 : LRA.Set.PredicateSet Alpha) = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry


theorem UniversalDifference :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (𝒰 : LRA.Set.PredicateSet Alpha) \ A = Aᶜ := by
  sorry

instance : ComplementLaws (LRA.Set.PredicateSet Alpha) where
  DoubleComplement := LRA.Set.PredicateSet.DoubleComplement
  ComplementEmpty := LRA.Set.PredicateSet.ComplementEmpty
  ComplementUniversal := LRA.Set.PredicateSet.ComplementUniversal
  UnionComplement := LRA.Set.PredicateSet.UnionComplement
  IntersectionComplement := LRA.Set.PredicateSet.IntersectionComplement
  DeMorganUnion := LRA.Set.PredicateSet.DeMorganUnion
  DeMorganIntersection := LRA.Set.PredicateSet.DeMorganIntersection
  DifferenceAsIntersectionComplement :=
    LRA.Set.PredicateSet.DifferenceAsIntersectionComplement
  DifferenceUniversal := LRA.Set.PredicateSet.DifferenceUniversal
  UniversalDifference := LRA.Set.PredicateSet.UniversalDifference

end LRA.Set.PredicateSet
