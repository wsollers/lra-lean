import Mathlib.Data.Int.Order.Basic
import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.BoundSets.Theorems
import LRA.VolumeI.Set.MathlibPredicateSet

namespace LRA.Order

open LRA.Set

universe u v w

/--
`UpperBoundsFailToPreserveIndexedIntersectionsAsUnions`

Statement: Upper-bound formation fails to preserve indexed intersections as
indexed unions when the two represented sets are unequal.

Logical form: `UpperBounds relation (indexedIntersection family) ≠ indexedUnion (fun i => UpperBounds relation (family i))`.
-/
def UpperBoundsFailToPreserveIndexedIntersectionsAsUnions
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  UpperBounds relation (HasIndexedIntersection.indexedIntersection family) ≠
    HasIndexedUnion.indexedUnion
      (fun index => UpperBounds relation (family index))

/--
`IntegerSingletonsWitnessUpperBoundsIntersectionFailure`

Statement: The disjoint singleton integer family shows that upper bounds of
an indexed intersection can strictly exceed the union of the memberwise
upper-bound sets.

Logical form: `UpperBoundsFailToPreserveIndexedIntersectionsAsUnions (· ≤ ·) (fun b : Bool => if b then {1} else {0})`.
-/
theorem IntegerSingletonsWitnessUpperBoundsIntersectionFailure :
    UpperBoundsFailToPreserveIndexedIntersectionsAsUnions
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry

/--
`LowerBoundsFailToPreserveIndexedIntersectionsAsUnions`

Statement: Lower-bound formation fails to preserve indexed intersections as
indexed unions when the two represented sets are unequal.

Logical form: `LowerBounds relation (indexedIntersection family) ≠ indexedUnion (fun i => LowerBounds relation (family i))`.
-/
def LowerBoundsFailToPreserveIndexedIntersectionsAsUnions
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  LowerBounds relation (HasIndexedIntersection.indexedIntersection family) ≠
    HasIndexedUnion.indexedUnion
      (fun index => LowerBounds relation (family index))

/--
`IntegerSingletonsWitnessLowerBoundsIntersectionFailure`

Statement: The disjoint singleton integer family shows that lower bounds of
an indexed intersection can strictly exceed the union of the memberwise
lower-bound sets.

Logical form: `LowerBoundsFailToPreserveIndexedIntersectionsAsUnions (· ≤ ·) (fun b : Bool => if b then {1} else {0})`.
-/
theorem IntegerSingletonsWitnessLowerBoundsIntersectionFailure :
    LowerBoundsFailToPreserveIndexedIntersectionsAsUnions
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry

/--
`EmptyIndexedIntersectionCreatesVacuousBounds`

Statement: An empty indexed intersection creates the vacuity trap when it has
no members but every ambient element is both an upper and a lower bound.

Logical form: `(∀ x, x ∉ indexedIntersection family) ∧ (∀ b, UpperBound relation (indexedIntersection family) b ∧ LowerBound relation (indexedIntersection family) b)`.
-/
def EmptyIndexedIntersectionCreatesVacuousBounds
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  (forall element,
      element ∉ HasIndexedIntersection.indexedIntersection family) /\
    (forall bound,
      UpperBound relation
          (HasIndexedIntersection.indexedIntersection family) bound /\
        LowerBound relation
          (HasIndexedIntersection.indexedIntersection family) bound)

/--
`DisjointIntegerSingletonsCreateVacuousBounds`

Statement: The indexed intersection of the singleton integer sets `{0}` and
`{1}` is empty, so every integer vacuously bounds it above and below.

Logical form: `EmptyIndexedIntersectionCreatesVacuousBounds (· ≤ ·) (fun b : Bool => if b then {1} else {0})`.
-/
theorem DisjointIntegerSingletonsCreateVacuousBounds :
    EmptyIndexedIntersectionCreatesVacuousBounds
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry

end LRA.Order
