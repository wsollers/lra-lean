import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`UpperBound` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (bound element : Element), element ∈ subset → relation element bound

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (bound element : Element), inst.1 subset element → relation element bound

Logical form (Lean):

```lean
def UpperBound
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation element bound
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
def UpperBound
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation element bound

end LRA.Order
