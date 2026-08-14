import LRA.VolumeI.Order.OrderedSets.PartialOrder.Characterizations
import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.VolumeI.Order.OrderedSets.Poset

/--
The order relation packaged by a poset is a partial order.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder poset.NonStrictOrder
```
-/
theorem PosetOrderIsPartialOrder
    (poset : LRA.VolumeI.Order.Poset) :
    LRA.VolumeI.Order.PartialOrder poset.NonStrictOrder :=
  poset.NonStrictOrderIsPartialOrder

/--
The order relation packaged by a poset is reflexive.

Logical form:

```lean
LRA.VolumeI.Relations.Reflexive poset.NonStrictOrder
```
-/
theorem PosetOrderIsReflexive
    (poset : LRA.VolumeI.Order.Poset) :
    LRA.VolumeI.Relations.Reflexive poset.NonStrictOrder :=
  LRA.VolumeI.Order.OrderedSets.PartialOrder.PartialOrderIsReflexive
    poset.NonStrictOrder poset.NonStrictOrderIsPartialOrder

/--
The order relation packaged by a poset is antisymmetric.

Logical form:

```lean
LRA.VolumeI.Relations.Antisymmetric poset.NonStrictOrder
```
-/
theorem PosetOrderIsAntisymmetric
    (poset : LRA.VolumeI.Order.Poset) :
    LRA.VolumeI.Relations.Antisymmetric poset.NonStrictOrder :=
  LRA.VolumeI.Order.OrderedSets.PartialOrder.PartialOrderIsAntisymmetric
    poset.NonStrictOrder poset.NonStrictOrderIsPartialOrder

/--
The order relation packaged by a poset is transitive.

Logical form:

```lean
LRA.VolumeI.Relations.Transitive poset.NonStrictOrder
```
-/
theorem PosetOrderIsTransitive
    (poset : LRA.VolumeI.Order.Poset) :
    LRA.VolumeI.Relations.Transitive poset.NonStrictOrder :=
  LRA.VolumeI.Order.OrderedSets.PartialOrder.PartialOrderIsTransitive
    poset.NonStrictOrder poset.NonStrictOrderIsPartialOrder

end LRA.VolumeI.Order.OrderedSets.Poset
