import LRA.Order
import LRA.Order.Examples
import LRA.Relation.Properties.Definition
import LRA.Set.Interop.Mathlib.PredicateSet
import Mathlib.Data.Int.Order.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Logic.Function.Defs
import Mathlib.Order.Interval.Set.Defs

/-!
Counterexamples and negative results for the Order subject.

Each `Fails*` predicate names a hypothesis by showing what goes wrong without
it. In a foundations text these are not decoration: they are the evidence that
an assumption in a theorem above is doing work.

This is a quarantined leaf (§2.3, §6): no core `Definition`, `Theorems`,
`Characterizations`, `Consequences`, `Relationships`, or router may import
it. It is compiled from the test library instead.

Each section keeps the namespace it was stated in, so a predicate about
partial orders still lives under `LRA.Order.OrderedSets.PartialOrder`.
-/

universe u v w x

/-! ### Bounds/BoundSets -/

namespace LRA.Order

open LRA.Set

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

/-! ### Bounds/Bounded -/

namespace LRA.Order

open LRA.Set

/--
`FailsBounded`

Statement: A represented subset fails boundedness when it lacks an upper or lower bound.

Logical form: `Not (Bounded relation subset)`.
-/
def FailsBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Bounded relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBounded`

Statement: The integers are not bounded in their usual order.

Logical form: `FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int)`.
-/
theorem IntegerUniverseFailsBounded :
    FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

/--
`ComplementDestroysTwoSidedBoundedness`

Statement: Complement destroys two-sided boundedness when the original set is
bounded but its complement is neither bounded above nor bounded below.

Logical form: `Bounded relation subset ∧ ¬ BoundedAbove relation subsetᶜ ∧ ¬ BoundedBelow relation subsetᶜ`.
-/
def ComplementDestroysTwoSidedBoundedness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasComplement SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Bounded relation subset /\
    Not (BoundedAbove relation subsetᶜ) /\
    Not (BoundedBelow relation subsetᶜ)

/--
`EveryBoundedRealSetHasUnboundedComplement`

Statement: The complement of every bounded predicate subset of the real line
is unbounded both above and below.

Logical form: `Bounded (· ≤ ·) subset → ComplementDestroysTwoSidedBoundedness (· ≤ ·) subset`.
-/
theorem EveryBoundedRealSetHasUnboundedComplement
    (subset : Set Real)
    (subsetIsBounded :
      Bounded (fun left right : Real => left ≤ right) subset) :
    ComplementDestroysTwoSidedBoundedness
      (fun left right : Real => left ≤ right) subset := by
  sorry

end LRA.Order

/-! ### Bounds/BoundedAbove -/

namespace LRA.Order

/--
`FailsBoundedAbove`

Statement: A represented subset fails boundedness above when it has no upper bound.

Logical form: `Not (BoundedAbove relation subset)`.
-/
def FailsBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedAbove relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBoundedAbove`

Statement: The integers are not bounded above in their usual order.

