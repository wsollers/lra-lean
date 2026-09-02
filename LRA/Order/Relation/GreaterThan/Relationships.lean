import LRA.Order.Relation.GreaterThan.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition
import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/--
`GreaterThanIsPartialOrderIff` TODO

Predicate logic:

  PartialOrder (GreaterThan relation) ↔ PartialOrder relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation y x → relation x y → x = y ∧ ∀ (x y z : Alpha), relation y x → relation z y → relation z x)) ↔ (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z))

Logical form (Lean):

```lean
theorem GreaterThanIsPartialOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    PartialOrder (GreaterThan relation) ↔ PartialOrder relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem GreaterThanIsPartialOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    PartialOrder (GreaterThan relation) ↔ PartialOrder relation := by
  sorry
/--
`GreaterThanIsStrictOrderIff` TODO

Predicate logic:

  StrictOrder (GreaterThan relation) ↔ StrictOrder relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), (∀ (x : Alpha), relation x x → False ∧ ∀ (x y z : Alpha), relation y x → relation z y → relation z x) ↔ (∀ (x : Alpha), relation x x → False ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)

Logical form (Lean):

```lean
theorem GreaterThanIsStrictOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    StrictOrder (GreaterThan relation) ↔ StrictOrder relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem GreaterThanIsStrictOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    StrictOrder (GreaterThan relation) ↔ StrictOrder relation := by
  sorry
/--
`GreaterThanIsLinearOrderIff` TODO

Predicate logic:

  LinearOrder (GreaterThan relation) ↔ LinearOrder relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation y x → relation x y → x = y ∧ ∀ (x y z : Alpha), relation y x → relation z y → relation z x)) ∧ ∀ (x y : Alpha), Or (relation y x) (relation x y)) ↔ ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Alpha), Or (relation x y) (relation y x))

Logical form (Lean):

```lean
theorem GreaterThanIsLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    LinearOrder (GreaterThan relation) ↔ LinearOrder relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem GreaterThanIsLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    LinearOrder (GreaterThan relation) ↔ LinearOrder relation := by
  sorry
/--
`GreaterThanIsStrictLinearOrderIff` TODO

Predicate logic:

  StrictLinearOrder (GreaterThan relation) ↔ StrictLinearOrder relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ((∀ (x : Alpha), relation x x → False ∧ ∀ (x y z : Alpha), relation y x → relation z y → relation z x) ∧ ∀ (x y : Alpha), Or ((relation y x ∧ (x = y → False ∧ relation x y → False))) (Or ((x = y ∧ (relation y x → False ∧ relation x y → False))) ((relation x y ∧ (relation y x → False ∧ x = y → False))))) ↔ ((∀ (x : Alpha), relation x x → False ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z) ∧ ∀ (x y : Alpha), Or ((relation x y ∧ (x = y → False ∧ relation y x → False))) (Or ((x = y ∧ (relation x y → False ∧ relation y x → False))) ((relation y x ∧ (relation x y → False ∧ x = y → False)))))

Logical form (Lean):

```lean
theorem GreaterThanIsStrictLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    StrictLinearOrder (GreaterThan relation) ↔ StrictLinearOrder relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem GreaterThanIsStrictLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    StrictLinearOrder (GreaterThan relation) ↔ StrictLinearOrder relation := by
  sorry
end LRA.Order
