import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Separation

/-!
The relative complement of `B` in `A` (`A \ B`), derived from Separation.

No fresh axiom, no fresh existence/uniqueness proof is needed here: `A \ B`
is exactly `TheSeparatedSubset A (fun x => x ∉ B)`, so its existence and
uniqueness are already covered by `Separation.lean`. This mirrors how binary
union in `Union.lean` needed no existence/uniqueness proof of its own once
`TheUnionOver` and `PairSet` were in hand -- both are cases where a new
textbook operation is a direct instance of an already-proven construction,
not a new primitive.
-/

namespace LRA.VolumeI.Set.Enderton

/-- The relative complement of `B` in `A`, derived as the subset of `A`
separated by non-membership in `B`.

Logical form:

```lean
noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)
```
-/
noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)
/--
The chosen relative complement has the expected members.

Logical form:

```lean
theorem TheRelativeComplementIsRelativeComplementOf (A B : Set) :
    IsRelativeComplementOf A B (TheRelativeComplement A B)
```
-/
theorem TheRelativeComplementIsRelativeComplementOf (A B : Set) :
    IsRelativeComplementOf A B (TheRelativeComplement A B) := by
  sorry

/-- `x` belongs to `A \ B` iff `x` belongs to `A` and `x` does not belong to
`B`.

Derived from `TheSeparatedSubsetIsSeparatedSubset`, not from a separate
axiom.

Logical form:

```lean
theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B ↔ x ∈ A ∧ x ∉ B
```
-/
theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

/-- Every relative complement of `B` in `A` equals the chosen one.

Follows directly from `EverySeparatedSubsetEqualsTheSeparatedSubset`, since
`IsRelativeComplementOf A B D` and `IsSeparatedSubset A (fun x => x ∉ B) D`
are the same proposition.

Logical form:

```lean
theorem EveryRelativeComplementEqualsTheRelativeComplement
    {A B D : Set}
    (DIsRelativeComplementOf : IsRelativeComplementOf A B D) :
    D = TheRelativeComplement A B
```
-/
theorem EveryRelativeComplementEqualsTheRelativeComplement
    {A B D : Set}
    (DIsRelativeComplementOf : IsRelativeComplementOf A B D) :
    D = TheRelativeComplement A B := by
  sorry

end LRA.VolumeI.Set.Enderton
