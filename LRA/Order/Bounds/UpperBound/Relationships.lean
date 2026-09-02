import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

/--
`UpperBoundOfConverseIffLowerBound` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), UpperBound (LRA.Relation.Converse relation) A x ↔ LowerBound relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (bound : Element), ∀ (element : Element), inst.1 subset element → relation bound element ↔ ∀ (element : Element), inst.1 subset element → relation bound element

Logical form (Lean):

```lean
theorem UpperBoundOfConverseIffLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    UpperBound (LRA.Relation.Converse relation) subset bound ↔
      LowerBound relation subset bound
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
theorem UpperBoundOfConverseIffLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    UpperBound (LRA.Relation.Converse relation) subset bound ↔
      LowerBound relation subset bound := by
  sorry
end LRA.Order