Logical form: `FailsBoundedAbove (fun left right : Int => left ≤ right) (Set.univ : Set Int)`.
-/
theorem IntegerUniverseFailsBoundedAbove :
    FailsBoundedAbove (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

end LRA.Order

/-! ### Bounds/BoundedBelow -/

namespace LRA.Order

/--
`FailsBoundedBelow`

Statement: A represented subset fails boundedness below when it has no lower bound.

Logical form: `Not (BoundedBelow relation subset)`.
-/
def FailsBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedBelow relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBoundedBelow`

Statement: The integers are not bounded below in their usual order.

Logical form: `FailsBoundedBelow (fun left right : Int => left ≤ right) (Set.univ : Set Int)`.
-/
theorem IntegerUniverseFailsBoundedBelow :
    FailsBoundedBelow (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

end LRA.Order

/-! ### Bounds/GreatestElement -/

namespace LRA.Order

/--
`FailsGreatestElement`

Statement: A candidate fails when it is not a greatest element of the subset.

Logical form: `Not (GreatestElement relation subset candidate)`.
-/
def FailsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (GreatestElement relation subset candidate)

section RealOpenUnitInterval

/--
`OneFailsGreatestElementOfOpenUnitInterval`

Statement: The endpoint one is not a greatest element because it is omitted.

Logical form: `FailsGreatestElement (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1`.
-/
theorem OneFailsGreatestElementOfOpenUnitInterval :
    FailsGreatestElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry

end RealOpenUnitInterval

end LRA.Order

/-! ### Bounds/GreatestLowerBoundProperty -/

namespace LRA.Order

/--
`FailsGreatestLowerBoundProperty`

Statement: A backend order fails when some nonempty bounded-below subset has no infimum.

Logical form: `Not (GreatestLowerBoundProperty SetObject relation)`.
-/
def FailsGreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (GreatestLowerBoundProperty SetObject relation)

section RationalOrder

/--
`RationalOrderFailsGreatestLowerBoundProperty`

Statement: The rationals fail the greatest-lower-bound property.

Logical form: `FailsGreatestLowerBoundProperty (Set Rat) (fun left right : Rat => left ≤ right)`.
-/
theorem RationalOrderFailsGreatestLowerBoundProperty :
    FailsGreatestLowerBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right) := by
  sorry

end RationalOrder

end LRA.Order

/-! ### Bounds/Infimum -/

namespace LRA.Order

/--
`FailsInfimum`

Statement: A represented subset fails to have an infimum when no element satisfies the predicate.

Logical form: `Not (Exists fun candidate => Infimum relation subset candidate)`.
-/
def FailsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Exists fun candidate => Infimum relation subset candidate)

section IntegerEmptySet

/--
`EmptyIntegerSetFailsInfimum`

Statement: The empty set has no infimum in the integers, which have no top element.

Logical form: `FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int)`.
-/
theorem EmptyIntegerSetFailsInfimum :
    FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int) := by
  sorry

end IntegerEmptySet

/--
`ComplementInfimumFormulaFails` records the discrete failure in which a set
has an infimum but its complement has none.

Logical form: `(∃ i, Infimum relation subset i) ∧ ¬ ∃ j, Infimum relation (complement subset) j`.
-/
def ComplementInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists infimum, Infimum relation subset infimum) /\
    Not (exists infimum, Infimum relation (complement subset) infimum)

/--
`IntegerSingletonComplementHasNoInfimum` proves that complementation has no
general infimum formula: `{0}` has infimum `0`, while its integer complement
is unbounded below and has no integer infimum.

Logical form: `ComplementInfimumFormulaFails (· ≤ ·) Set.compl ({0} : Set ℤ)`.
-/
theorem IntegerSingletonComplementHasNoInfimum :
    ComplementInfimumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int) := by
  sorry

/--
`DifferenceInfimumFormulaFails` records the discrete failure in which both
operands have infima but their relative difference has none.

Logical form: `(∃ i, Infimum relation left i) ∧ (∃ j, Infimum relation removed j) ∧ ¬ ∃ d, Infimum relation (left \ removed) d`.
-/
def DifferenceInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists infimum, Infimum relation left infimum) /\
    (exists infimum, Infimum relation removed infimum) /\
      Not (exists infimum, Infimum relation (left \ removed) infimum)

/--
`IntegerSingletonDifferenceHasNoInfimum` proves that the two operand infima do
not determine an infimum of their difference: `{0} \ {0}` is empty.

Logical form: `DifferenceInfimumFormulaFails (· ≤ ·) ({0} : Set ℤ) ({0} : Set ℤ)`.
-/
theorem IntegerSingletonDifferenceHasNoInfimum :
    DifferenceInfimumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int) := by
  sorry

end LRA.Order

/-! ### Bounds/LeastElement -/

namespace LRA.Order

/--
`FailsLeastElement`

Statement: A candidate fails when it is not a least element of the subset.

Logical form: `Not (LeastElement relation subset candidate)`.
-/
def FailsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LeastElement relation subset candidate)

section RealOpenUnitInterval

/--
`ZeroFailsLeastElementOfOpenUnitInterval`

Statement: The endpoint zero is not a least element because it is omitted.

Logical form: `FailsLeastElement (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0`.
-/
theorem ZeroFailsLeastElementOfOpenUnitInterval :
    FailsLeastElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry

end RealOpenUnitInterval

end LRA.Order

/-! ### Bounds/LeastUpperBoundProperty -/

namespace LRA.Order

/--
`FailsLeastUpperBoundProperty`

Statement: A backend order fails when some nonempty bounded-above subset has no supremum.

Logical form: `Not (LeastUpperBoundProperty SetObject relation)`.
-/
def FailsLeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (LeastUpperBoundProperty SetObject relation)

section RationalOrder

/--
`RationalOrderFailsLeastUpperBoundProperty`

Statement: The rationals fail the least-upper-bound property.

Logical form: `FailsLeastUpperBoundProperty (Set Rat) (fun left right : Rat => left ≤ right)`.
-/
theorem RationalOrderFailsLeastUpperBoundProperty :
    FailsLeastUpperBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right) := by
  sorry

end RationalOrder

end LRA.Order

/-! ### Bounds/LowerBound -/

namespace LRA.Order

/--
`FailsLowerBound`

Statement: A proposed element fails when it is not a lower bound of the subset.

Logical form: `Not (LowerBound relation subset candidate)`.
-/
def FailsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LowerBound relation subset candidate)

section RealOpenUnitInterval

/--
`OneFailsLowerBoundOfOpenUnitInterval`

Statement: One fails as a lower bound of the open unit interval.

Logical form: `FailsLowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1`.
-/
theorem OneFailsLowerBoundOfOpenUnitInterval :
    FailsLowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry

end RealOpenUnitInterval

end LRA.Order

/-! ### Bounds/MaximalElement -/

namespace LRA.Order

/--
`MaximalityFailsToImplyGreatest`

Statement: A candidate is maximal for the strict relation but is not greatest
for the corresponding non-strict relation.

Logical form: `MaximalElement strictRelation subset candidate ∧ Not (GreatestElement nonStrictRelation subset candidate)`.
-/
def MaximalityFailsToImplyGreatest
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MaximalElement strictRelation subset candidate /\
    Not (GreatestElement nonStrictRelation subset candidate)

/--
`BooleanAntichainHasDistinctMaximalElementsButNoGreatest`

Statement: In the two-element antichain, both distinct elements are maximal
but neither is greatest.

Logical form: both Boolean values satisfy `MaximalityFailsToImplyGreatest`,
and `false ≠ true`.
-/
theorem BooleanAntichainHasDistinctMaximalElementsButNoGreatest :
    MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true := by
  sorry

end LRA.Order

/-! ### Bounds/MinimalElement -/

namespace LRA.Order

/--
`MinimalityFailsToImplyLeast`

Statement: A candidate is minimal for the strict relation but is not least for
the corresponding non-strict relation.

Logical form: `MinimalElement strictRelation subset candidate ∧ Not (LeastElement nonStrictRelation subset candidate)`.
-/
def MinimalityFailsToImplyLeast
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MinimalElement strictRelation subset candidate /\
    Not (LeastElement nonStrictRelation subset candidate)

/--
`BooleanAntichainHasDistinctMinimalElementsButNoLeast`

Statement: In the two-element antichain, both distinct elements are minimal
but neither is least.

Logical form: both Boolean values satisfy `MinimalityFailsToImplyLeast`, and
`false ≠ true`.
-/
theorem BooleanAntichainHasDistinctMinimalElementsButNoLeast :
    MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true := by
  sorry

end LRA.Order

/-! ### Bounds/Supremum -/

namespace LRA.Order

/--
`FailsSupremumUniqueness`

Statement: Supremum uniqueness fails when a subset has two distinct suprema.

Logical form: `Exists fun first => Exists fun second => first ≠ second ∧ Supremum relation subset first ∧ Supremum relation subset second`.
-/
def FailsSupremumUniqueness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists first second,
    first ≠ second /\
      Supremum relation subset first /\
        Supremum relation subset second

/--
`SupremaNeedNotBeUniqueInPreorder`

Statement: Antisymmetry is necessary for uniqueness; in the universal Boolean
preorder both distinct elements are suprema of the full subset.

Logical form: `Preorder (fun _ _ : Bool => True) ∧ FailsSupremumUniqueness (fun _ _ : Bool => True) (Set.univ : Set Bool)`.
-/
theorem SupremaNeedNotBeUniqueInPreorder :
    Preorder (fun _ _ : Bool => True) /\
      FailsSupremumUniqueness
        (fun _ _ : Bool => True) (Set.univ : Set Bool) := by
  sorry

/--
`ComplementSupremumFormulaFails` records the discrete failure in which a set
has a supremum but its complement has none.

Logical form: `(∃ s, Supremum relation subset s) ∧ ¬ ∃ t, Supremum relation (complement subset) t`.
-/
def ComplementSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists supremum, Supremum relation subset supremum) /\
    Not (exists supremum, Supremum relation (complement subset) supremum)

/--
`IntegerSingletonComplementHasNoSupremum` proves that complementation has no
general supremum formula: `{0}` has supremum `0`, while its integer complement
is unbounded above and has no integer supremum.

Logical form: `ComplementSupremumFormulaFails (· ≤ ·) Set.compl ({0} : Set ℤ)`.
-/
theorem IntegerSingletonComplementHasNoSupremum :
    ComplementSupremumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int) := by
  sorry

/--
`DifferenceSupremumFormulaFails` records the discrete failure in which both
operands have suprema but their relative difference has none.

Logical form: `(∃ s, Supremum relation left s) ∧ (∃ t, Supremum relation removed t) ∧ ¬ ∃ d, Supremum relation (left \ removed) d`.
-/
def DifferenceSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists supremum, Supremum relation left supremum) /\
    (exists supremum, Supremum relation removed supremum) /\
      Not (exists supremum, Supremum relation (left \ removed) supremum)

/--
`IntegerSingletonDifferenceHasNoSupremum` proves that the two operand suprema do
not determine a supremum of their difference: `{0} \ {0}` is empty.

Logical form: `DifferenceSupremumFormulaFails (· ≤ ·) ({0} : Set ℤ) ({0} : Set ℤ)`.
-/
theorem IntegerSingletonDifferenceHasNoSupremum :
    DifferenceSupremumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int) := by
  sorry

end LRA.Order

/-! ### Bounds/UpperBound -/

namespace LRA.Order

/--
`FailsUpperBound`

Statement: A proposed element fails when it is not an upper bound of the subset.

Logical form: `Not (UpperBound relation subset candidate)`.
-/
def FailsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (UpperBound relation subset candidate)

section RealOpenUnitInterval

/--
`ZeroFailsUpperBoundOfOpenUnitInterval`

Statement: Zero fails as an upper bound of the open unit interval.

Logical form: `FailsUpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0`.
-/
theorem ZeroFailsUpperBoundOfOpenUnitInterval :
    FailsUpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry

end RealOpenUnitInterval

end LRA.Order

/-! ### Constructions/ProductOrder -/

namespace LRA.Order

/--
`ProductOrderFailsTotality`

Statement: A coordinatewise product relation fails totality.

Logical form: `Not (LRA.Relation.Total (ProductRelation leftRelation rightRelation))`.
-/
def ProductOrderFailsTotality
    {Left : Type u} {Right : Type v}
    (leftRelation : LRA.Relation.Endorelation Left)
    (rightRelation : LRA.Relation.Endorelation Right) : Prop :=
  Not (LRA.Relation.Total
    (ProductRelation leftRelation rightRelation))

/--
`ProductOfLinearOrdersNeedNotBeLinear`

Statement: Product orders need not be linear, even when both factors are linear.

Logical form: `ProductOrderFailsTotality (fun left right : Nat => left ≤ right) (fun left right : Nat => left ≤ right)`.
-/
theorem ProductOfLinearOrdersNeedNotBeLinear :
    ProductOrderFailsTotality
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right) := by
  sorry

end LRA.Order

/-! ### Density/DenseLinearOrder -/

namespace LRA.Order

/--
`FailsDenseLinearOrder`

Statement: A relation fails the dense-linear-order laws.

Logical form: `Not (DenseLinearOrder relation)`.
-/
def FailsDenseLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (DenseLinearOrder relation)

/--
`IntegerStrictOrderIsNotDenseLinearOrder`

Statement: The integer strict order is linear but not dense.

Logical form: `FailsDenseLinearOrder (fun left right : Int => left < right)`.
-/
theorem IntegerStrictOrderIsNotDenseLinearOrder :
    FailsDenseLinearOrder (fun left right : Int => left < right) := by
  sorry

end LRA.Order

/-! ### Density/DenseOrder -/

namespace LRA.Order

/--
`ReflexivityMakesRawDensityVacuous`

Statement: The raw density predicate fails to exclude endpoint witnesses on
reflexive relations.

Logical form: `LRA.Relation.Reflexive relation → LRA.Relation.Dense relation`.
-/
def ReflexivityMakesRawDensityVacuous
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LRA.Relation.Reflexive relation -> LRA.Relation.Dense relation

/--
`ReflexiveRelationIsRawDense`

Statement: Every reflexive relation satisfies the raw density predicate by
choosing the left endpoint as the middle witness.

Logical form: `ReflexivityMakesRawDensityVacuous relation`.
-/
theorem ReflexiveRelationIsRawDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha} :
    ReflexivityMakesRawDensityVacuous relation := by
  intro relationIsReflexive
  intro left right leftRelatedToRight
  exact ⟨left, relationIsReflexive left, leftRelatedToRight⟩

end LRA.Order

/-! ### Directedness/Chain -/

namespace LRA.Order

/--
`FailsChain`

Statement: A represented subset fails to be a chain when it contains
incomparable elements.

Logical form: `Not (Chain relation subset)`.
-/
def FailsChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Chain relation subset)

section NaturalDivisibility

/--
`TwoAndThreeFailDivisibilityChain`

Statement: Two and three are incomparable by divisibility, so their represented
subset is not a chain.

Logical form: `FailsChain (fun left right : Nat => left ∣ right) {2, 3}`.
-/
theorem TwoAndThreeFailDivisibilityChain :
    FailsChain (fun left right : Nat => left ∣ right)
      ({number | number = 2 \/ number = 3} : Set Nat) := by
  sorry

end NaturalDivisibility

end LRA.Order

/-! ### Directedness/Directed -/

namespace LRA.Order

/--
`DirectednessFailsToImplyChain`

Statement: A concrete subset is directed but is not a chain.

Logical form: `Directed relation subset ∧ Not (Chain relation subset)`.
-/
def DirectednessFailsToImplyChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Directed relation subset /\ Not (Chain relation subset)

/--
`DirectednessFailsUnderSubset`

Statement: A directed ambient set has a represented subset that is not directed.

Logical form: `Directed relation ambient ∧ (∀ element, element ∈ subset → element ∈ ambient) ∧ Not (Directed relation subset)`.
-/
def DirectednessFailsUnderSubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (ambient subset : SetObject) : Prop :=
  Directed relation ambient /\
    (forall element, element ∈ subset -> element ∈ ambient) /\
      Not (Directed relation subset)

/--
`DirectedDoesNotImplyChain`

Statement: The divisibility-directed subset `{2, 3, 6}` is not a chain.

Logical form: `DirectednessFailsToImplyChain (fun left right : Nat => left ∣ right) {2, 3, 6}`.
-/
theorem DirectedDoesNotImplyChain :
    let subset : Set Nat := {element | element = 2 \/ element = 3 \/ element = 6}
    DirectednessFailsToImplyChain
      (fun left right : Nat => left ∣ right) subset := by
  sorry

/--
`SubsetOfDirectedSetNeedNotBeDirected`

Statement: A represented subset of a directed set need not itself be directed.

Logical form: `DirectednessFailsUnderSubset (fun left right : Nat => left ∣ right) Set.univ {2, 3}`.
-/
theorem SubsetOfDirectedSetNeedNotBeDirected :
    let relation := fun left right : Nat => left ∣ right
    let ambient : Set Nat := Set.univ
    let subset : Set Nat := {element | element = 2 \/ element = 3}
    DirectednessFailsUnderSubset relation ambient subset := by
  sorry

end LRA.Order

/-! ### Lattices/CompleteLattice -/

namespace LRA.Order

/--
`FailsCompleteLattice`

Statement: A relation fails completeness when some represented subset lacks a
supremum or infimum.

Logical form: `Not (CompleteLattice SetObject relation)`.
-/
def FailsCompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (CompleteLattice SetObject relation)

/--
`IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice`

Statement: The integers have the least-upper-bound property for nonempty
bounded-above subsets but are not a complete lattice.

Logical form: `LeastUpperBoundProperty (Set Int) (fun left right : Int => left ≤ right) ∧ FailsCompleteLattice (Set Int) (fun left right : Int => left ≤ right)`.
-/
theorem IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice :
    LeastUpperBoundProperty (Set Int) (fun left right : Int => left ≤ right) /\
      FailsCompleteLattice (Set Int)
        (fun left right : Int => left ≤ right) := by
  sorry

end LRA.Order

/-! ### Lattices/DistributiveLattice -/

namespace LRA.Order

/--
`FailsDistributiveLattice`

Statement: A lattice relation fails when it does not satisfy distributivity.

Logical form: `Lattice relation ∧ Not (DistributiveLattice relation)`.
-/
def FailsDistributiveLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Lattice relation /\ Not (DistributiveLattice relation)

/--
`M3Relation`

Statement: The five-element diamond relation `M₃` has bottom `0`, top `4`,
and three incomparable middle elements.

Logical form: `left = right ∨ left = 0 ∨ right = 4`.
-/
def M3Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4

/--
`N5Relation`

Statement: The pentagon relation `N₅` augments the common bottom and top with
the comparison from `1` to `2`.

Logical form: `left = right ∨ left = 0 ∨ right = 4 ∨ (left = 1 ∧ right = 2)`.
-/
def N5Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4 \/ (left = 1 /\ right = 2)

/--
`M3IsNondistributiveLattice`

Statement: The diamond `M₃` is a lattice but is not distributive.

Logical form: `FailsDistributiveLattice M3Relation`.
-/
theorem M3IsNondistributiveLattice :
    FailsDistributiveLattice M3Relation := by
  sorry

/--
`N5IsNondistributiveLattice`

Statement: The pentagon `N₅` is a lattice but is not distributive.

Logical form: `FailsDistributiveLattice N5Relation`.
-/
theorem N5IsNondistributiveLattice :
    FailsDistributiveLattice N5Relation := by
  sorry

end LRA.Order

/-! ### Lattices/Join -/

namespace LRA.Order

/--
`FailsJoin`

Statement: A candidate fails when it is not the join of the displayed pair.

Logical form: `Not (Join relation left right candidate)`.
-/
def FailsJoin
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Join relation left right candidate)

section NaturalNumbers

/--
`TwoFailsJoinOfTwoAndThree`

Statement: Two fails as the join of two and three under the usual order.

Logical form: `FailsJoin (fun left right : Nat => left ≤ right) 2 3 2`.
-/
theorem TwoFailsJoinOfTwoAndThree :
    FailsJoin (fun left right : Nat => left ≤ right) 2 3 2 := by
  sorry

end NaturalNumbers

end LRA.Order

/-! ### Lattices/JoinSemilattice -/

namespace LRA.Order

/--
`FailsJoinSemilattice`

Statement: A relation fails the join-semilattice laws.

Logical form: `Not (JoinSemilattice relation)`.
-/
def FailsJoinSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (JoinSemilattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsJoinSemilattice`

Statement: Equality on two distinct booleans has no join for `false` and `true`.

Logical form: `FailsJoinSemilattice (fun left right : Bool => left = right)`.
-/
theorem BooleanEqualityFailsJoinSemilattice :
    FailsJoinSemilattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order

/-! ### Lattices/Lattice -/

namespace LRA.Order

/--
`FailsLattice`

Statement: A relation fails the lattice laws.

Logical form: `Not (Lattice relation)`.
-/
def FailsLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (Lattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsLattice`

Statement: Equality on two distinct booleans is a partial order but not a lattice.

Logical form: `FailsLattice (fun left right : Bool => left = right)`.
-/
theorem BooleanEqualityFailsLattice :
    FailsLattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order

/-! ### Lattices/Meet -/

namespace LRA.Order

/--
`FailsMeet`

Statement: A candidate fails when it is not the meet of the displayed pair.

Logical form: `Not (Meet relation left right candidate)`.
-/
def FailsMeet
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Meet relation left right candidate)

section NaturalNumbers

/--
`ThreeFailsMeetOfTwoAndThree`

Statement: Three fails as the meet of two and three under the usual order.

Logical form: `FailsMeet (fun left right : Nat => left ≤ right) 2 3 3`.
-/
theorem ThreeFailsMeetOfTwoAndThree :
    FailsMeet (fun left right : Nat => left ≤ right) 2 3 3 := by
  sorry

end NaturalNumbers

end LRA.Order

/-! ### Lattices/MeetSemilattice -/

namespace LRA.Order

/--
`FailsMeetSemilattice`

Statement: A relation fails the meet-semilattice laws.

Logical form: `Not (MeetSemilattice relation)`.
-/
def FailsMeetSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (MeetSemilattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsMeetSemilattice`

Statement: Equality on two distinct booleans has no meet for `false` and `true`.

Logical form: `FailsMeetSemilattice (fun left right : Bool => left = right)`.
-/
theorem BooleanEqualityFailsMeetSemilattice :
    FailsMeetSemilattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order

/-! ### Laws/OperationCompatibility -/

namespace LRA.Order

/-!
Failure modes for order-operation compatibility laws belong here.
-/

/-- Failure of left-translation relation preservation. -/
def FailsLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (LeftTranslationPreservesRelation relation operation)

/-- Failure of right-translation relation preservation. -/
def FailsRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (RightTranslationPreservesRelation relation operation)

/-- Natural-number truncated subtraction as a concrete preservation failure. -/
def NaturalSubtractionForOrderCompatibilityFailure :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right

/--
**[Failure Mode - NaturalSubtractionFailsLeftTranslationPreservesLessEqual]**

Subtracting from the same natural number on the left does not preserve `<=`.
-/
theorem NaturalSubtractionFailsLeftTranslationPreservesLessEqual :
    FailsLeftTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityFailure := by
  intro law
  exact Nat.not_succ_le_zero 0 (law 1 0 1 (Nat.zero_le 1))

end LRA.Order

/-! ### Morphisms/Antitone -/

namespace LRA.Order

/--
`FailsAntitone`

Statement: A map fails to reverse the displayed relations.

Logical form: `Not (Antitone sourceRelation targetRelation map)`.
-/
def FailsAntitone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Antitone sourceRelation targetRelation map)

section NaturalNumbers

/--
`NaturalIdentityFailsAntitone`

Statement: The identity map on natural numbers is not antitone.

Logical form: `FailsAntitone (fun left right : Nat => left ≤ right) (fun left right : Nat => left ≤ right) id`.
-/
theorem NaturalIdentityFailsAntitone :
    FailsAntitone
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      (fun value => value) := by
  sorry

end NaturalNumbers

end LRA.Order

/-! ### Morphisms/Monotone -/

namespace LRA.Order

/--
`FailsMonotone`

Statement: A map fails to preserve the displayed relations.

Logical form: `Not (Monotone sourceRelation targetRelation map)`.
-/
def FailsMonotone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Monotone sourceRelation targetRelation map)

section Integers

/--
`IntegerNegationFailsMonotone`

Statement: Negation reverses, rather than preserves, the usual integer order.

Logical form: `FailsMonotone (fun left right : Int => left ≤ right) (fun left right : Int => left ≤ right) (fun value => -value)`.
-/
theorem IntegerNegationFailsMonotone :
    FailsMonotone
      (fun left right : Int => left ≤ right)
      (fun left right : Int => left ≤ right)
      (fun value => -value) := by
  sorry

end Integers

end LRA.Order

/-! ### Morphisms/OrderEmbedding -/

namespace LRA.Order

/--
`FailsOrderEmbedding`

Statement: A map fails to preserve and reflect the displayed relations.

Logical form: `Not (OrderEmbedding sourceRelation targetRelation map)`.
-/
def FailsOrderEmbedding
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (OrderEmbedding sourceRelation targetRelation map)

/--
`BooleanChainRelation`

Statement: The canonical two-element non-strict chain orders `false` below
`true`.

Logical form: `left = false ∨ right = true`.
-/
def BooleanChainRelation : LRA.Relation.Endorelation Bool :=
  fun left right => left = false \/ right = true

/--
`MonotoneBijectionNeedNotHaveMonotoneInverse`

Statement: The identity from the two-element antichain to the two-element
chain is a monotone bijection, but its inverse is not monotone and the map is
not an order embedding.

Logical form: bijectivity and forward monotonicity hold, inverse monotonicity
fails, and `FailsOrderEmbedding` holds.
-/
theorem MonotoneBijectionNeedNotHaveMonotoneInverse :
    Function.Bijective (fun value : Bool => value) /\
      Monotone (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) /\
      Not (Monotone BooleanChainRelation
        (fun left right : Bool => left = right) (fun value => value)) /\
      FailsOrderEmbedding
        (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) := by
  sorry

end LRA.Order

/-! ### Morphisms/OrderIsomorphism -/

namespace LRA.Order

/--
`FailsOrderIsomorphism`

Statement: A proposed pair of maps fails to define an order isomorphism.

Logical form: `Not (OrderIsomorphism sourceRelation targetRelation forward inverse)`.
-/
def FailsOrderIsomorphism
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (forward : Source -> Target) (inverse : Target -> Source) : Prop :=
  Not (OrderIsomorphism sourceRelation targetRelation forward inverse)

section Booleans

/--
`BooleanConstantMapsFailOrderIsomorphism`

Statement: Constant maps cannot form an order isomorphism on the two-element chain.

Logical form: `FailsOrderIsomorphism BooleanChain BooleanChain (fun _ => false) (fun _ => false)`.
-/
theorem BooleanConstantMapsFailOrderIsomorphism :
    FailsOrderIsomorphism
      (fun left right : Bool => left = false \/ right = true)
      (fun left right : Bool => left = false \/ right = true)
      (fun _ => false) (fun _ => false) := by
  sorry

end Booleans

end LRA.Order

/-! ### OrderedSets/LinearOrder -/

namespace LRA.Order.OrderedSets.LinearOrder

/--
`FailsTotality`

Statement: An endorelation fails totality when some pair is incomparable.

Logical form: `Not (LRA.Relation.Total relation)`.
-/
def FailsTotality
    {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier) : Prop :=
  Not (LRA.Relation.Total relation)

/--
`BooleanEqualityPartialOrderFailsTotality`

Statement: Equality on booleans is a partial order but not a linear order.

Logical form: `FailsTotality BooleanEqualityNonStrictPartialOrder.relation`.
-/
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality
      LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

/--
`NaturalDivisibilityIsNotLinearOrder`

Statement: Natural-number divisibility is not linear because, for example,
`2` and `3` are incomparable.

Logical form: `FailsTotality (fun left right : Nat => left ∣ right)`.
-/
theorem NaturalDivisibilityIsNotLinearOrder :
    FailsTotality (fun left right : Nat => left ∣ right) := by
  sorry

end LRA.Order.OrderedSets.LinearOrder

/-! ### OrderedSets/Preorder -/

namespace LRA.Order.OrderedSets.Preorder

/--
`FailsPreorder`

Statement: An endorelation fails to satisfy the preorder laws.

Logical form:

```lean
Not (LRA.Order.Preorder relation)
```
-/
def FailsPreorder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.Preorder relation)

