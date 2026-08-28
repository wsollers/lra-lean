import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Relation.Interface.Operations.Converse.Definition

namespace LRA.Order

universe u v

/--
`MinimalElementOfConverseIffMaximalElement` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), MinimalElement (LRA.Relation.Converse strictRelation) A x ↔ MaximalElement strictRelation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation : Element → Element → Prop) (subset : SetObject) (candidate : Element), (inst.1 subset candidate ∧ ∀ (element : Element), inst.1 subset element → strictRelation candidate element → False) ↔ (inst.1 subset candidate ∧ ∀ (element : Element), inst.1 subset element → strictRelation candidate element → False)

Logical form (Lean):

```lean
theorem MinimalElementOfConverseIffMaximalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    MinimalElement (LRA.Relation.Converse strictRelation)
        subset candidate ↔
      MaximalElement strictRelation subset candidate
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
theorem MinimalElementOfConverseIffMaximalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    MinimalElement (LRA.Relation.Converse strictRelation)
        subset candidate ↔
      MaximalElement strictRelation subset candidate := by
  sorry

end LRA.Order
