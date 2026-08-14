import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.OrderedSets.Poset.Definition
import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition
import LRA.VolumeI.Order.StrictLinearOrder
import LRA.VolumeI.Order.OrderedSets.StrictPoset.Definition
import LRA.VolumeI.Order.OrderedSets.TotalOrder.Definition
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
Strict orders induce partial orders through adjoining equality.

Logical form:

```lean
theorem StrictOrderInducesPartialOrder
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictOrder : StrictOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation)
```
-/
theorem StrictOrderInducesPartialOrder
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictOrder : StrictOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation) := by
  sorry

/--
Partial orders induce strict orders by removing equality.

Logical form:

```lean
theorem PartialOrderInducesStrictOrder
    {Alpha : Type u}
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictOrder (StrictFromNonStrict nonStrictRelation)
```
-/
theorem PartialOrderInducesStrictOrder
    {Alpha : Type u}
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictOrder (StrictFromNonStrict nonStrictRelation) := by
  sorry

/--
Strict linear orders induce total orders through adjoining equality.

Logical form:

```lean
theorem StrictLinearOrderInducesTotalOrder
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsIrreflexive :
      LRA.VolumeI.Relations.Irreflexive strictRelation) :
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
    (strictRelationIsIrreflexive :
      LRA.VolumeI.Relations.Irreflexive strictRelation) :
    StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation := by
  sorry

/--
Adjoining equality to the strict part of a reflexive relation recovers the
original relation. Reflexivity is the only required law.
-/
theorem NonStrictStrictInverseCorrespondence
    {Alpha : Type u}
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (nonStrictRelationIsReflexive :
      LRA.VolumeI.Relations.Reflexive nonStrictRelation) :
    NonStrictFromStrict (StrictFromNonStrict nonStrictRelation) =
      nonStrictRelation := by
  sorry


/--
`StrictPosetOfPoset poset` derives the strict poset whose order is the strict
part of the partial order carried by `poset`: keep every related pair whose
components differ.

Logical form:

```lean
StrictPoset where
  Carrier := poset.Carrier
  StrictRelation := StrictFromNonStrict poset.NonStrictOrder
  StrictRelationIsStrictOrder :=
    PartialOrderInducesStrictOrder poset.NonStrictOrderIsPartialOrder
```
-/
def StrictPosetOfPoset (poset : Poset) : StrictPoset where
  Carrier := poset.Carrier
  StrictRelation := StrictFromNonStrict poset.NonStrictOrder
  StrictRelationIsStrictOrder :=
    PartialOrderInducesStrictOrder poset.NonStrictOrderIsPartialOrder

/--
`PosetOfStrictPoset strictPoset` derives the poset whose order adjoins
equality to the strict order carried by `strictPoset`.

Logical form:

```lean
Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictRelation
  NonStrictOrderIsPartialOrder :=
    StrictOrderInducesPartialOrder
      strictPoset.StrictRelationIsStrictOrder
```
-/
def PosetOfStrictPoset (strictPoset : StrictPoset) : Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictRelation
  NonStrictOrderIsPartialOrder :=
    StrictOrderInducesPartialOrder
      strictPoset.StrictRelationIsStrictOrder

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

/-!
The relation equalities above use function extensionality and propositional
extensionality; the structure equalities additionally use proof irrelevance
for law fields. These are expected logical dependencies of the equality-valued
convenience interface. Pointwise equivalences remain available in the concept
relationship modules when equality of relations is unnecessary.
-/

end LRA.VolumeI.Order
