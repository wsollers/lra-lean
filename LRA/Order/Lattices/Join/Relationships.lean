import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/--
`JoinOfConverseIffMeet` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha) (left right candidate : Alpha), LRA.Order.Join (LRA.Relation.Converse relation) left right candidate ↔ LRA.Order.Meet relation left right candidate

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    left right candidate : Alpha
  Prove
    LRA.Order.Join (LRA.Relation.Converse relation) left right candidate ↔ LRA.Order.Meet relation left right candidate

Logical form (Lean):

```lean
theorem JoinOfConverseIffMeet
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right candidate : Alpha) :
    Join (LRA.Relation.Converse relation) left right candidate ↔
      Meet relation left right candidate
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
theorem JoinOfConverseIffMeet
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right candidate : Alpha) :
    Join (LRA.Relation.Converse relation) left right candidate ↔
      Meet relation left right candidate := by
  sorry
end LRA.Order
