import LRA.VolumeI.Order.Bounds.LeastElement.Relationships
import LRA.VolumeI.Order.Bounds.MinimalElement.MathlibAdapters

namespace LRA.Order

universe u

/--
`NonemptyFiniteSubsetHasLeastElement`

Statement: Every nonempty finite predicate subset of a linear order has a
least element.

Logical form: `Finite subset → (∃ x, x ∈ subset) → ∃ least, LeastElement relation subset least`.
-/
theorem NonemptyFiniteSubsetHasLeastElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists least, LeastElement relation subset least := by
  rcases NonemptyFiniteSubsetHasMinimalElement
      relationIsLinearOrder.1 subset subsetIsFinite subsetIsNonempty with
    ⟨least, leastIsMinimal⟩
  exact
    ⟨least,
      MinimalElementIsLeastInLinearOrder relationIsLinearOrder leastIsMinimal⟩

end LRA.Order
