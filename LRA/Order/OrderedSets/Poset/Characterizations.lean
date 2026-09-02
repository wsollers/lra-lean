import LRA.Order.OrderedSets.PartialOrder.Characterizations
import LRA.Order.OrderedSets.Poset.Definition

namespace LRA.Order.OrderedSets.Poset

/--
`PosetOrderIsPartialOrder` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.Poset), LRA.Order.PartialOrder poset.NonStrictOrder

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset), (∀ (x : poset.1), poset.2 x x ∧ (∀ (x y : poset.1), poset.2 x y → poset.2 y x → x = y ∧ ∀ (x y z : poset.1), poset.2 x y → poset.2 y z → poset.2 x z))

Logical form (Lean):

```lean
theorem PosetOrderIsPartialOrder
    (poset : LRA.Order.Poset) :
    LRA.Order.PartialOrder poset.NonStrictOrder
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
theorem PosetOrderIsPartialOrder
    (poset : LRA.Order.Poset) :
    LRA.Order.PartialOrder poset.NonStrictOrder := by
  sorry
/--
`PosetOrderIsReflexive` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.Poset), LRA.Relation.Reflexive poset.NonStrictOrder

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset) (x : poset.1), poset.2 x x

Logical form (Lean):

```lean
theorem PosetOrderIsReflexive
    (poset : LRA.Order.Poset) :
    LRA.Relation.Reflexive poset.NonStrictOrder
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
theorem PosetOrderIsReflexive
    (poset : LRA.Order.Poset) :
    LRA.Relation.Reflexive poset.NonStrictOrder := by
  sorry
/--
`PosetOrderIsAntisymmetric` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.Poset), LRA.Relation.Antisymmetric poset.NonStrictOrder

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset) (x y : poset.1), (poset.2 x y ∧ poset.2 y x) → x = y

Logical form (Lean):

```lean
theorem PosetOrderIsAntisymmetric
    (poset : LRA.Order.Poset) :
    LRA.Relation.Antisymmetric poset.NonStrictOrder
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
theorem PosetOrderIsAntisymmetric
    (poset : LRA.Order.Poset) :
    LRA.Relation.Antisymmetric poset.NonStrictOrder := by
  sorry
/--
`PosetOrderIsTransitive` TODO

Predicate logic:

  (∀ poset ∈ LRA.Order.Poset), LRA.Relation.Transitive poset.NonStrictOrder

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset) (x y z : poset.1), (poset.2 x y ∧ poset.2 y z) → poset.2 x z

Logical form (Lean):

```lean
theorem PosetOrderIsTransitive
    (poset : LRA.Order.Poset) :
    LRA.Relation.Transitive poset.NonStrictOrder
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
theorem PosetOrderIsTransitive
    (poset : LRA.Order.Poset) :
    LRA.Relation.Transitive poset.NonStrictOrder := by
  sorry
end LRA.Order.OrderedSets.Poset
