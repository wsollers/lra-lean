import LRA.VolumeI.Order.OrderedSets.PartialOrder.Characterizations
import LRA.VolumeI.Order.OrderedSets.Preorder.Relationships

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
    Relation Carrier :=
  fun left right => order.relation left right /\ left ≠ right

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
The strict part of a non-strict partial order is a strict partial order.

Logical form:

```lean
StrictPartialOrder Carrier
```
-/
def StrictPartAsStrictPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    StrictPartialOrder Carrier where
  relation := StrictPart order
  isStrictPartialOrder := by
    sorry

/--
The reflexive closure of a strict partial order.

Logical form:

```lean
fun left right => order.relation left right \/ left = right
```
-/
def ReflexiveClosure
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier) :
    Relation Carrier :=
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
    (order : StrictPartialOrder Carrier)
    (left right : Carrier) :
    ReflexiveClosure order left right <->
      order.relation left right \/ left = right := by
  sorry

/--
The reflexive closure of a strict partial order is a non-strict partial order.

Logical form:

```lean
NonStrictPartialOrder Carrier
```
-/
def ReflexiveClosureAsNonStrictPartialOrder
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier) :
    NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  isPartialOrder := by
    sorry

/--
Taking reflexive closure and then strict part returns the original strict
partial order relation.

Logical form:

```lean
StrictPart (ReflexiveClosureAsNonStrictPartialOrder order) left right <->
  order.relation left right
```
-/
theorem StrictPartOfReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart (ReflexiveClosureAsNonStrictPartialOrder order) left right <->
      order.relation left right := by
  sorry

/--
Taking strict part and then reflexive closure returns the original non-strict
partial order relation.

Logical form:

```lean
ReflexiveClosure (StrictPartAsStrictPartialOrder order) left right <->
  order.relation left right
```
-/
theorem ReflexiveClosureOfStrictPartIff
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    ReflexiveClosure (StrictPartAsStrictPartialOrder order) left right <->
      order.relation left right := by
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
  relation := fun left right => order.relation right left
  isPartialOrder := by
    sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