/--
`StrictPartConstructionsFailToAgree`

Statement: The two standard strict-part constructions fail to agree on a preorder.

Logical form: `LRA.Order.StrictPart preorder.relation ≠ StrictPartByNotConverse preorder`.
-/
def StrictPartConstructionsFailToAgree
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Prop :=
  LRA.Order.StrictPart preorder.relation ≠
    StrictPartByNotConverse preorder

/--
`ImmediateSuccessorOrEqualRelation`

Statement: Natural numbers are related when they are equal or the right value
is the immediate successor of the left.

Logical form: `left = right ∨ right = left + 1`.
-/
def ImmediateSuccessorOrEqualRelation :
    LRA.Relation.Endorelation Nat :=
  fun left right => left = right \/ right = left + 1

/--
`ImmediateSuccessorOrEqualFailsPreorder`

Statement: The immediate-successor-or-equality relation is reflexive but not
transitive, so it fails to be a preorder.

Logical form: reflexivity holds, transitivity fails, and
`FailsPreorder ImmediateSuccessorOrEqualRelation` holds.
-/
theorem ImmediateSuccessorOrEqualFailsPreorder :
    LRA.Relation.Reflexive ImmediateSuccessorOrEqualRelation /\
      Not (LRA.Relation.Transitive
        ImmediateSuccessorOrEqualRelation) /\
      FailsPreorder ImmediateSuccessorOrEqualRelation := by
  sorry

