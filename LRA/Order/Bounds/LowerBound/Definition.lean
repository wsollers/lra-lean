import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LowerBound` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (bound element : Element), element ∈ subset → relation bound element

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (bound element : Element), inst.1 subset element → relation bound element

Logical form (Lean):

```lean
def LowerBound
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation bound element
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
def LowerBound
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation bound element

end LRA.Order
