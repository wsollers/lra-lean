import LRA.VolumeI.Relations.Order.OrderStructures.PartialOrder
import LRA.VolumeI.Relations.Order.OrderStructures.StrictPartialOrder
import LRA.VolumeI.Relations.Order.OrderStructures.TotalOrder
import LRA.VolumeI.Relations.Order.OrderStructures.StrictLinearOrder
import LRA.VolumeI.Relations.Order.Relations

namespace LRA.VolumeI.Relations.Order

universe u

/--
A non-strict order can be recovered from its strict part and equality.

Logical form:

```lean
def NonStrictFromStrict {Alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation Alpha) :
    LRA.VolumeI.Relations.Endorelation Alpha :=
  LessThanOrEqual strictRelation
```
-/
def NonStrictFromStrict {Alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation Alpha) :
    LRA.VolumeI.Relations.Endorelation Alpha :=
  LessThanOrEqual strictRelation

/--
A strict order can be recovered as the strict part of a non-strict order.

Logical form:

```lean
def StrictFromNonStrict {Alpha : Type u}
    (nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha) :
    LRA.VolumeI.Relations.Endorelation Alpha :=
  StrictPart nonStrictRelation
```
-/
def StrictFromNonStrict {Alpha : Type u}
    (nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha) :
    LRA.VolumeI.Relations.Endorelation Alpha :=
  StrictPart nonStrictRelation

/--
Strict partial orders induce partial orders through adjoining equality.

Logical form:

```lean
theorem StrictPartialOrderInducesPartialOrder
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictPartialOrder : StrictPartialOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation)
```
-/
theorem StrictPartialOrderInducesPartialOrder
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictPartialOrder : StrictPartialOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation) := by
  sorry

/--
Partial orders induce strict partial orders by removing equality.

Logical form:

```lean
theorem PartialOrderInducesStrictPartialOrder
    {Alpha : Type u}
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictPartialOrder (StrictFromNonStrict nonStrictRelation)
```
-/
theorem PartialOrderInducesStrictPartialOrder
    {Alpha : Type u}
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictPartialOrder (StrictFromNonStrict nonStrictRelation) := by
  sorry

/--
Strict linear orders induce total orders through adjoining equality.

Logical form:

```lean
theorem StrictLinearOrderInducesTotalOrder
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    TotalOrder (NonStrictFromStrict strictRelation)
```
-/
theorem StrictLinearOrderInducesTotalOrder
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    TotalOrder (NonStrictFromStrict strictRelation) := by
  sorry

/--
The strict/non-strict conversions are inverse at the theorem-interface level.

Logical form:

```lean
theorem StrictNonStrictInverseCorrespondence
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation
```
-/
theorem StrictNonStrictInverseCorrespondence
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation := by
  sorry

end LRA.VolumeI.Relations.Order
