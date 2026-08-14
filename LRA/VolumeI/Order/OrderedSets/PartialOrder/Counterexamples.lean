import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples
import LRA.VolumeI.Order.OrderedSets.PartialOrder.FailureModes

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

/--
The immediate-successor-or-equality relation on natural numbers.

Logical form:

```lean
fun left right : Nat => left = right \/ right = left + 1
```
-/
def ImmediateSuccessorOrEqualRelation : Relation Nat :=
  fun left right => left = right \/ right = left + 1

/--
The usual strict order on natural numbers is not a non-strict partial order,
because it is not reflexive.

Logical form:

```lean
FailsNonStrictPartialOrder (fun left right : Nat => left < right)
```
-/
theorem NatStrictOrderFailsNonStrictPartialOrder :
    FailsNonStrictPartialOrder (fun left right : Nat => left < right) := by
  intro strictOrderIsNonStrictPartialOrder
  exact Nat.lt_irrefl 0 (strictOrderIsNonStrictPartialOrder.1 0)

/--
The usual non-strict order on natural numbers is not a strict partial order,
because it is not irreflexive.

Logical form:

```lean
FailsStrictPartialOrder (fun left right : Nat => left <= right)
```
-/
theorem NatNonStrictOrderFailsStrictPartialOrder :
    FailsStrictPartialOrder (fun left right : Nat => left <= right) := by
  intro nonStrictOrderIsStrictPartialOrder
  exact nonStrictOrderIsStrictPartialOrder.1 0 (Nat.le_refl 0)

/--
The immediate-successor-or-equality relation is not transitive.

Logical form:

```lean
FailsTransitivity ImmediateSuccessorOrEqualRelation
```
-/
theorem ImmediateSuccessorOrEqualFailsTransitivity :
    FailsTransitivity ImmediateSuccessorOrEqualRelation := by
  intro immediateSuccessorOrEqualIsTransitive
  have zeroRelatedToOne :
      ImmediateSuccessorOrEqualRelation 0 1 :=
    Or.inr rfl
  have oneRelatedToTwo :
      ImmediateSuccessorOrEqualRelation 1 2 :=
    Or.inr rfl
  have zeroRelatedToTwo :
      ImmediateSuccessorOrEqualRelation 0 2 :=
    immediateSuccessorOrEqualIsTransitive 0 1 2
      zeroRelatedToOne oneRelatedToTwo
  cases zeroRelatedToTwo with
  | inl zeroEqualsTwo =>
      cases zeroEqualsTwo
  | inr twoEqualsOne =>
      cases twoEqualsOne

/--
The universal relation on booleans is not a non-strict partial order, because
it is not antisymmetric.

Logical form:

```lean
FailsNonStrictPartialOrder (fun _ _ : Bool => True)
```
-/
theorem BooleanUniversalRelationFailsNonStrictPartialOrder :
    FailsNonStrictPartialOrder (fun _ _ : Bool => True) := by
  intro universalRelationIsPartialOrder
  have trueEqualsFalse : true = false :=
    universalRelationIsPartialOrder.2.1 true false trivial trivial
  cases trueEqualsFalse

/--
Equality on booleans is a partial order but not a total order.

Logical form:

```lean
FailsTotality BooleanEqualityNonStrictPartialOrder.relation
```
-/
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality BooleanEqualityNonStrictPartialOrder.relation := by
  intro equalityRelationIsTotal
  cases equalityRelationIsTotal true false with
  | inl trueEqualsFalse =>
      cases trueEqualsFalse
  | inr falseEqualsTrue =>
      cases falseEqualsTrue

end LRA.VolumeI.Order.OrderedSets.PartialOrder