/--
`NatStrictOrderFailsPreorder`

Statement: The natural strict order is transitive but non-reflexive, so it
fails to be a preorder.

Logical form: transitivity holds, reflexivity fails, and
`FailsPreorder (fun left right : Nat => left < right)` holds.
-/
theorem NatStrictOrderFailsPreorder :
    LRA.Relation.Transitive (fun left right : Nat => left < right) /\
      Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      FailsPreorder (fun left right : Nat => left < right) := by
  sorry

/--
`StrictPartConstructionsDifferOnUniversalPreorder`

Statement: The inequality-based strict part and the non-converse strict part
differ for preorders without antisymmetry, witnessed by the universal Boolean
preorder.

Logical form: `StrictPartConstructionsFailToAgree BooleanUniversalPreorder`.
-/
theorem StrictPartConstructionsDifferOnUniversalPreorder :
    StrictPartConstructionsFailToAgree BooleanUniversalPreorder := by
  sorry

end LRA.Order.OrderedSets.Preorder

/-! ### OrderedSets/PartialOrder -/

namespace LRA.Order.OrderedSets.PartialOrder

/--
`FailsNonStrictPartialOrder`

Statement: An endorelation does not satisfy the non-strict partial-order laws.

Logical form:

```lean
Not (LRA.Order.PartialOrder relation)
```
-/
def FailsNonStrictPartialOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.PartialOrder relation)

