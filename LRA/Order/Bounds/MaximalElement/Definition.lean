import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`MaximalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (maximum : Element), (maximum ∈ subset ∧ (∀ (element : Element), element ∈ subset → ¬ relation maximum element))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst.1 subset maximum ∧ (∀ (element : Element), inst.1 subset element → relation maximum element → False))

Logical form (Lean):

```lean
def MaximalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (maximum : Element) : Prop :=
  maximum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation maximum element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev MaximalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (maximal : Element) : Prop :=
  LRA.Relation.MaximalElement strictRelation subset maximal

end LRA.Order
