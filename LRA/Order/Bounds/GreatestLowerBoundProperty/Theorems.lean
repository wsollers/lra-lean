import LRA.Order.Bounds.GreatestLowerBoundProperty.Definition
import LRA.Order.Bounds.Infimum.Theorems

namespace LRA.Order

universe u v

/--
`GreatestLowerBoundPropertyGivesUniqueInfimum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, (LRA.Relation.Antisymmetric relation ∧ LRA.Order.GreatestLowerBoundProperty SetObject relation) → ∀ (subset : SetObject), (Exists fun element => element ∈ subset ∧ LRA.Order.BoundedBelow relation subset) → Exists fun infimum => (LRA.Order.Infimum relation subset infimum ∧ (∀ (other : Element), LRA.Order.Infimum relation subset other → other = infimum))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsAntisymmetric : LRA.Relation.Antisymmetric relation
    relationHasGreatestLowerBounds : GreatestLowerBoundProperty SetObject relation
    subset : SetObject
    subsetIsBoundedBelow : BoundedBelow relation subset
  Prove
    ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element) → Exists fun infimum => ((∀ (element : Element), inst.1 subset element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)))) → ∀ (subset : SetObject), (Exists fun element => inst.1 subset element ∧ (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element)) → Exists fun infimum => (((∀ (element : Element), inst.1 subset element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)) ∧ (∀ (other : Element), ((∀ (element : Element), inst.1 subset element → relation other element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound other)) → other = infimum))

Logical form (Lean):

```lean
theorem GreatestLowerBoundPropertyGivesUniqueInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    (relationHasGreatestLowerBounds :
      GreatestLowerBoundProperty SetObject relation)
    (subset : SetObject)
    (subsetIsNonempty : exists element, element ∈ subset)
    (subsetIsBoundedBelow : BoundedBelow relation subset) :
    exists infimum,
      Infimum relation subset infimum /\
        forall other,
          Infimum relation subset other -> other = infimum
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
theorem GreatestLowerBoundPropertyGivesUniqueInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    (relationHasGreatestLowerBounds :
      GreatestLowerBoundProperty SetObject relation)
    (subset : SetObject)
    (subsetIsNonempty : exists element, element ∈ subset)
    (subsetIsBoundedBelow : BoundedBelow relation subset) :
    exists infimum,
      Infimum relation subset infimum /\
        forall other,
          Infimum relation subset other -> other = infimum := by
  sorry
end LRA.Order
