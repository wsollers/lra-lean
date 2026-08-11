import LRA.VolumeI.Set.Enderton.Theorems.Union
import LRA.VolumeI.Set.Enderton.Theorems.RelativeComplement

/-!
The symmetric difference of two sets, derived from relative complement and
binary union.

Same move as `RelativeComplement.lean` and `Intersection.lean`: no fresh
axiom, no fresh existence/uniqueness proof. The witness is
`(A \ B) ∪ (B \ A)` -- both relative complements exist by Separation, and
their union exists by Union + Pairing, so the operation is a direct
composition of already-chosen witnesses.

No universal set is involved anywhere: unlike an absolute complement
(impossible for Enderton sets, by Russell's paradox), the symmetric
difference only ever removes members relative to the two given sets.
-/

namespace LRA.VolumeI.Set.Enderton

/-- The symmetric difference of `A` and `B`, derived as the union of the two
relative complements.

Logical form:

```lean
noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)
```
-/
noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)
/--
The chosen symmetric difference has the expected members.

Logical form:

```lean
theorem TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :
    IsSymmetricDifferenceOf A B (TheSymmetricDifference A B)
```
-/
theorem TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :
    IsSymmetricDifferenceOf A B (TheSymmetricDifference A B) := by
  sorry

/-- `x` belongs to the symmetric difference of `A` and `B` iff it belongs to
exactly one of them.

Derived from `TheUnionMembership` and `TheRelativeComplementMembership`, not
from a separate axiom.

Logical form:

```lean
theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```
-/
theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry
/--
Every symmetric difference of `A` and `B` equals the chosen one.

Logical form:

```lean
theorem EverySymmetricDifferenceEqualsTheSymmetricDifference
    {A B D : Set}
    (DIsSymmetricDifferenceOf : IsSymmetricDifferenceOf A B D) :
    D = TheSymmetricDifference A B
```
-/
theorem EverySymmetricDifferenceEqualsTheSymmetricDifference
    {A B D : Set}
    (DIsSymmetricDifferenceOf : IsSymmetricDifferenceOf A B D) :
    D = TheSymmetricDifference A B := by
  sorry

end LRA.VolumeI.Set.Enderton
