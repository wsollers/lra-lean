import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`GreatestElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (greatest : Element), (greatest ∈ subset ∧ LRA.Order.UpperBound relation subset greatest)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (greatest : Element), (inst.1 subset greatest ∧ ∀ (element : Element), inst.1 subset element → relation element greatest)

Logical form (Lean):

```lean
def GreatestElement
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (greatest : Element) : Prop :=
  greatest ∈ subset /\ UpperBound relation subset greatest
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def GreatestElement
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (greatest : Element) : Prop :=
  greatest ∈ subset /\ UpperBound relation subset greatest

end LRA.Order
