import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`Supremum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (supremum : Element), (LRA.Order.UpperBound relation subset supremum ∧ ∀ (bound : Element), LRA.Order.UpperBound relation subset bound → relation supremum bound)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (supremum : Element), (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)

Logical form (Lean):

```lean
def Supremum
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (supremum : Element) : Prop :=
  UpperBound relation subset supremum /\
    forall bound, UpperBound relation subset bound -> relation supremum bound
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def Supremum
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (supremum : Element) : Prop :=
  UpperBound relation subset supremum /\
    forall bound, UpperBound relation subset bound -> relation supremum bound

end LRA.Order
