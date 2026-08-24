import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`MinimalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation : LRA.Relation.Endorelation Element) (subset : SetObject) (minimal : Element), (minimal ∈ subset ∧ ∀ (element : Element), element ∈ subset → ¬ strictRelation element minimal)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation : Element → Element → Prop) (subset : SetObject) (minimal : Element), (inst.1 subset minimal ∧ ∀ (element : Element), inst.1 subset element → strictRelation element minimal → False)

Logical form (Lean):

```lean
abbrev MinimalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  LRA.Relation.MinimalElement strictRelation subset minimal
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
