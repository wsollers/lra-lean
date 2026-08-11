namespace LRA.VolumeI.Set

universe u

/-!
The subset law family as a law-carrying typeclass. Same design as
`UnionLaws` (see `Interface/Union.lean`).

Only the laws stated purely in `⊆` (and `=`) live here, so the
certificate requires only `HasSubset`. The two mixed characterizations --
subset via union (`A ⊆ B ↔ A ∪ B = B`) and subset via intersection
(`A ⊆ B ↔ A ∩ B = A`) -- live with the operation they mention, in
`UnionLaws` and `IntersectionLaws` respectively.
-/

class SubsetLaws (α : Type u) [HasSubset α] : Prop where
  SubsetReflexive : ∀ A : α, A ⊆ A
  SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C
  SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A

variable {α : Type u} [HasSubset α] [SubsetLaws α]

/-- Subset is reflexive. -/
theorem SubsetReflexive : ∀ A : α, A ⊆ A :=
  SubsetLaws.SubsetReflexive

/-- Subset is transitive. -/
theorem SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C :=
  SubsetLaws.SubsetTransitive

/-- Two sets are equal exactly when each is a subset of the other. -/
theorem SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A :=
  SubsetLaws.SetEqualityIffMutualSubset

end LRA.VolumeI.Set
