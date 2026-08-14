import LRA.VolumeI.Order.OrderStructures.PartialOrder
import LRA.VolumeI.Order.OrderStructures.StrictPartialOrder
import LRA.VolumeI.Order.OrderStructures.Poset
import LRA.VolumeI.Order.OrderStructures.StrictPoset
import LRA.VolumeI.Order.OrderStructures.TotalOrder
import LRA.VolumeI.Order.OrderStructures.StrictLinearOrder
import LRA.VolumeI.Order.Relations

namespace LRA.VolumeI.Order

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


/--
`StrictPosetOfPoset poset` derives the strict poset whose order is the strict
part of the partial order carried by `poset`: keep every related pair whose
components differ.

Logical form:

```lean
StrictPoset where
  Carrier := poset.Carrier
  StrictOrder := StrictFromNonStrict poset.NonStrictOrder
  StrictOrderIsStrictPartialOrder :=
    PartialOrderInducesStrictPartialOrder poset.NonStrictOrderIsPartialOrder
```
-/
def StrictPosetOfPoset (poset : Poset) : StrictPoset where
  Carrier := poset.Carrier
  StrictOrder := StrictFromNonStrict poset.NonStrictOrder
  StrictOrderIsStrictPartialOrder :=
    PartialOrderInducesStrictPartialOrder poset.NonStrictOrderIsPartialOrder

/--
`PosetOfStrictPoset strictPoset` derives the poset whose order adjoins
equality to the strict order carried by `strictPoset`.

Logical form:

```lean
Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictOrder
  NonStrictOrderIsPartialOrder :=
    StrictPartialOrderInducesPartialOrder
      strictPoset.StrictOrderIsStrictPartialOrder
```
-/
def PosetOfStrictPoset (strictPoset : StrictPoset) : Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictOrder
  NonStrictOrderIsPartialOrder :=
    StrictPartialOrderInducesPartialOrder
      strictPoset.StrictOrderIsStrictPartialOrder

/--
Descending to the strict poset and ascending again recovers the original
poset: adjoining equality back to the strict part of a reflexive order
changes nothing.

Logical form:

```lean
theorem PosetOfStrictPosetOfPoset (poset : Poset) :
    PosetOfStrictPoset (StrictPosetOfPoset poset) = poset
```
-/
theorem PosetOfStrictPosetOfPoset (poset : Poset) :
    PosetOfStrictPoset (StrictPosetOfPoset poset) = poset := by
  sorry

/--
Ascending to the poset and descending again recovers the original strict
poset: the strict part of the reflexive closure of an irreflexive order is
the order itself.

Logical form:

```lean
theorem StrictPosetOfPosetOfStrictPoset (strictPoset : StrictPoset) :
    StrictPosetOfPoset (PosetOfStrictPoset strictPoset) = strictPoset
```
-/
theorem StrictPosetOfPosetOfStrictPoset (strictPoset : StrictPoset) :
    StrictPosetOfPoset (PosetOfStrictPoset strictPoset) = strictPoset := by
  sorry

end LRA.VolumeI.Order
