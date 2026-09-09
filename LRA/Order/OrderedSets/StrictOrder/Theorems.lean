import LRA.Order.OrderedSets.StrictOrder.Characterizations

namespace LRA.Order.OrderedSets.StrictOrder

/--
`StrictOrderDoesNotRelateSelf` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (element : Carrier), ¬ order.relation element element

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    order : StrictOrderRelation Carrier
    element : Carrier
  Prove
    order.1 element element → False

Logical form (Lean):

```lean
theorem StrictOrderDoesNotRelateSelf
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (element : Carrier) :
    Not (order.relation element element)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem StrictOrderDoesNotRelateSelf
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (element : Carrier) :
    Not (order.relation element element) := by
  sorry
/--
`StrictOrderHasNoTwoElementCycles` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (left right : Carrier), order.relation left right → ¬ order.relation right left

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    order : StrictOrderRelation Carrier
    left right : Carrier
    leftRelatedToRight : order.relation left right
  Prove
    (order.1 left right ∧ order.1 right left) → False

Logical form (Lean):

```lean
theorem StrictOrderHasNoTwoElementCycles
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right) :
    Not (order.relation right left)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem StrictOrderHasNoTwoElementCycles
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right) :
    Not (order.relation right left) := by
  sorry
end LRA.Order.OrderedSets.StrictOrder
