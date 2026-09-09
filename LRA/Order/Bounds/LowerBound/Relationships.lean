import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

/--
`LowerBoundOfConverseIffUpperBound` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (bound : Element), LRA.Order.LowerBound (LRA.Relation.Converse relation) subset bound ↔ LRA.Order.UpperBound relation subset bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    bound : Element
  Prove
    LRA.Order.LowerBound (LRA.Relation.Converse relation) subset bound ↔ LRA.Order.UpperBound relation subset bound

Logical form (Lean):

```lean
theorem LowerBoundOfConverseIffUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    LowerBound (LRA.Relation.Converse relation) subset bound ↔
      UpperBound relation subset bound
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
theorem LowerBoundOfConverseIffUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    LowerBound (LRA.Relation.Converse relation) subset bound ↔
      UpperBound relation subset bound := by
  sorry
end LRA.Order
