import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrict

namespace LRA.Order.OrderedSets.PartialOrder

/--
`NaturalNumberNonStrictPartialOrder`

Statement: The usual `<=` relation on natural numbers is a non-strict partial order.

Logical form:

```lean
NonStrictPartialOrder Nat
```
-/
def NaturalNumberNonStrictPartialOrder :
    NonStrictPartialOrder Nat where
  relation := fun left right => left <= right
  relationIsPartialOrder := by
    sorry

/--
Statement: The relation packaged by `NaturalNumberNonStrictPartialOrder` satisfies the
partial-order laws.

Logical form:

```lean
LRA.Order.PartialOrder NaturalNumberNonStrictPartialOrder.relation
```
-/
example :
    LRA.Order.PartialOrder
      NaturalNumberNonStrictPartialOrder.relation := by
  sorry

/--
`BooleanEqualityNonStrictPartialOrder`

Statement: Equality on booleans is a non-strict partial order.

Logical form:

```lean
NonStrictPartialOrder Bool
```
-/
def BooleanEqualityNonStrictPartialOrder :
    NonStrictPartialOrder Bool where
  relation := fun left right => left = right
  relationIsPartialOrder := by
    sorry

/--
Statement: The relation packaged by `BooleanEqualityNonStrictPartialOrder` satisfies the
partial-order laws.

Logical form:

```lean
LRA.Order.PartialOrder BooleanEqualityNonStrictPartialOrder.relation
```
-/
example :
    LRA.Order.PartialOrder
      BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

/--
Statement: Divisibility on natural numbers is a partial order. The zero case is
included: if `0 ∣ b`, then `b = 0`, so antisymmetry still holds.

Logical form: `LRA.Order.PartialOrder (fun left right : Nat => left ∣ right)`.
-/
example :
    LRA.Order.PartialOrder
      (fun left right : Nat => left ∣ right) := by
  sorry

/--
Statement: Inclusion is a partial order on predicate subsets.

Logical form: `LRA.Order.PartialOrder (fun left right : Set Alpha => left ⊆ right)`.
-/
example (Alpha : Type u) :
    LRA.Order.PartialOrder
      (fun left right : Set Alpha => left ⊆ right) := by
  sorry

end LRA.Order.OrderedSets.PartialOrder
