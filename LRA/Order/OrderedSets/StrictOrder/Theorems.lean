import LRA.Order.OrderedSets.StrictOrder.Characterizations

namespace LRA.Order.OrderedSets.StrictOrder

/--
`StrictOrderDoesNotRelateSelf` TODO

Predicate logic:

  (∀ element ∈ Carrier), Not (order.relation element element)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (element : Carrier), order.1 element element → False

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

  (∀ left right ∈ Carrier), Not (order.relation right left)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (left right : Carrier), (order.1 left right ∧ order.1 right left) → False

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
