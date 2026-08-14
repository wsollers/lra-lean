import LRA.VolumeI.Order.TotalOrder

namespace LRA.VolumeI.Order

universe u v

section Bounds

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- An upper bound of a subset with respect to a non-strict order.

Logical form:

```lean
def UpperBound
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation element bound
```
-/
def UpperBound
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation element bound

/-- A lower bound of a subset with respect to a non-strict order.

Logical form:

```lean
def LowerBound
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation bound element
```
-/
def LowerBound
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation bound element

/-- A least element of a subset with respect to a non-strict order.

Logical form:

```lean
def LeastElement
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (least : Element) : Prop :=
  least ∈ subset /\ LowerBound relation subset least
```
-/
def LeastElement
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (least : Element) : Prop :=
  least ∈ subset /\ LowerBound relation subset least

/-- A greatest element of a subset with respect to a non-strict order.

Logical form:

```lean
def GreatestElement
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (greatest : Element) : Prop :=
  greatest ∈ subset /\ UpperBound relation subset greatest
```
-/
def GreatestElement
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (greatest : Element) : Prop :=
  greatest ∈ subset /\ UpperBound relation subset greatest

/-- A minimal element of a subset with respect to a strict order.

Logical form:

```lean
def MinimalElement
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  minimal ∈ subset /\
    forall element, element ∈ subset -> Not (strictRelation element minimal)
```
-/
def MinimalElement
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  minimal ∈ subset /\
    forall element, element ∈ subset -> Not (strictRelation element minimal)

/-- A maximal element of a subset with respect to a strict order.

Logical form:

```lean
def MaximalElement
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (maximal : Element) : Prop :=
  maximal ∈ subset /\
    forall element, element ∈ subset -> Not (strictRelation maximal element)
```
-/
def MaximalElement
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (maximal : Element) : Prop :=
  maximal ∈ subset /\
    forall element, element ∈ subset -> Not (strictRelation maximal element)

/-- A supremum, or least upper bound, of a subset.

Logical form:

```lean
def Supremum
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (supremum : Element) : Prop :=
  UpperBound relation subset supremum /\
    forall bound, UpperBound relation subset bound -> relation supremum bound
```
-/
def Supremum
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (supremum : Element) : Prop :=
  UpperBound relation subset supremum /\
    forall bound, UpperBound relation subset bound -> relation supremum bound

/-- An infimum, or greatest lower bound, of a subset.

Logical form:

```lean
def Infimum
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (infimum : Element) : Prop :=
  LowerBound relation subset infimum /\
    forall bound, LowerBound relation subset bound -> relation bound infimum
```
-/
def Infimum
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (infimum : Element) : Prop :=
  LowerBound relation subset infimum /\
    forall bound, LowerBound relation subset bound -> relation bound infimum

end Bounds

end LRA.VolumeI.Order
