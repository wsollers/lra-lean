import LRA.Order.Bounds.BoundedAbove.Definition
import LRA.Order.Bounds.Supremum.Definition

namespace LRA.Order

universe u v

/--
`LeastUpperBoundProperty` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), (Exists fun element => element ∈ subset ∧ LRA.Order.BoundedAbove relation subset) → Exists fun supremum => LRA.Order.Supremum relation subset supremum

Predicate logic (unfolded):

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject), (Exists fun element => inst.1 subset element ∧ Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) → Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)

Logical form (Lean):

```lean
def LeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedAbove relation subset ->
        exists supremum, Supremum relation subset supremum
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def LeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedAbove relation subset ->
        exists supremum, Supremum relation subset supremum

end LRA.Order
