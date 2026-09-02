import LRA.Order.OrderedSets.Poset.Characterizations

namespace LRA.Order.OrderedSets.Poset

/--
`PosetOrderIsPreorder` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.Poset), LRA.Order.Preorder poset.NonStrictOrder

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset), (∀ (x : poset.1), poset.2 x x ∧ ∀ (x y z : poset.1), poset.2 x y → poset.2 y z → poset.2 x z)

Logical form (Lean):

```lean
theorem PosetOrderIsPreorder
    (poset : LRA.Order.Poset) :
    LRA.Order.Preorder poset.NonStrictOrder
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
theorem PosetOrderIsPreorder
    (poset : LRA.Order.Poset) :
    LRA.Order.Preorder poset.NonStrictOrder := by
  sorry
end LRA.Order.OrderedSets.Poset
