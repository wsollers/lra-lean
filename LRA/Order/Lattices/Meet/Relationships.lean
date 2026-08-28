import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/--
`MeetOfConverseIffJoin` TODO

Predicate logic:

  (∀ left right candidate ∈ Alpha), Meet (LRA.Relation.Converse relation) left right candidate ↔ Join relation left right candidate

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (left right candidate : Alpha), (relation left candidate ∧ (relation right candidate ∧ ∀ (lower : Alpha), relation left lower → relation right lower → relation candidate lower)) ↔ (relation left candidate ∧ (relation right candidate ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation candidate upper))

Logical form (Lean):

```lean
theorem MeetOfConverseIffJoin
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right candidate : Alpha) :
    Meet (LRA.Relation.Converse relation) left right candidate ↔
      Join relation left right candidate
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
theorem MeetOfConverseIffJoin
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right candidate : Alpha) :
    Meet (LRA.Relation.Converse relation) left right candidate ↔
      Join relation left right candidate := by
  sorry

end LRA.Order
