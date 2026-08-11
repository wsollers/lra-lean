namespace LRA.VolumeI.Set

universe u

/-!
The intersection law family as a law-carrying typeclass. Same design as
`UnionLaws` (see `Interface/Union.lean` for the full rationale).

`SubsetIffIntersectionEqLeft` lives here rather than in `Subset.lean` for
the same reason `SubsetIffUnionEqRight` lives in `Union.lean`: a law
belongs to the family of the operation it characterizes.
-/

class IntersectionLaws (α : Type u)
    [Inter α] [EmptyCollection α] [HasSubset α] : Prop where
  IntersectionCommutative : ∀ A B : α, A ∩ B = B ∩ A
  IntersectionAssociative : ∀ A B C : α, (A ∩ B) ∩ C = A ∩ (B ∩ C)
  EmptyIntersection : ∀ A : α, (∅ : α) ∩ A = (∅ : α)
  IntersectionEmpty : ∀ A : α, A ∩ (∅ : α) = (∅ : α)
  IntersectionIdempotent : ∀ A : α, A ∩ A = A
  IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂
  SubsetIffIntersectionEqLeft : ∀ A B : α, A ⊆ B ↔ A ∩ B = A

variable {α : Type u} [Inter α] [EmptyCollection α] [HasSubset α]
variable [IntersectionLaws α]

/-- Intersection is commutative. -/
theorem IntersectionCommutative : ∀ A B : α, A ∩ B = B ∩ A :=
  IntersectionLaws.IntersectionCommutative

/-- Intersection is associative. -/
theorem IntersectionAssociative :
    ∀ A B C : α, (A ∩ B) ∩ C = A ∩ (B ∩ C) :=
  IntersectionLaws.IntersectionAssociative

/-- The empty set annihilates intersection on the left. -/
theorem EmptyIntersection : ∀ A : α, (∅ : α) ∩ A = (∅ : α) :=
  IntersectionLaws.EmptyIntersection

/-- The empty set annihilates intersection on the right. -/
theorem IntersectionEmpty : ∀ A : α, A ∩ (∅ : α) = (∅ : α) :=
  IntersectionLaws.IntersectionEmpty

/-- Intersection is idempotent. -/
theorem IntersectionIdempotent : ∀ A : α, A ∩ A = A :=
  IntersectionLaws.IntersectionIdempotent

/-- Intersection is monotone in both arguments. -/
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ :=
  IntersectionLaws.IntersectionMonotone

/-- `A ⊆ B` exactly when `A ∩ B = A`: subset, characterized by
intersection. -/
theorem SubsetIffIntersectionEqLeft : ∀ A B : α, A ⊆ B ↔ A ∩ B = A :=
  IntersectionLaws.SubsetIffIntersectionEqLeft

end LRA.VolumeI.Set
