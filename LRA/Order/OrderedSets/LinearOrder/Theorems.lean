import LRA.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order

universe u

/--
`TotalImpliesReflexive` TODO

Predicate logic:

  LRA.Relation.Reflexive relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x y : Alpha), Or (relation x y) (relation y x)) → ∀ (x : Alpha), relation x x

Logical form (Lean):

```lean
theorem TotalImpliesReflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsTotal : LRA.Relation.Total relation) :
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
theorem TotalImpliesReflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsTotal : LRA.Relation.Total relation) :
    LRA.Relation.Reflexive relation := by
  sorry
/--
`LinearOrderIsPartialOrder` TODO

Predicate logic:

  PartialOrder relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Alpha), Or (relation x y) (relation y x)) → (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z))

Logical form (Lean):

```lean
theorem LinearOrderIsPartialOrder
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    PartialOrder relation
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
theorem LinearOrderIsPartialOrder
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    PartialOrder relation := by
  sorry
/--
`LinearOrderIsTotal` TODO

Predicate logic:

  LRA.Relation.Total relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Alpha), Or (relation x y) (relation y x)) → ∀ (x y : Alpha), Or (relation x y) (relation y x)

Logical form (Lean):

```lean
theorem LinearOrderIsTotal
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    LRA.Relation.Total relation
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
theorem LinearOrderIsTotal
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    LRA.Relation.Total relation := by
  sorry
end LRA.Order
