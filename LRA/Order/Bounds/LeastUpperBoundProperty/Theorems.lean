import LRA.Order.Bounds.LeastUpperBoundProperty.Definition
import LRA.Order.Bounds.Supremum.Theorems

namespace LRA.Order

universe u v

/--
`LeastUpperBoundPropertyGivesUniqueSupremum` TODO

Predicate logic:

  (∀ A ∈ U), (exists element, element ∈ A) → exists supremum, Supremum relation A supremum ∧ forall other, Supremum relation A other -> other = supremum

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) → Exists fun supremum => (∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)) → ∀ (subset : SetObject), (Exists fun element => inst.1 subset element ∧ Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) → Exists fun supremum => ((∀ (element : Element), inst.1 subset element → relation element supremum ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound) ∧ ∀ (other : Element), (∀ (element : Element), inst.1 subset element → relation element other ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation other bound) → other = supremum)

Logical form (Lean):

```lean
theorem LeastUpperBoundPropertyGivesUniqueSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    (relationHasLeastUpperBounds :
      LeastUpperBoundProperty SetObject relation)
    (subset : SetObject)
    (subsetIsNonempty : exists element, element ∈ subset)
    (subsetIsBoundedAbove : BoundedAbove relation subset) :
    exists supremum,
      Supremum relation subset supremum /\
        forall other,
          Supremum relation subset other -> other = supremum
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem LeastUpperBoundPropertyGivesUniqueSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    (relationHasLeastUpperBounds :
      LeastUpperBoundProperty SetObject relation)
    (subset : SetObject)
    (subsetIsNonempty : exists element, element ∈ subset)
    (subsetIsBoundedAbove : BoundedAbove relation subset) :
    exists supremum,
      Supremum relation subset supremum /\
        forall other,
          Supremum relation subset other -> other = supremum := by
  sorry

end LRA.Order
