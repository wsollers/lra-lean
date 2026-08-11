import LRA.VolumeI.Relations.Order.Density
import LRA.VolumeI.Relations.Order.Completeness
import LRA.VolumeI.Relations.Order.Directed

namespace LRA.VolumeI.Relations.Order

/--
Divisibility on natural numbers is a partial order.

Logical form:

```lean
theorem NaturalDivisibilityIsPartialOrder :
    PartialOrder (fun left right : Nat => left ∣ right)
```
-/
theorem NaturalDivisibilityIsPartialOrder :
    PartialOrder (fun left right : Nat => left ∣ right) := by
  sorry

/--
Divisibility on natural numbers is not total.

Logical form:

```lean
theorem NaturalDivisibilityIsNotTotal :
    Not (LRA.VolumeI.Relations.Total (fun left right : Nat => left ∣ right))
```
-/
theorem NaturalDivisibilityIsNotTotal :
    Not (LRA.VolumeI.Relations.Total (fun left right : Nat => left ∣ right)) := by
  sorry

/--
The usual integer order is total.

Logical form:

```lean
theorem IntegerOrderIsTotal :
    LRA.VolumeI.Relations.Total (fun left right : Int => left ≤ right)
```
-/
theorem IntegerOrderIsTotal :
    LRA.VolumeI.Relations.Total (fun left right : Int => left ≤ right) := by
  sorry

/--
The usual integer order is not dense.

Logical form:

```lean
theorem IntegerOrderIsNotDense :
    Not (LRA.VolumeI.Relations.Dense (fun left right : Int => left < right))
```
-/
theorem IntegerOrderIsNotDense :
    Not (LRA.VolumeI.Relations.Dense (fun left right : Int => left < right)) := by
  sorry

end LRA.VolumeI.Relations.Order
