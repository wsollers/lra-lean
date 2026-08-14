import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
`FailsNonStrictPartialOrder relation` says that an endorelation does not
satisfy the non-strict partial-order laws.

Logical form:

```lean
Not (LRA.VolumeI.Order.PartialOrder relation)
```
-/
def FailsNonStrictPartialOrder
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Order.PartialOrder relation)

/--
`FailsStrictPartialOrder relation` says that an endorelation does not satisfy
the strict partial-order laws.

Logical form:

```lean
Not (LRA.VolumeI.Order.StrictPartialOrder relation)
```
-/
def FailsStrictPartialOrder
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Order.StrictPartialOrder relation)

/--
`FailsTransitivity relation` says that an endorelation is not transitive.

Logical form:

```lean
Not (LRA.VolumeI.Relations.Transitive relation)
```
-/
def FailsTransitivity
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Relations.Transitive relation)

/--
`FailsTotality relation` says that an endorelation is not total.

Logical form:

```lean
Not (LRA.VolumeI.Relations.Total relation)
```
-/
def FailsTotality
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Relations.Total relation)

end LRA.VolumeI.Order.OrderedSets.PartialOrder
