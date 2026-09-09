import LRA.Order.OrderedSets.PartialOrder.Characterizations

namespace LRA.Order.OrderedSets.PartialOrder

/--
`NonStrictRelatesSelf` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier) (element : Carrier), order.relation element element

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    element : Carrier
  Prove
    order.1 element element

Logical form (Lean):

```lean
theorem NonStrictRelatesSelf
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (element : Carrier) :
    order.relation element element
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
theorem NonStrictRelatesSelf
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (element : Carrier) :
    order.relation element element := by
  sorry
/--
`NonStrictMutualRelationImpliesEqual` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier) (left right : Carrier), (order.relation left right ∧ order.relation right left) → left = right

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    left right : Carrier
    leftRelatedToRight : order.relation left right
    rightRelatedToLeft : order.relation right left
  Prove
    (order.1 left right ∧ order.1 right left) → left = right

Logical form (Lean):

```lean
theorem NonStrictMutualRelationImpliesEqual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right)
    (rightRelatedToLeft : order.relation right left) :
    left = right
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
theorem NonStrictMutualRelationImpliesEqual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right)
    (rightRelatedToLeft : order.relation right left) :
    left = right := by
  sorry
/--
`PartialOrderHasNoNontrivialTwoElementCycles` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier) (left right : Carrier), (order.relation left right ∧ order.relation right left) → left = right

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    left right : Carrier
    leftRelatedToRight : order.relation left right
    rightRelatedToLeft : order.relation right left
  Prove
    (order.1 left right ∧ order.1 right left) → left = right

Logical form (Lean):

```lean
theorem PartialOrderHasNoNontrivialTwoElementCycles
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right)
    (rightRelatedToLeft : order.relation right left) :
    left = right
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
theorem PartialOrderHasNoNontrivialTwoElementCycles
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right)
    (rightRelatedToLeft : order.relation right left) :
    left = right := by
  sorry
end LRA.Order.OrderedSets.PartialOrder
