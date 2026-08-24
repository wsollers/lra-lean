import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/--
`Poset` TODO

Predicate logic:

  structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.Relation.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.Order.PartialOrder NonStrictOrder

Predicate logic (unfolded):

  structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.Relation.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.Order.PartialOrder NonStrictOrder (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.Relation.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.Order.PartialOrder NonStrictOrder
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
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.Relation.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.Order.PartialOrder NonStrictOrder

end LRA.Order