/--
`FailsTransitivity`

Statement: An endorelation is not transitive.

Logical form:

```lean
Not (LRA.Relation.Transitive relation)
```
-/
def FailsTransitivity
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Relation.Transitive relation)

/--
`ImmediateSuccessorOrEqualFailsTransitivity`

Statement: The immediate-successor-or-equality relation is reflexive and antisymmetric
but fails transitivity.

Logical form:

```lean
FailsTransitivity ImmediateSuccessorOrEqualRelation
```
-/
theorem ImmediateSuccessorOrEqualFailsTransitivity :
    LRA.Relation.Reflexive
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      LRA.Relation.Antisymmetric
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsTransitivity
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsNonStrictPartialOrder
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation := by
  sorry

/--
`NatStrictOrderFailsNonStrictPartialOrder`

Statement: The usual strict order on natural numbers is not a non-strict partial order,
because it is not reflexive.

Logical form:

```lean
FailsNonStrictPartialOrder (fun left right : Nat => left < right)
```
-/
theorem NatStrictOrderFailsNonStrictPartialOrder :
    Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      LRA.Relation.Antisymmetric
        (fun left right : Nat => left < right) /\
      LRA.Relation.Transitive
        (fun left right : Nat => left < right) /\
      FailsNonStrictPartialOrder (fun left right : Nat => left < right) := by
  sorry

