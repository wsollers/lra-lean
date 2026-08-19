-- LRA/Set/Interface/CartesianProductLaws.lean
-- The theorem surface for Cartesian products. Statements here; proofs
-- are the learner's -- same discipline as RelationLaws.lean.

import LRA.Set.Interface.CartesianProduct
import LRA.Set.Interface.RelationSets
import LRA.Set.Interface.Membership

namespace LRA.Set

universe u v

/-!
Volume I label: set-interface-cartesian-product-laws
Lean module: LRA.Set.Interface.CartesianProductLaws
Verification status: statements accepted; proofs pending (each is a
short argument from `SeparationMembership` + `PairInjective` + the
membership laws, exactly the RelationLaws.lean proof recipe)

`CartesianProductOf` IS a relation-set, so its defining property is
stated through `Relates` (`RelatesCartesianProductOf`) rather than
introducing separate vocabulary. Everything after that is the classical
Cartesian-product algebra: monotonicity, distributivity over union,
intersection, and difference in each factor independently, and the one
two-sided identity (`IntersectionOfCartesianProducts`) that needs both
factors at once.

The laws that are *not* here are exactly the ones that do not hold for
an arbitrary ambient: e.g. `A × B ∪ C × D = (A ∪ C) × (B ∪ D)` is false
in general (the left side omits the "cross" pairs `⟨a, d⟩` and
`⟨c, b⟩`), so only the ⊆-direction or the same-ambient-factor
distributivity laws below are stated.
-/

section CartesianProductLaws

