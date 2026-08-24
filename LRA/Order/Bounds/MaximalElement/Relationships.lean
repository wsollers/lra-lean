import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order

universe u v

/--
`MaximalElementOfConverseIffMinimalElement` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), MaximalElement (LRA.Relation.Converse strictRelation) A x ↔ MinimalElement strictRelation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation : Element → Element → Prop) (subset : SetObject) (candidate : Element), (inst.1 subset candidate ∧ ∀ (element : Element), inst.1 subset element → strictRelation element candidate → False) ↔ (inst.1 subset candidate ∧ ∀ (element : Element), inst.1 subset element → strictRelation element candidate → False)

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
