import LRA.Order.OrderedSets.Poset.Characterizations

namespace LRA.Order.OrderedSets.Poset

/--
Every element of a poset is below itself in the packaged non-strict order.

Logical form:

```lean
poset.NonStrictOrder element element
```
-/
theorem PosetElementRelatesToItself
    (poset : LRA.Order.Poset)
    (element : poset.Carrier) :
    poset.NonStrictOrder element element :=
  PosetOrderIsReflexive poset element

/--
Two mutually related elements of a poset are equal.

Logical form:

```lean
poset.NonStrictOrder left right ->
poset.NonStrictOrder right left ->
left = right
```
-/
theorem PosetMutualOrderImpliesEqual
    (poset : LRA.Order.Poset)
    (left right : poset.Carrier)
    (leftBelowRight : poset.NonStrictOrder left right)
    (rightBelowLeft : poset.NonStrictOrder right left) :
    left = right :=
  PosetOrderIsAntisymmetric poset left right leftBelowRight rightBelowLeft

/--
The non-strict order in a poset composes transitively.

Logical form:

```lean
poset.NonStrictOrder first second ->
poset.NonStrictOrder second third ->
poset.NonStrictOrder first third
```
-/
theorem PosetOrderTrans
    (poset : LRA.Order.Poset)
    (first second third : poset.Carrier)
    (firstBelowSecond : poset.NonStrictOrder first second)
    (secondBelowThird : poset.NonStrictOrder second third) :
    poset.NonStrictOrder first third :=
  PosetOrderIsTransitive poset first second third
    firstBelowSecond secondBelowThird

end LRA.Order.OrderedSets.Poset
