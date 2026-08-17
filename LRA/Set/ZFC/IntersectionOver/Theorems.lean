import LRA.Set.ZFC.Union.Theorems
import LRA.Set.ZFC.Separation.Theorems

/-!
Intersection over a collection of sets (`⋂₀ A`), derived from Separation
and the union over the collection.
-/

namespace LRA.Set.ZFC

/-- The intersection over the collection `A`, derived as the separated
subset of the union over `A`. -/
noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A)
    (fun x => ∀ B : Set, B ∈ A → x ∈ B)

/-- For a nonempty collection, membership in the intersection over it is
membership in every member. -/
theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : ∃ B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A ↔ ∀ B : Set, B ∈ A → x ∈ B := by
  sorry

end LRA.Set.ZFC

/-! Compatibility aliases for the historical Enderton intersection-over names. -/
namespace LRA.Set.Enderton

noncomputable abbrev TheIntersectionOver (A : Set) : Set :=
  LRA.Set.ZFC.TheIntersectionOver A

abbrev TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : ∃ B : Set, B ∈ A) :=
  LRA.Set.ZFC.TheIntersectionOverMembership A x collectionNonempty

end LRA.Set.Enderton
