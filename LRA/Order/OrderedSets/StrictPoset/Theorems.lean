import LRA.Order.OrderedSets.StrictPoset.Characterizations

namespace LRA.Order.OrderedSets.StrictPoset

/--
`StrictPosetDoesNotRelateSelf` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.StrictPoset ∀ element ∈ poset.Carrier), Not (poset.StrictRelation element element)

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.StrictPoset) (element : poset.1), poset.2 element element → False

Logical form (Lean):

```lean
theorem StrictPosetDoesNotRelateSelf
    (poset : LRA.Order.StrictPoset)
    (element : poset.Carrier) :
    Not (poset.StrictRelation element element)
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
theorem StrictPosetDoesNotRelateSelf
    (poset : LRA.Order.StrictPoset)
    (element : poset.Carrier) :
    Not (poset.StrictRelation element element) := by
  sorry

end LRA.Order.OrderedSets.StrictPoset
