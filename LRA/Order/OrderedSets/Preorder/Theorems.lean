import LRA.Order.OrderedSets.Preorder.Characterizations

namespace LRA.Order.OrderedSets.Preorder

/--
`PreorderRelatesSelf` TODO

Predicate logic:

  (∀ element ∈ Carrier), preorder.relation element element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (element : Carrier), preorder.1 element element

Logical form (Lean):

```lean
theorem PreorderRelatesSelf
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier)
    (element : Carrier) :
    preorder.relation element element
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
theorem PreorderRelatesSelf
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier)
    (element : Carrier) :
    preorder.relation element element := by
  sorry
end LRA.Order.OrderedSets.Preorder