variable {Left Right Pair : Type u}
variable {DomainObject RangeObject RelationObject : Type v}
variable [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
variable [Membership Left DomainObject] [Membership Right RangeObject]
variable [Membership Pair RelationObject]
variable [SeparationLaws Pair RelationObject]
variable [PairingLaws Left Right Pair]

/-- **[Theorem — RelatesCartesianProductOf]**

The defining property: the Cartesian product relates `a` to `b` exactly
when both lie in their factor and the pair is available in the ambient.

Logical form:

```lean
theorem RelatesCartesianProductOf
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (a : Left) (b : Right) :
    Relates (CartesianProductOf left right ambientPairs) a b ↔
      (OrderedPair a b : Pair) ∈ ambientPairs ∧ a ∈ left ∧ b ∈ right
```
-/
theorem RelatesCartesianProductOf
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (a : Left) (b : Right) :
    Relates (CartesianProductOf left right ambientPairs) a b ↔
      (OrderedPair a b : Pair) ∈ ambientPairs ∧ a ∈ left ∧ b ∈ right := by
  sorry

/-- **[Theorem — CartesianProductOfIsPairwise]**

A Cartesian product is pairwise by construction -- it genuinely is a
relation-set, not merely a set that happens to contain some pairs.

Logical form:

```lean
theorem CartesianProductOfIsPairwise
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    IsPairwise Left Right (CartesianProductOf left right ambientPairs)
```
-/
theorem CartesianProductOfIsPairwise
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    IsPairwise Left Right (CartesianProductOf left right ambientPairs) := by
  sorry

variable [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
variable [EmptyCollection DomainObject] [HasSubset DomainObject]
variable [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
variable [EmptyCollection RangeObject] [HasSubset RangeObject]
variable [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
variable [EmptyCollection RelationObject] [HasSubset RelationObject]
variable [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
variable [MembershipLaws Pair RelationObject]

/-- A Cartesian product is a subset of the ambient it was separated
from.

Logical form:

```lean
theorem CartesianProductOfSubsetAmbient
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left right ambientPairs ⊆ ambientPairs
```
-/
theorem CartesianProductOfSubsetAmbient
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left right ambientPairs ⊆ ambientPairs := by
  sorry

/-- Cartesian product is monotone in its left factor.

Logical form:

```lean
theorem CartesianProductOfMonotoneLeft
    (smaller larger : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf smaller right ambientPairs ⊆
      CartesianProductOf larger right ambientPairs
```
-/
theorem CartesianProductOfMonotoneLeft
    (smaller larger : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf smaller right ambientPairs ⊆
      CartesianProductOf larger right ambientPairs := by
  sorry

/-- Cartesian product is monotone in its right factor.

Logical form:

```lean
theorem CartesianProductOfMonotoneRight
    (left : DomainObject) (smaller larger : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf left smaller ambientPairs ⊆
      CartesianProductOf left larger ambientPairs
```
-/
theorem CartesianProductOfMonotoneRight
    (left : DomainObject) (smaller larger : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf left smaller ambientPairs ⊆
      CartesianProductOf left larger ambientPairs := by
  sorry

/-- The product with an empty left factor is empty.

Logical form:

```lean
theorem CartesianProductOfEmptyLeft
    (right : RangeObject) (ambientPairs : RelationObject) :
    CartesianProductOf (∅ : DomainObject) right ambientPairs =
      (∅ : RelationObject)
```
-/
theorem CartesianProductOfEmptyLeft
    (right : RangeObject) (ambientPairs : RelationObject) :
    CartesianProductOf (∅ : DomainObject) right ambientPairs =
      (∅ : RelationObject) := by
  sorry

/-- The product with an empty right factor is empty.

Logical form:

```lean
theorem CartesianProductOfEmptyRight
    (left : DomainObject) (ambientPairs : RelationObject) :
    CartesianProductOf left (∅ : RangeObject) ambientPairs =
      (∅ : RelationObject)
```
-/
theorem CartesianProductOfEmptyRight
    (left : DomainObject) (ambientPairs : RelationObject) :
    CartesianProductOf left (∅ : RangeObject) ambientPairs =
      (∅ : RelationObject) := by
  sorry

/-- The product distributes over union in the left factor:
`(A ∪ A') × B = (A × B) ∪ (A' × B)`.

Logical form:

```lean
theorem CartesianProductOfUnionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∪ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left' right ambientPairs
```
-/
theorem CartesianProductOfUnionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∪ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left' right ambientPairs := by
  sorry

/-- The product distributes over union in the right factor:
`A × (B ∪ B') = (A × B) ∪ (A × B')`.

Logical form:

```lean
theorem CartesianProductOfUnionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∪ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left right' ambientPairs
```
-/
theorem CartesianProductOfUnionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∪ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left right' ambientPairs := by
  sorry

/-- The product distributes over intersection in the left factor:
`(A ∩ A') × B = (A × B) ∩ (A' × B)`.

Logical form:

```lean
theorem CartesianProductOfIntersectionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∩ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left' right ambientPairs
```
-/
theorem CartesianProductOfIntersectionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∩ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left' right ambientPairs := by
  sorry

/-- The product distributes over intersection in the right factor:
`A × (B ∩ B') = (A × B) ∩ (A × B')`.

Logical form:

```lean
theorem CartesianProductOfIntersectionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∩ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left right' ambientPairs
```
-/
theorem CartesianProductOfIntersectionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∩ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left right' ambientPairs := by
  sorry

/-- The two-sided identity: the intersection of two products is the
product of the intersections. Needs both factors at once, unlike the
one-sided distributivity laws above.

Logical form:

```lean
theorem IntersectionOfCartesianProducts
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf leftFirst rightFirst ambientPairs ∩
        CartesianProductOf leftSecond rightSecond ambientPairs =
      CartesianProductOf
        (leftFirst ∩ leftSecond) (rightFirst ∩ rightSecond) ambientPairs
```
-/
theorem IntersectionOfCartesianProducts
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf leftFirst rightFirst ambientPairs ∩
        CartesianProductOf leftSecond rightSecond ambientPairs =
      CartesianProductOf
        (leftFirst ∩ leftSecond) (rightFirst ∩ rightSecond) ambientPairs := by
  sorry

/-- The product distributes over difference in the left factor:
`(A \ A') × B = (A × B) \ (A' × B)`.

Logical form:

```lean
theorem CartesianProductOfDifferenceLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left \ left') right ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left' right ambientPairs
```
-/
theorem CartesianProductOfDifferenceLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left \ left') right ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left' right ambientPairs := by
  sorry

/-- The product distributes over difference in the right factor:
`A × (B \ B') = (A × B) \ (A × B')`.

Logical form:

```lean
theorem CartesianProductOfDifferenceRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right \ right') ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left right' ambientPairs
```
-/
theorem CartesianProductOfDifferenceRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right \ right') ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left right' ambientPairs := by
  sorry

/-- Relations relating the same pairs of factors have the same product:
equal left factors and equal right factors give an equal product. -/
theorem CartesianProductOfCongr
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject)
    (sameLeft : ∀ a : Left, a ∈ leftFirst ↔ a ∈ leftSecond)
    (sameRight : ∀ b : Right, b ∈ rightFirst ↔ b ∈ rightSecond) :
    CartesianProductOf leftFirst rightFirst ambientPairs =
      CartesianProductOf leftSecond rightSecond ambientPairs := by
  sorry

end CartesianProductLaws

end LRA.Set
