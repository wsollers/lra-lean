import LRA.VolumeI.Order.OrderedSets.Preorder.Characterizations
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order.OrderedSets.Preorder

universe u

/--
The preorder-compatible strict part relates `left` to `right` when `left` is
below `right`, but `right` is not below `left`.

Logical form:

```lean
fun left right => preorder.relation left right /\ Not (preorder.relation right left)
```
-/
def StrictPartByNotConverse
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  fun left right =>
    preorder.relation left right /\ Not (preorder.relation right left)

/-- Two elements of a preorder are equivalent when each is related to the other. -/
def PreorderEquivalence
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right =>
    preorder.relation left right /\ preorder.relation right left

/-- Mutual reachability in a preorder is an equivalence relation. -/
theorem PreorderEquivalenceIsEquivalence
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Equivalence (PreorderEquivalence preorder) := by
  sorry

/-- The setoid obtained by identifying mutually related preorder elements. -/
def PreorderSetoid
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Setoid Carrier := by
  refine { r := PreorderEquivalence preorder, iseqv := ?_ }
  sorry

/-- The quotient carrier that forces antisymmetry in a preorder. -/
abbrev PreorderQuotient
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Type u :=
  Quotient (PreorderSetoid preorder)

/-- The preorder relation induced on equivalence classes. -/
def PreorderQuotientRelation
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Endorelation (PreorderQuotient preorder) :=
  fun left right =>
    Quotient.liftOn₂ left right preorder.relation (by
      intro leftRepresentative rightRepresentative
        otherLeftRepresentative otherRightRepresentative
        leftEquivalent rightEquivalent
      apply propext
      sorry)

/-- Quotienting a preorder by mutual reachability produces a partial order. -/
theorem PreorderQuotientRelationIsPartialOrder
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Order.PartialOrder (PreorderQuotientRelation preorder) := by
  sorry

end LRA.Order.OrderedSets.Preorder
