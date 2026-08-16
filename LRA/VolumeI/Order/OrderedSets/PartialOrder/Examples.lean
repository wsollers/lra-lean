import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrict

namespace LRA.Order.OrderedSets.PartialOrder

/--
**[Theorem — Natural Number Less Equal Is Partial Order]** The usual `≤`
relation on natural numbers satisfies the partial-order laws.

Logical form:

```lean
LRA.Order.PartialOrder (fun left right : Nat => left <= right)
```
-/
theorem NaturalNumberLessEqualIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Nat => left <= right) := by
  constructor
  · intro element
    exact Nat.le_refl element
  · constructor
    · intro left right left_le_right right_le_left
      exact Nat.le_antisymm left_le_right right_le_left
    · intro left middle right left_le_middle middle_le_right
      exact Nat.le_trans left_le_middle middle_le_right

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
  relationIsPartialOrder := NaturalNumberLessEqualIsPartialOrder

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
  exact NaturalNumberNonStrictPartialOrder.relationIsPartialOrder

/--
**[Theorem — Boolean Equality Is Partial Order]** Equality on booleans
satisfies the partial-order laws.

Logical form:

```lean
LRA.Order.PartialOrder (fun left right : Bool => left = right)
```
-/
theorem BooleanEqualityIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Bool => left = right) := by
  constructor
  · intro element
    rfl
  · constructor
    · intro left right left_eq_right _right_eq_left
      exact left_eq_right
    · intro left middle right left_eq_middle middle_eq_right
      exact Eq.trans left_eq_middle middle_eq_right

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
  relationIsPartialOrder := BooleanEqualityIsPartialOrder

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
  exact BooleanEqualityNonStrictPartialOrder.relationIsPartialOrder

/--
Statement: Divisibility on natural numbers is a partial order. The zero case is
included: if `0 ∣ b`, then `b = 0`, so antisymmetry still holds.

Logical form: `LRA.Order.PartialOrder (fun left right : Nat => left ∣ right)`.
-/
theorem DivisibilityIsPartialOrder :
    LRA.Order.PartialOrder
      (fun left right : Nat => left ∣ right) := by
  sorry

/--
Statement: Inclusion is a partial order on predicate subsets.

Logical form: `LRA.Order.PartialOrder (fun left right : Set Alpha => left ⊆ right)`.
-/
theorem PredicateSetInclusionIsPartialOrder (Alpha : Type u) :
    LRA.Order.PartialOrder
      (fun left right : Set Alpha => left ⊆ right) := by
  sorry

end LRA.Order.OrderedSets.PartialOrder
