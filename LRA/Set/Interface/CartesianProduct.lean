-- LRA/Set/Interface/CartesianProduct.lean
-- The Cartesian product of two sets, as a set of pairs: the missing
-- primitive between Pairing (a single pair) and RelationSets (an
-- arbitrary set of pairs) -- CartesianProductOf is the *largest*
-- relation-set between two given sets, relative to an ambient.

import LRA.Set.Interface.Pairing
import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v

/-!
Volume I label: set-interface-cartesian-product
Lean module: LRA.Set.Interface.CartesianProduct
Verification status: checked definitions

`A × B := {⟨a, b⟩ | a ∈ A ∧ b ∈ B}` is not itself a ZF axiom -- Enderton
derives it from Separation applied to an ambient set of pairs, the same
"carved from an ambient by Replacement/Separation" discipline every other
ambient-relative construction in `RelationSets.lean` follows
(`DomainOf`, `ImageOf`, ...). There is no free-floating "set of all
pairs" to separate from, so `CartesianProductOf` takes one explicitly,
exactly like its siblings.

This sits one level below `RelationSets.lean` conceptually, not above
it: a Cartesian product IS a relation-set (in fact the largest one
between its two factors, relative to the ambient), so its membership
theorem is stated through `Relates` in `CartesianProductLaws.lean`
rather than introducing new vocabulary.
-/

section CartesianProduct

variable {Left Right Pair : Type u}
variable {DomainObject RangeObject RelationObject : Type v}

/-- **[Definition — CartesianProductOf]**

The Cartesian product of `left` and `right`, carved out of an ambient
set of pairs: the pairs `⟨a, b⟩` with `a ∈ left` and `b ∈ right`.

Logical form:

```lean
def CartesianProductOf [HasPairing Left Right Pair]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Pair RelationObject]
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ (a : Left) (b : Right),
      member = OrderedPair a b ∧ a ∈ left ∧ b ∈ right)
```
-/
def CartesianProductOf [HasPairing Left Right Pair]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Pair RelationObject]
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ (a : Left) (b : Right),
      member = OrderedPair a b ∧ a ∈ left ∧ b ∈ right)

end CartesianProduct

end LRA.Set
