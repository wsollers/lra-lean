import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/--
`JoinOfConverseIffMeet` TODO

Predicate logic:

  (∀ left right candidate ∈ Alpha), Join (LRA.Relation.Converse relation) left right candidate ↔ Meet relation left right candidate

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (left right candidate : Alpha), (relation candidate left ∧ (relation candidate right ∧ ∀ (upper : Alpha), relation upper left → relation upper right → relation upper candidate)) ↔ (relation candidate left ∧ (relation candidate right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower candidate))

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
