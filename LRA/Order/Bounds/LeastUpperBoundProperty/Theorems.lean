import LRA.Order.Bounds.LeastUpperBoundProperty.Definition
import LRA.Order.Bounds.Supremum.Theorems

namespace LRA.Order

universe u v

/--
`LeastUpperBoundPropertyGivesUniqueSupremum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, (LRA.Relation.Antisymmetric relation ∧ LRA.Order.LeastUpperBoundProperty SetObject relation) → ∀ (subset : SetObject), (Exists fun element => element ∈ subset ∧ LRA.Order.BoundedAbove relation subset) → Exists fun supremum => (LRA.Order.Supremum relation subset supremum ∧ (∀ (other : Element), LRA.Order.Supremum relation subset other → other = supremum))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsAntisymmetric : LRA.Relation.Antisymmetric relation
    relationHasLeastUpperBounds : LeastUpperBoundProperty SetObject relation
    subset : SetObject
    subsetIsBoundedAbove : BoundedAbove relation subset
  Prove
    ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) → Exists fun supremum => ((∀ (element : Element), inst.1 subset element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)))) → ∀ (subset : SetObject), (Exists fun element => inst.1 subset element ∧ (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound)) → Exists fun supremum => (((∀ (element : Element), inst.1 subset element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)) ∧ (∀ (other : Element), ((∀ (element : Element), inst.1 subset element → relation element other) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation other bound)) → other = supremum))

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
