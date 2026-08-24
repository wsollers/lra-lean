import LRA.Order.Relation.Comparable.Definition

namespace LRA.Order

universe u v

/--
`Chain` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (first second : Element), (first ∈ subset ∧ second ∈ subset) → LRA.Order.Comparable relation first second

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (first second : Element), (inst.1 subset first ∧ inst.1 subset second) → Or (relation first second) (relation second first)

Logical form (Lean):

```lean
def Chain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall first second,
    first ∈ subset ->
      second ∈ subset ->
        Comparable relation first second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Chain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall first second,
    first ∈ subset ->
      second ∈ subset ->
        Comparable relation first second

end LRA.Order
