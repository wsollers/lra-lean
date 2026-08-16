import LRA.VolumeI.Order.OrderedSets.PartialOrder.Characterizations
import LRA.VolumeI.Order.OrderedSets.Preorder.Relationships
import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/--
**[Definition — StrictPart]**

The strict part of a non-strict partial order.

Logical form:

```lean
fun left right => order.relation left right /\ left /= right
```
-/
def StrictPart
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.StrictPart order.relation

/--
**[Theorem — StrictPartIff]**

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
**[Theorem — StrictPartIffNotConverse]**

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
**[Theorem — StrictPartRelationIsStrictOrder]**

The strict part relation of a non-strict partial order satisfies the strict
order laws.

Logical form:

```lean
theorem StrictPartRelationIsStrictOrder
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order)
```
-/
theorem StrictPartRelationIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order) := by
  sorry

/--
**[Definition — StrictPartAsStrictOrder]**

The strict part of a non-strict partial order, bundled as a strict order.

Logical form:

```lean
StrictOrder.StrictOrderRelation Carrier
```
-/
def StrictPartAsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier where
  relation := StrictPart order
  relationIsStrictOrder := StrictPartRelationIsStrictOrder order

/--
**[Theorem — StrictPartIsStrictOrder]**

The strict part of a non-strict partial order is a strict order.

Logical form:

```lean
LRA.Order.StrictOrder (StrictPart order)
```
-/
theorem StrictPartIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order) := by
  exact StrictPartRelationIsStrictOrder order

/--
**[Theorem — DualRelationIsPartialOrder]**

The converse relation of a non-strict partial order satisfies the partial-order
laws.

Logical form:

```lean
theorem DualRelationIsPartialOrder
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder (LRA.Relation.Converse order.relation)
```
-/
theorem DualRelationIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation) := by
  sorry

/--
**[Definition — Dual]**

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
  relation := LRA.Relation.Converse order.relation
  relationIsPartialOrder := DualRelationIsPartialOrder order

/--
**[Theorem — DualIsPartialOrder]**

The dual relation of a partial order is again a partial order.

Logical form:

```lean
LRA.Order.PartialOrder (fun left right => order.relation right left)
```
-/
theorem DualIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation) := by
  exact DualRelationIsPartialOrder order

end LRA.Order.OrderedSets.PartialOrder
