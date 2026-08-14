import LRA.VolumeI.Order.Lattices

namespace LRA.VolumeI.Order

universe u v

/-!
Completeness properties. `SetObject` is explicit in each definition: these
assert something about *every subset in a chosen backend*, so which
backend's subsets are quantified over is part of the statement.
-/

/-- Least-upper-bound property for a non-strict order.

Logical form:

```lean
def LeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      (exists upperBound, UpperBound relation subset upperBound) ->
        exists supremum, Supremum relation subset supremum
```
-/
def LeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      (exists upperBound, UpperBound relation subset upperBound) ->
        exists supremum, Supremum relation subset supremum

/-- Greatest-lower-bound property for a non-strict order.

Logical form:

```lean
def GreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      (exists lowerBound, LowerBound relation subset lowerBound) ->
        exists infimum, Infimum relation subset infimum
```
-/
def GreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      (exists lowerBound, LowerBound relation subset lowerBound) ->
        exists infimum, Infimum relation subset infimum

/-- Complete lattice laws: every subset has both a supremum and an infimum.

Logical form:

```lean
def CompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  PartialOrder relation /\
    forall subset : SetObject,
      (exists supremum, Supremum relation subset supremum) /\
        (exists infimum, Infimum relation subset infimum)
```
-/
def CompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  PartialOrder relation /\
    forall subset : SetObject,
      (exists supremum, Supremum relation subset supremum) /\
        (exists infimum, Infimum relation subset infimum)

end LRA.VolumeI.Order
