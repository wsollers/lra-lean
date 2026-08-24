import LRA.Order.Bounds.LowerBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LeastElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (least : Element), (least ∈ subset ∧ LRA.Order.LowerBound relation subset least)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (least : Element), (inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → relation least element)

Logical form (Lean):

```lean
def LeastElement
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (least : Element) : Prop :=
  least ∈ subset /\ LowerBound relation subset least
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
def LeastElement
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (least : Element) : Prop :=
  least ∈ subset /\ LowerBound relation subset least

end LRA.Order
