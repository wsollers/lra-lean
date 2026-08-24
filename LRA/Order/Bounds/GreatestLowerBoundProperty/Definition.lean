import LRA.Order.Bounds.BoundedBelow.Definition
import LRA.Order.Bounds.Infimum.Definition

namespace LRA.Order

universe u v

/--
`GreatestLowerBoundProperty` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), (Exists fun element => element ∈ subset ∧ LRA.Order.BoundedBelow relation subset) → Exists fun infimum => LRA.Order.Infimum relation subset infimum

Predicate logic (unfolded):

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject), (Exists fun element => inst.1 subset element ∧ Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element) → Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)

Logical form (Lean):

```lean
def GreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedBelow relation subset ->
        exists infimum, Infimum relation subset infimum
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
def GreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedBelow relation subset ->
        exists infimum, Infimum relation subset infimum

end LRA.Order