/--
`BooleanUniversalRelationFailsNonStrictPartialOrder`

Statement: The universal relation on booleans is not a non-strict partial order, because
it is not antisymmetric.

Logical form:

```lean
FailsNonStrictPartialOrder (fun _ _ : Bool => True)
```
-/
theorem BooleanUniversalRelationFailsNonStrictPartialOrder :
    LRA.Relation.Reflexive (fun _ _ : Bool => True) /\
      Not (LRA.Relation.Antisymmetric
        (fun _ _ : Bool => True)) /\
      LRA.Relation.Transitive (fun _ _ : Bool => True) /\
      FailsNonStrictPartialOrder (fun _ _ : Bool => True) := by
  sorry

/--
`IntegerDivisibilityIsPreorderButNotPartialOrder`

Statement: Integer divisibility is a preorder but not a partial order: `3` and
`-3` divide one another without being equal.

Logical form: `LRA.Order.Preorder (fun left right : Int => left ∣ right) ∧ FailsNonStrictPartialOrder (fun left right : Int => left ∣ right)`.
-/
theorem IntegerDivisibilityIsPreorderButNotPartialOrder :
    LRA.Order.Preorder (fun left right : Int => left ∣ right) /\
      FailsNonStrictPartialOrder
        (fun left right : Int => left ∣ right) := by
  sorry

