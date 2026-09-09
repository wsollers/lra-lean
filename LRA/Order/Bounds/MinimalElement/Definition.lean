import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`MinimalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (minimum : Element), (minimum ∈ subset ∧ (∀ (element : Element), element ∈ subset → ¬ relation element minimum))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst.1 subset minimum ∧ (∀ (element : Element), inst.1 subset element → relation element minimum → False))

Logical form (Lean):

```lean
def MinimalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (minimum : Element) : Prop :=
  minimum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation element minimum
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
abbrev MinimalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  LRA.Relation.MinimalElement strictRelation subset minimal

end LRA.Order
