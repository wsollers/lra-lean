import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Relation.Interface.Operations.Converse.Definition

namespace LRA.Order

universe u v

/--
`MaximalElementOfConverseIffMinimalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), LRA.Order.MaximalElement (LRA.Relation.Converse strictRelation) subset candidate ↔ LRA.Order.MinimalElement strictRelation subset candidate

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    strictRelation : LRA.Relation.Endorelation Element
    subset : SetObject
    candidate : Element
  Prove
    LRA.Order.MaximalElement (LRA.Relation.Converse strictRelation) subset candidate ↔ LRA.Order.MinimalElement strictRelation subset candidate

Logical form (Lean):

```lean
theorem MaximalElementOfConverseIffMinimalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    MaximalElement (LRA.Relation.Converse strictRelation)
        subset candidate ↔
      MinimalElement strictRelation subset candidate
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
theorem MaximalElementOfConverseIffMinimalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    MaximalElement (LRA.Relation.Converse strictRelation)
        subset candidate ↔
      MinimalElement strictRelation subset candidate := by
  sorry
end LRA.Order
