import LRA.VolumeI.Set.Enderton.Theorems.Union
import LRA.VolumeI.Set.Enderton.Theorems.Separation

/-!
Intersection over a collection of sets (`⋂₀ A`), derived from Separation
and the union over the collection.

Same move as `RelativeComplement.lean`: no fresh axiom. The witness is
`{x ∈ ⋃₀ A | ∀ B ∈ A, x ∈ B}`. For a *nonempty* collection this has the
textbook members; for `A = ∅` it is the empty set -- the characterization
`x ∈ ⋂₀ A ↔ ∀ B ∈ A, x ∈ B` is therefore stated under a nonemptiness
hypothesis, since its unconditional form at `A = ∅` would describe the
universal set (impossible, Russell).
-/

namespace LRA.Set.Enderton

/-- The intersection over the collection `A`, derived as the separated
subset of the union over `A`.

Logical form:

```lean
noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A)
    (fun x => ∀ B : Set, B ∈ A → x ∈ B)
```
-/
noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A)
    (fun x => ∀ B : Set, B ∈ A → x ∈ B)

/-- For a nonempty collection, membership in the intersection over it is
membership in every member.

Logical form:

```lean
theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : ∃ B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A ↔ ∀ B : Set, B ∈ A → x ∈ B
```
-/
theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : ∃ B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A ↔ ∀ B : Set, B ∈ A → x ∈ B := by
  sorry

end LRA.Set.Enderton
