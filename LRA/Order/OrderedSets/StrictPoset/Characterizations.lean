import LRA.Order.OrderedSets.StrictOrder.Characterizations
import LRA.Order.OrderedSets.StrictPoset.Definition

namespace LRA.Order.OrderedSets.StrictPoset

/--
`StrictPosetRelationIsStrictOrder` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.StrictPoset), LRA.Order.StrictOrder poset.StrictRelation

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.StrictPoset), (∀ (x : poset.1), poset.2 x x → False ∧ ∀ (x y z : poset.1), poset.2 x y → poset.2 y z → poset.2 x z)

Logical form (Lean):

```lean
theorem StrictPosetRelationIsStrictOrder
    (poset : LRA.Order.StrictPoset) :
    LRA.Order.StrictOrder poset.StrictRelation
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
theorem StrictPosetRelationIsStrictOrder
    (poset : LRA.Order.StrictPoset) :
    LRA.Order.StrictOrder poset.StrictRelation := by
  sorry

/--
`StrictPosetRelationIsIrreflexive` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.StrictPoset), LRA.Relation.Irreflexive poset.StrictRelation

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.StrictPoset) (x : poset.1), poset.2 x x → False

Logical form (Lean):

```lean
theorem StrictPosetRelationIsIrreflexive
    (poset : LRA.Order.StrictPoset) :
    LRA.Relation.Irreflexive poset.StrictRelation
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
theorem StrictPosetRelationIsIrreflexive
    (poset : LRA.Order.StrictPoset) :
    LRA.Relation.Irreflexive poset.StrictRelation := by
  sorry

/--
`StrictPosetRelationIsTransitive` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.StrictPoset), LRA.Relation.Transitive poset.StrictRelation

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.StrictPoset) (x y z : poset.1), (poset.2 x y ∧ poset.2 y z) → poset.2 x z

Logical form (Lean):

```lean
theorem StrictPosetRelationIsTransitive
    (poset : LRA.Order.StrictPoset) :
    LRA.Relation.Transitive poset.StrictRelation
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
theorem StrictPosetRelationIsTransitive
    (poset : LRA.Order.StrictPoset) :
    LRA.Relation.Transitive poset.StrictRelation := by
  sorry

end LRA.Order.OrderedSets.StrictPoset