end LRA.Order.OrderedSets.PartialOrder

/-! ### OrderedSets/Poset -/

namespace LRA.Order.OrderedSets.Poset

/--
`FailsPosetLaws`

Statement: A relation fails at least one of the three partial-order laws
required for a poset.

Logical form:

```lean
Not (LRA.Order.PartialOrder relation)
```
-/
def FailsPosetLaws {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  Not (LRA.Order.PartialOrder relation)

/--
`NatStrictOrderFailsPosetLaws`

Statement: The usual strict order on natural numbers is not a poset order, because it is
not reflexive.

Logical form:

```lean
FailsPosetLaws (fun left right : Nat => left < right)
```
-/
theorem NatStrictOrderFailsPosetLaws :
    FailsPosetLaws (fun left right : Nat => left < right) := by
  sorry

end LRA.Order.OrderedSets.Poset

/-! ### OrderedSets/StrictLinearOrder -/

namespace LRA.Order

/--
`FailsStrictLinearOrder`

Statement: A relation fails the strict-linear-order laws.

Logical form: `Not (StrictLinearOrder relation)`.
-/
def FailsStrictLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (StrictLinearOrder relation)

section Booleans

/--
`BooleanEqualityFailsStrictLinearOrder`

Statement: Equality is reflexive, so it cannot be a strict linear order.

Logical form: `FailsStrictLinearOrder (fun left right : Bool => left = right)`.
-/
theorem BooleanEqualityFailsStrictLinearOrder :
    FailsStrictLinearOrder (fun left right : Bool => left = right) := by
  sorry

end Booleans

end LRA.Order

/-! ### OrderedSets/StrictOrder -/

namespace LRA.Order.OrderedSets.StrictOrder

/--
`FailsStrictOrder`

Statement: An endorelation does not satisfy the strict-order laws.

Logical form:

```lean
Not (LRA.Order.StrictOrder relation)
```
-/
def FailsStrictOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.StrictOrder relation)

