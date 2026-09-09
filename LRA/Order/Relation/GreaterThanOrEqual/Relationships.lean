import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Relation.GreaterThanOrEqual.Definition
import LRA.Order.Relation.LessThanOrEqual.Definition

namespace LRA.Order

universe u

/--
`GreaterThanOrEqualIsConverseOfLessThanOrEqual` TODO

Predicate logic:

  ∀ {Alpha : Type u} (strictRelation : LRA.Relation.Endorelation Alpha), LRA.Order.GreaterThanOrEqual strictRelation = LRA.Relation.Converse (LRA.Order.LessThanOrEqual strictRelation)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    strictRelation : LRA.Relation.Endorelation Alpha
  Prove
    fun left right => Or (strictRelation right left) (left = right) = funy x => Or (strictRelation x y) (x = y)

Logical form (Lean):

```lean
theorem GreaterThanOrEqualIsConverseOfLessThanOrEqual
    {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha) :
    GreaterThanOrEqual strictRelation =
      LRA.Relation.Converse (LessThanOrEqual strictRelation)
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
theorem GreaterThanOrEqualIsConverseOfLessThanOrEqual
    {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha) :
    GreaterThanOrEqual strictRelation =
      LRA.Relation.Converse (LessThanOrEqual strictRelation) := by
  sorry
end LRA.Order
