import LRA.Order
import LRA.Set.Interop.Mathlib.PredicateSet

/-!
Worked order-theoretic instances at concrete carriers.

This is a quarantined leaf (§2.3, §6): no core `Definition`, `Theorems`,
`Characterizations`, `Consequences`, `Relationships`, or router may import
it. It is compiled from the test library instead.

Each section keeps the namespace it was stated in, so a predicate about
partial orders still lives under `LRA.Order.OrderedSets.PartialOrder`.
-/

universe u v w x

/-! ### Laws/OperationCompatibility -/

namespace LRA.Order

/-!
Positive examples of order-operation compatibility laws belong here.
-/

/-- Natural-number addition as a concrete relation-preservation example. -/
def NaturalAdditionForOrderCompatibility :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example - NaturalAdditionRightTranslationPreservesLessEqual]**

Adding the same natural number on the right preserves `<=`.
-/
theorem NaturalAdditionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalAdditionForOrderCompatibility := by
  intro left right fixed related
  exact Nat.add_le_add_right related fixed

/-- Natural-number truncated subtraction for an order-compatibility example. -/
def NaturalSubtractionForOrderCompatibilityExample :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right

/--
**[Example - NaturalSubtractionRightTranslationPreservesLessEqual]**

Subtracting the same natural number on the right preserves `<=`.
-/
theorem NaturalSubtractionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityExample := by
  intro left right fixed related
  exact Nat.sub_le_sub_right related fixed

end LRA.Order

/-! ### OrderedSets/PartialOrder -/

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

/-! ### OrderedSets/Poset -/

namespace LRA.Order.OrderedSets.Poset

/--
Statement: The usual non-strict order on natural numbers satisfies the
partial-order laws.

Logical form:

```lean
LRA.Order.PartialOrder (fun left right : Nat => left <= right)
```
-/
theorem NaturalNumberOrderIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Nat => left <= right) := by
  sorry

/--
`NaturalNumberPoset`

Statement: The natural numbers with their usual non-strict order form a poset.

Logical form:

```lean
LRA.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
```
-/
def NaturalNumberPoset : LRA.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
  NonStrictOrderIsPartialOrder := NaturalNumberOrderIsPartialOrder

/--
Statement: The relation packaged by `NaturalNumberPoset` satisfies the partial-order laws.

Logical form:

```lean
LRA.Order.PartialOrder NaturalNumberPoset.NonStrictOrder
```
-/
example :
    LRA.Order.PartialOrder NaturalNumberPoset.NonStrictOrder := by
  exact NaturalNumberPoset.NonStrictOrderIsPartialOrder

end LRA.Order.OrderedSets.Poset

/-! ### OrderedSets/Preorder -/

namespace LRA.Order.OrderedSets.Preorder

/--
Statement: The universal relation on booleans satisfies the preorder laws.

Logical form:

```lean
LRA.Order.Preorder (fun _ _ : Bool => True)
```
-/
theorem BooleanUniversalRelationIsPreorder :
    LRA.Order.Preorder (fun _ _ : Bool => True) := by
  sorry

/--
`BooleanUniversalPreorder`

Statement: The universal relation on booleans is a preorder.

Logical form:

```lean
PreorderRelation Bool
```
-/
def BooleanUniversalPreorder : PreorderRelation Bool where
  relation := fun _ _ => True
  isPreorder := BooleanUniversalRelationIsPreorder

/--
Statement: The packaged relation exposes the expected preorder proposition.

Logical form: `LRA.Order.Preorder BooleanUniversalPreorder.relation`.
-/
example : LRA.Order.Preorder BooleanUniversalPreorder.relation := by
  exact BooleanUniversalPreorder.isPreorder

end LRA.Order.OrderedSets.Preorder

/-! ### OrderedSets/StrictOrder -/

namespace LRA.Order.OrderedSets.StrictOrder

/--
Statement: The usual strict order on natural numbers satisfies the strict-order
laws.

Logical form:

```lean
LRA.Order.StrictOrder (fun left right : Nat => left < right)
```
-/
theorem NaturalNumberLessThanIsStrictOrder :
    LRA.Order.StrictOrder (fun left right : Nat => left < right) := by
  sorry

/--
`NaturalNumberStrictOrder`

Statement: The usual `<` relation on natural numbers is a strict order.

Logical form:

```lean
StrictOrderRelation Nat
```
-/
def NaturalNumberStrictOrder :
    StrictOrderRelation Nat where
  relation := fun left right => left < right
  relationIsStrictOrder := NaturalNumberLessThanIsStrictOrder

/--
Statement: The relation packaged by `NaturalNumberStrictOrder` satisfies the strict-order
laws.

Logical form:

```lean
LRA.Order.StrictOrder NaturalNumberStrictOrder.relation
```
-/
example :
    LRA.Order.StrictOrder NaturalNumberStrictOrder.relation := by
  exact NaturalNumberStrictOrder.relationIsStrictOrder

end LRA.Order.OrderedSets.StrictOrder