/--
`NatNonStrictOrderFailsStrictOrder`

Statement: The usual non-strict order on natural numbers is not a strict order, because
it is not irreflexive.

Logical form:

```lean
FailsStrictOrder (fun left right : Nat => left <= right)
```
-/
theorem NatNonStrictOrderFailsStrictOrder :
    LRA.Relation.Transitive (fun left right : Nat => left <= right) /\
      Not (LRA.Relation.Irreflexive
        (fun left right : Nat => left <= right)) /\
      FailsStrictOrder (fun left right : Nat => left <= right) := by
  sorry

/--
`ImmediateSuccessorRelation`

Statement: The immediate-successor relation holds exactly when the right
natural number is one more than the left.

Logical form: `right = left + 1`.
-/
def ImmediateSuccessorRelation : LRA.Relation.Endorelation Nat :=
  fun left right => right = left + 1

/--
`ImmediateSuccessorFailsStrictOrder`

Statement: The immediate-successor relation is irreflexive but not transitive,
so irreflexivity alone does not make a strict order.

Logical form: irreflexivity holds, transitivity fails, and
`FailsStrictOrder ImmediateSuccessorRelation` holds.
-/
theorem ImmediateSuccessorFailsStrictOrder :
    LRA.Relation.Irreflexive ImmediateSuccessorRelation /\
      Not (LRA.Relation.Transitive ImmediateSuccessorRelation) /\
      FailsStrictOrder ImmediateSuccessorRelation := by
  sorry

end LRA.Order.OrderedSets.StrictOrder

/-! ### OrderedSets/WellOrder -/

namespace LRA.Order

/--
`FailsWellOrder`

Statement: A relation fails to well-order the subsets represented by a backend.

Logical form: `Not (WellOrder SetObject relation)`.
-/
def FailsWellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (WellOrder SetObject relation)

/--
`IntegersAreNotWellOrdered`

Statement: The integers with their usual order are not well-ordered.

Logical form: `FailsWellOrder (Set Int) (fun left right : Int => left ≤ right)`.
-/
theorem IntegersAreNotWellOrdered :
    FailsWellOrder (Set Int) (fun left right : Int => left ≤ right) := by
  sorry

end LRA.Order
