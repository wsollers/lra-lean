import LRA.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order.OrderedSets.StrictOrder

/--
`StrictOrderIsIrreflexive` TODO

Predicate logic:

  LRA.Relation.Irreflexive relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop), (∀ (x : Carrier), relation x x → False ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z) → ∀ (x : Carrier), relation x x → False

Logical form (Lean):

```lean
theorem StrictOrderIsIrreflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Irreflexive relation
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
theorem StrictOrderIsIrreflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Irreflexive relation := by
  sorry
/--
`StrictOrderIsTransitive` TODO

Predicate logic:

  LRA.Relation.Transitive relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop), (∀ (x : Carrier), relation x x → False ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z) → ∀ (x y z : Carrier), (relation x y ∧ relation y z) → relation x z

Logical form (Lean):

```lean
theorem StrictOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Transitive relation
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
theorem StrictOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Transitive relation := by
  sorry
/--
`StrictOrderIsAsymmetric` TODO

Predicate logic:

  LRA.Relation.Asymmetric relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop), (∀ (x : Carrier), relation x x → False ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z) → ∀ (x y : Carrier), (relation x y ∧ relation y x) → False

Logical form (Lean):

```lean
theorem StrictOrderIsAsymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Asymmetric relation
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
theorem StrictOrderIsAsymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Asymmetric relation := by
  sorry
/--
`StrictOrderIsAntisymmetric` TODO

Predicate logic:

  LRA.Relation.Antisymmetric relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop), (∀ (x : Carrier), relation x x → False ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z) → ∀ (x y : Carrier), (relation x y ∧ relation y x) → x = y

Logical form (Lean):

```lean
theorem StrictOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Antisymmetric relation
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
theorem StrictOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Antisymmetric relation := by
  sorry
/--
`StrictOrderRelationIsIrreflexive` TODO

Predicate logic:

  LRA.Relation.Irreflexive order.relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (x : Carrier), order.1 x x → False

Logical form (Lean):

```lean
theorem StrictOrderRelationIsIrreflexive
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Relation.Irreflexive order.relation
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
theorem StrictOrderRelationIsIrreflexive
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Relation.Irreflexive order.relation := by
  sorry
end LRA.Order.OrderedSets.StrictOrder
