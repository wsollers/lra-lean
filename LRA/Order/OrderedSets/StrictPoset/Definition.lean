import LRA.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order

universe u

/--
`StrictPoset` TODO

Predicate logic:

  structure StrictPoset where
  Carrier : Type u
  StrictRelation : LRA.Relation.Endorelation Carrier
  StrictRelationIsStrictOrder : LRA.Order.StrictOrder StrictRelation

Predicate logic (unfolded):

  structure StrictPoset where
  Carrier : Type u
  StrictRelation : LRA.Relation.Endorelation Carrier
  StrictRelationIsStrictOrder : LRA.Order.StrictOrder StrictRelation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure StrictPoset where
  Carrier : Type u
  StrictRelation : LRA.Relation.Endorelation Carrier
  StrictRelationIsStrictOrder : LRA.Order.StrictOrder StrictRelation
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
structure StrictPoset where
  Carrier : Type u
  StrictRelation : LRA.Relation.Endorelation Carrier
  StrictRelationIsStrictOrder : LRA.Order.StrictOrder StrictRelation

end LRA.Order
