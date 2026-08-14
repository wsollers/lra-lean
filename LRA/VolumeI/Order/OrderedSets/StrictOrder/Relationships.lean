import LRA.VolumeI.Order.OrderedSets.PartialOrder.Relationships
import LRA.VolumeI.Order.OrderedSets.StrictOrder.Characterizations

namespace LRA.VolumeI.Order.OrderedSets.StrictOrder

universe u

/--
The reflexive closure of a strict order.

Logical form:

```lean
fun left right => order.relation left right \/ left = right
```
-/
def ReflexiveClosure
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier :=
  fun left right => order.relation left right \/ left = right

/--
The reflexive closure unfolds to strict comparison or equality.

Logical form:

```lean
ReflexiveClosure order left right <->
  order.relation left right \/ left = right
```
-/
theorem ReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    ReflexiveClosure order left right <->
      order.relation left right \/ left = right := by
  sorry

/--
The reflexive closure of a strict order is a non-strict partial order.

Logical form:

```lean
PartialOrder.NonStrictPartialOrder Carrier
```
-/
def ReflexiveClosureAsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  relationIsPartialOrder := by
    sorry

/--
The reflexive closure of a strict order satisfies the partial-order laws.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder (ReflexiveClosure order)
```
-/
theorem ReflexiveClosureIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.VolumeI.Order.PartialOrder (ReflexiveClosure order) := by
  sorry

/--
Taking reflexive closure and then strict part returns the original strict
order relation.

Logical form:

```lean
PartialOrder.StrictPart (ReflexiveClosureAsPartialOrder order) left right <->
  order.relation left right
```
-/
theorem StrictPartOfReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    LRA.VolumeI.Order.OrderedSets.PartialOrder.StrictPart
      (ReflexiveClosureAsPartialOrder order) left right <->
      order.relation left right := by
  sorry

/--
Taking strict part and then reflexive closure returns the original non-strict
partial order relation.

Logical form:

```lean
ReflexiveClosure (PartialOrder.StrictPartAsStrictOrder order) left right <->
  order.relation left right
```
-/
theorem ReflexiveClosureOfStrictPartIff
    {Carrier : Type u}
    (order : LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrictPartialOrder
      Carrier)
    (left right : Carrier) :
    ReflexiveClosure
        (LRA.VolumeI.Order.OrderedSets.PartialOrder.StrictPartAsStrictOrder
          order) left right <->
      order.relation left right := by
  sorry

end LRA.VolumeI.Order.OrderedSets.StrictOrder
