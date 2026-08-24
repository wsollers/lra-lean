import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`MaximalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation : LRA.Relation.Endorelation Element) (subset : SetObject) (maximal : Element), (maximal ∈ subset ∧ ∀ (element : Element), element ∈ subset → ¬ strictRelation maximal element)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation : Element → Element → Prop) (subset : SetObject) (maximal : Element), (inst.1 subset maximal ∧ ∀ (element : Element), inst.1 subset element → strictRelation maximal element → False)

Logical form (Lean):

```lean
abbrev MaximalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (maximal : Element) : Prop :=
  LRA.Relation.MaximalElement strictRelation subset maximal
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
