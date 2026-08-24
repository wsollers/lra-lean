import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/--
`NonStrictPartialOrder` TODO

Predicate logic:

  abbrev NonStrictPartialOrder (Carrier : Type u) :=
  PartialOrderRelation Carrier

Predicate logic (unfolded):

  abbrev NonStrictPartialOrder (Carrier : Type u) :=
  PartialOrderRelation Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev NonStrictPartialOrder (Carrier : Type u) :=
  PartialOrderRelation Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev NonStrictPartialOrder (Carrier : Type u) :=
  PartialOrderRelation Carrier

end LRA.Order.OrderedSets.PartialOrder
