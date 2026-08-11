namespace LRA.VolumeI.Set

universe u

/-!
Distributivity and absorption laws as a law-carrying typeclass. Same
design as `UnionLaws` (see `Interface/Union.lean`). Note the constraint
list: these laws mention only `∪` and `∩`, so only `Union` and `Inter`
are required -- the certificate demands exactly the machines its laws
talk about, nothing more.
-/

class DistributivityLaws (α : Type u) [Union α] [Inter α] : Prop where
  IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
  UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
  AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
  AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A

variable {α : Type u} [Union α] [Inter α] [DistributivityLaws α]

/-- Intersection distributes over union. -/
theorem IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) :=
  DistributivityLaws.IntersectionDistributesOverUnion

/-- Union distributes over intersection. -/
theorem UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) :=
  DistributivityLaws.UnionDistributesOverIntersection

/-- Absorption: `A ∪ (A ∩ B) = A`. -/
theorem AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A :=
  DistributivityLaws.AbsorptionUnionIntersection

/-- Absorption: `A ∩ (A ∪ B) = A`. -/
theorem AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A :=
  DistributivityLaws.AbsorptionIntersectionUnion

end LRA.VolumeI.Set
