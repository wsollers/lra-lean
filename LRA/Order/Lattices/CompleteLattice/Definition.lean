import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u v

/--
`CompleteLattice` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element), (LRA.Order.PartialOrder relation ∧ ∀ (subset : SetObject), (Exists fun supremum => LRA.Order.Supremum relation subset supremum ∧ Exists fun infimum => LRA.Order.Infimum relation subset infimum))

Predicate logic (unfolded):

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : Element → Element → Prop), ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (subset : SetObject), (Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound) ∧ Exists fun infimum => (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)))

Logical form (Lean):

```lean
def CompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  PartialOrder relation /\
    forall subset : SetObject,
      (exists supremum, Supremum relation subset supremum) /\
        (exists infimum, Infimum relation subset infimum)
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
def CompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  PartialOrder relation /\
    forall subset : SetObject,
      (exists supremum, Supremum relation subset supremum) /\
        (exists infimum, Infimum relation subset infimum)

end LRA.Order
