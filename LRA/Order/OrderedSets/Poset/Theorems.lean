import LRA.Order.OrderedSets.Poset.Characterizations

namespace LRA.Order.OrderedSets.Poset

/--
`PosetElementRelatesToItself` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.Poset ∀ element ∈ poset.Carrier), poset.NonStrictOrder element element

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset) (element : poset.1), poset.2 element element

Logical form (Lean):

```lean
theorem PosetElementRelatesToItself
    (poset : LRA.Order.Poset)
    (element : poset.Carrier) :
    poset.NonStrictOrder element element
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
theorem PosetElementRelatesToItself
    (poset : LRA.Order.Poset)
    (element : poset.Carrier) :
    poset.NonStrictOrder element element := by
  sorry
/--
`PosetMutualOrderImpliesEqual` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.Poset ∀ left right ∈ poset.Carrier), left = right

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset) (left right : poset.1), (poset.2 left right ∧ poset.2 right left) → left = right

Logical form (Lean):

```lean
theorem PosetMutualOrderImpliesEqual
    (poset : LRA.Order.Poset)
    (left right : poset.Carrier)
    (leftBelowRight : poset.NonStrictOrder left right)
    (rightBelowLeft : poset.NonStrictOrder right left) :
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
theorem PosetMutualOrderImpliesEqual
    (poset : LRA.Order.Poset)
    (left right : poset.Carrier)
    (leftBelowRight : poset.NonStrictOrder left right)
    (rightBelowLeft : poset.NonStrictOrder right left) :
    left = right := by
  sorry
/--
`PosetOrderTrans` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.Poset ∀ first second third ∈ poset.Carrier), poset.NonStrictOrder first third

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset) (first second third : poset.1), (poset.2 first second ∧ poset.2 second third) → poset.2 first third

Logical form (Lean):

```lean
theorem PosetOrderTrans
    (poset : LRA.Order.Poset)
    (first second third : poset.Carrier)
    (firstBelowSecond : poset.NonStrictOrder first second)
    (secondBelowThird : poset.NonStrictOrder second third) :
    poset.NonStrictOrder first third
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
theorem PosetOrderTrans
    (poset : LRA.Order.Poset)
    (first second third : poset.Carrier)
    (firstBelowSecond : poset.NonStrictOrder first second)
    (secondBelowThird : poset.NonStrictOrder second third) :
    poset.NonStrictOrder first third := by
  sorry
end LRA.Order.OrderedSets.Poset
