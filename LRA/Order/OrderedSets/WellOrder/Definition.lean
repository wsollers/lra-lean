import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order

universe u v

/--
`WellOrder` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element), (LRA.Order.LinearOrder relation ∧ ∀ (subset : SetObject), (Exists fun element => element) ∈ subset → Exists fun least => LRA.Order.LeastElement relation subset least)

Predicate logic (unfolded):

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : Element → Element → Prop), (((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Element), Or (relation x y) (relation y x)) ∧ ∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun least => (inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → relation least element))

Logical form (Lean):

```lean
def WellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LinearOrder relation /\
    forall subset : SetObject,
      (exists element, element ∈ subset) ->
        exists least, LeastElement relation subset least
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def WellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LinearOrder relation /\
    forall subset : SetObject,
      (exists element, element ∈ subset) ->
        exists least, LeastElement relation subset least

end LRA.Order
