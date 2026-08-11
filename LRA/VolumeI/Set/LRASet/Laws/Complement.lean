import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Complement

namespace LRA.VolumeI.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Absolute-complement and universal-set laws for predicate sets: the
backend's certificate for `LRA.VolumeI.Set.ComplementLaws`.

This family exists *only* here (and, later, for a Mathlib-backed
backend): it needs the `HasComplement`/`HasUniversal` capabilities from
`Instances.lean`, which Enderton structurally cannot register (Russell's
paradox). This is the one place where `LRASet`, not Enderton, is the
default proof site -- there is no alternative.

Note for the prover: `DoubleComplement` and `SymmetricDifferenceEqEmptyIff`
need classical reasoning (`x ∉ A → False` to `x ∈ A` is double-negation
elimination on the underlying `Prop`); the rest unfold to intuitionistic
propositional logic plus `funext`/`propext`.
-/

theorem DoubleComplement : ∀ A : LRASet Alpha, Aᶜᶜ = A := by
  sorry

theorem ComplementEmpty :
    (∅ : LRASet Alpha)ᶜ = (𝒰 : LRASet Alpha) := by
  sorry

theorem ComplementUniversal :
    (𝒰 : LRASet Alpha)ᶜ = (∅ : LRASet Alpha) := by
  sorry

theorem UnionComplement :
    ∀ A : LRASet Alpha, A ∪ Aᶜ = (𝒰 : LRASet Alpha) := by
  sorry

theorem IntersectionComplement :
    ∀ A : LRASet Alpha, A ∩ Aᶜ = (∅ : LRASet Alpha) := by
  sorry

theorem DeMorganUnion :
    ∀ A B : LRASet Alpha, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ := by
  sorry

theorem DeMorganIntersection :
    ∀ A B : LRASet Alpha, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ := by
  sorry

theorem DifferenceAsIntersectionComplement :
    ∀ A B : LRASet Alpha, A \ B = A ∩ Bᶜ := by
  sorry

theorem DifferenceUniversal :
    ∀ A : LRASet Alpha, A \ (𝒰 : LRASet Alpha) = (∅ : LRASet Alpha) := by
  sorry

theorem UniversalDifference :
    ∀ A : LRASet Alpha, (𝒰 : LRASet Alpha) \ A = Aᶜ := by
  sorry

/-- Registration: predicate sets satisfy the complement laws -- the one
certificate only this backend can supply. Pure delegation to the theorems
above. -/
instance : ComplementLaws (LRASet Alpha) where
  DoubleComplement := LRA.VolumeI.Set.LRASet.DoubleComplement
  ComplementEmpty := LRA.VolumeI.Set.LRASet.ComplementEmpty
  ComplementUniversal := LRA.VolumeI.Set.LRASet.ComplementUniversal
  UnionComplement := LRA.VolumeI.Set.LRASet.UnionComplement
  IntersectionComplement := LRA.VolumeI.Set.LRASet.IntersectionComplement
  DeMorganUnion := LRA.VolumeI.Set.LRASet.DeMorganUnion
  DeMorganIntersection := LRA.VolumeI.Set.LRASet.DeMorganIntersection
  DifferenceAsIntersectionComplement :=
    LRA.VolumeI.Set.LRASet.DifferenceAsIntersectionComplement
  DifferenceUniversal := LRA.VolumeI.Set.LRASet.DifferenceUniversal
  UniversalDifference := LRA.VolumeI.Set.LRASet.UniversalDifference

end LRA.VolumeI.Set.LRASet
