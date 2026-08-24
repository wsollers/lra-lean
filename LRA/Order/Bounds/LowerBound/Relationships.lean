import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

/--
`LowerBoundOfConverseIffUpperBound` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), LowerBound (LRA.Relation.Converse relation) A x ↔ UpperBound relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (bound : Element), ∀ (element : Element), inst.1 subset element → relation element bound ↔ ∀ (element : Element), inst.1 subset element → relation element bound

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
