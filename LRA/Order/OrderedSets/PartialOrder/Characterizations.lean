import LRA.Order.OrderedSets.PartialOrder.NonStrict

namespace LRA.Order.OrderedSets.PartialOrder

/--
`PartialOrderIsReflexive` TODO

Predicate logic:

  LRA.Relation.Reflexive relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop), (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ (x : Carrier), relation x x

Logical form (Lean):

```lean
theorem PartialOrderIsReflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Reflexive relation
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
theorem PartialOrderIsReflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Reflexive relation := by
  sorry

/--
`PartialOrderIsAntisymmetric` TODO

Predicate logic:

  LRA.Relation.Antisymmetric relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop), (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ (x y : Carrier), (relation x y ∧ relation y x) → x = y

Logical form (Lean):

```lean
theorem PartialOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
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
theorem PartialOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Antisymmetric relation := by
  sorry

/--
`PartialOrderIsTransitive` TODO

Predicate logic:

  LRA.Relation.Transitive relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop), (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → ∀ (x y z : Carrier), (relation x y ∧ relation y z) → relation x z

Logical form (Lean):

```lean
theorem PartialOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
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
theorem PartialOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Transitive relation := by
  sorry

/--
`PartialOrderRelationIsReflexive` TODO

Predicate logic:

  LRA.Relation.Reflexive order.relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.PartialOrderRelation Carrier) (x : Carrier), order.1 x x

Logical form (Lean):

```lean
theorem PartialOrderRelationIsReflexive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Reflexive order.relation
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
theorem PartialOrderRelationIsReflexive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Reflexive order.relation := by
  sorry

/--
`PartialOrderRelationIsAntisymmetric` TODO

Predicate logic:

  LRA.Relation.Antisymmetric order.relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.PartialOrderRelation Carrier) (x y : Carrier), (order.1 x y ∧ order.1 y x) → x = y

Logical form (Lean):

```lean
theorem PartialOrderRelationIsAntisymmetric
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Antisymmetric order.relation
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
theorem PartialOrderRelationIsAntisymmetric
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Antisymmetric order.relation := by
  sorry

/--
`PartialOrderRelationIsTransitive` TODO

Predicate logic:

  LRA.Relation.Transitive order.relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.PartialOrderRelation Carrier) (x y z : Carrier), (order.1 x y ∧ order.1 y z) → order.1 x z

Logical form (Lean):

```lean
theorem PartialOrderRelationIsTransitive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Transitive order.relation
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
theorem PartialOrderRelationIsTransitive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Transitive order.relation := by
  sorry

end LRA.Order.OrderedSets.PartialOrder
