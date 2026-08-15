import LRA.VolumeI.Order.Bounds.GreatestElement.Relationships
import LRA.VolumeI.Order.Bounds.MaximalElement.MathlibAdapters

namespace LRA.Order

universe u

/--
`NonemptyFiniteSubsetHasGreatestElement`

Statement: Every nonempty finite predicate subset of a linear order has a
greatest element.

Logical form: `Finite subset → (∃ x, x ∈ subset) → ∃ greatest, GreatestElement relation subset greatest`.
-/
theorem NonemptyFiniteSubsetHasGreatestElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists greatest, GreatestElement relation subset greatest := by
  rcases NonemptyFiniteSubsetHasMaximalElement
      relationIsLinearOrder.1 subset subsetIsFinite subsetIsNonempty with
    ⟨greatest, greatestIsMaximal⟩
  exact
    ⟨greatest,
      MaximalElementIsGreatestInLinearOrder
        relationIsLinearOrder greatestIsMaximal⟩

end LRA.Order
