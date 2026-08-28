import LRA.Relation.Interface.Definitions

namespace LRA.Order.OrderedSets

universe u

/--
`OrderRelation` TODO

Predicate logic:

  abbrev OrderRelation (Carrier : Type u) :=
  LRA.Relation.Endorelation Carrier

Predicate logic (unfolded):

  abbrev OrderRelation (Carrier : Type u) :=
  LRA.Relation.Endorelation Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev OrderRelation (Carrier : Type u) :=
  LRA.Relation.Endorelation Carrier
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
abbrev OrderRelation (Carrier : Type u) :=
  LRA.Relation.Endorelation Carrier

end LRA.Order.OrderedSets
