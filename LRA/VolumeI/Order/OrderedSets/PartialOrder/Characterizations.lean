import LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrict
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Strict

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

/--
Projection accessor: the relation packaged by a non-strict partial order is
reflexive.

Logical form:

```lean
LRA.VolumeI.Relations.Reflexive order.relation
```
-/
theorem NonStrictRelationIsReflexive
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.VolumeI.Relations.Reflexive order.relation := by
  sorry

/--
Projection accessor: the relation packaged by a non-strict partial order is
antisymmetric.

Logical form:

```lean
LRA.VolumeI.Relations.Antisymmetric order.relation
```
-/
theorem NonStrictRelationIsAntisymmetric
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.VolumeI.Relations.Antisymmetric order.relation := by
  sorry

/--
Projection accessor: the relation packaged by a non-strict partial order is
transitive.

Logical form:

```lean
LRA.VolumeI.Relations.Transitive order.relation
```
-/
theorem NonStrictRelationIsTransitive
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.VolumeI.Relations.Transitive order.relation := by
  sorry

/--
Projection accessor: the relation packaged by a strict partial order is
irreflexive.

Logical form:

```lean
LRA.VolumeI.Relations.Irreflexive order.relation
```
-/
theorem StrictRelationIsIrreflexive
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier) :
    LRA.VolumeI.Relations.Irreflexive order.relation := by
  sorry

/--
Projection accessor: the relation packaged by a strict partial order is
transitive.

Logical form:

```lean
LRA.VolumeI.Relations.Transitive order.relation
```
-/
theorem StrictRelationIsTransitive
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier) :
    LRA.VolumeI.Relations.Transitive order.relation := by
  sorry

/--
Every strict partial order is asymmetric.

Logical form:

```lean
LRA.VolumeI.Relations.Asymmetric order.relation
```
-/
theorem StrictRelationIsAsymmetric
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier) :
    LRA.VolumeI.Relations.Asymmetric order.relation := by
  sorry

/--
Every strict partial order is antisymmetric, vacuously: mutual strict
comparison cannot occur.

Logical form:

```lean
LRA.VolumeI.Relations.Antisymmetric order.relation
```
-/
theorem StrictRelationIsAntisymmetric
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier) :
    LRA.VolumeI.Relations.Antisymmetric order.relation := by
  sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
