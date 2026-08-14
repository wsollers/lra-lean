import LRA.VolumeI.Order.OrderedSets.PartialOrder.Characterizations
import LRA.VolumeI.Order.OrderedSets.Preorder.Relationships
import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
The strict part of a non-strict partial order.

Logical form:

```lean
fun left right => order.relation left right /\ left /= right
```
-/
def StrictPart
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier :=
  LRA.VolumeI.Order.StrictPart order.relation

/--
The strict part unfolds to non-strict comparison plus inequality.

Logical form:

```lean
StrictPart order left right <->
  order.relation left right /\ left /= right
```
-/
theorem StrictPartIff
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ left ≠ right := by
  sorry

/--
The strict part of a non-strict partial order agrees with the
preorder-compatible strict part because antisymmetry is available.

Logical form:

```lean
StrictPart order left right <->
  order.relation left right /\ Not (order.relation right left)
```
-/
theorem StrictPartIffNotConverse
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ Not (order.relation right left) := by
  sorry

/--
The strict part of a non-strict partial order, bundled as a strict order.

Logical form:

```lean
StrictOrder.StrictOrderRelation Carrier
```
-/
def StrictPartAsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.VolumeI.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier where
  relation := StrictPart order
  relationIsStrictOrder := by
    sorry

/--
The strict part of a non-strict partial order is a strict order.

Logical form:

```lean
LRA.VolumeI.Order.StrictOrder (StrictPart order)
```
-/
theorem StrictPartIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.VolumeI.Order.StrictOrder (StrictPart order) := by
  sorry

/--
The dual of a non-strict partial order reverses the comparison relation.

Logical form:

```lean
fun left right => order.relation right left
```
-/
def Dual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    NonStrictPartialOrder Carrier where
  relation := LRA.VolumeI.Relations.Converse order.relation
  relationIsPartialOrder := by
    sorry

/--
The dual relation of a partial order is again a partial order.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder (fun left right => order.relation right left)
```
-/
theorem DualIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.VolumeI.Order.PartialOrder
      (LRA.VolumeI.Relations.Converse order.relation) := by
  sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
