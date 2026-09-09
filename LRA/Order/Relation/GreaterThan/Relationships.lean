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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Order.PartialOrder (LRA.Order.GreaterThan relation) ↔ LRA.Order.PartialOrder relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
  Prove
    LRA.Order.PartialOrder (LRA.Order.GreaterThan relation) ↔ LRA.Order.PartialOrder relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Order.StrictOrder (LRA.Order.GreaterThan relation) ↔ LRA.Order.StrictOrder relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
  Prove
    LRA.Order.StrictOrder (LRA.Order.GreaterThan relation) ↔ LRA.Order.StrictOrder relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Order.LinearOrder (LRA.Order.GreaterThan relation) ↔ LRA.Order.LinearOrder relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
  Prove
    LRA.Order.LinearOrder (LRA.Order.GreaterThan relation) ↔ LRA.Order.LinearOrder relation

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Order.StrictLinearOrder (LRA.Order.GreaterThan relation) ↔ LRA.Order.StrictLinearOrder relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
  Prove
    LRA.Order.StrictLinearOrder (LRA.Order.GreaterThan relation) ↔ LRA.Order.StrictLinearOrder relation

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
