import LRA.Order.Bounds.GreatestElement.Relationships
import LRA.Order.Bounds.LeastElement.Relationships
import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Order.Lattices.CompleteLattice.Definition
import LRA.Order.Lattices.Lattice.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.OrderedSets.WellOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Set.Interop.Mathlib.PredicateSet
import Mathlib.Data.Finite.Defs
import Mathlib.Data.Set.Finite.Basic

/-!
Mathlib adapters for finite carriers.

Finiteness is Mathlib's notion here, so these live in the subject's `Interop`
group rather than in the core order theory, and nothing outside interoperability
imports them.
-/

namespace LRA.Order

universe u v

/-- Every nonempty finite predicate subset of a partial order has a maximal element. -/
theorem NonemptyFiniteSubsetHasMaximalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists maximal, MaximalElement (StrictPart relation) subset maximal := by
  sorry

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

/-- Every nonempty finite predicate subset of a partial order has a minimal element. -/
theorem NonemptyFiniteSubsetHasMinimalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists minimal, MinimalElement (StrictPart relation) subset minimal := by
  sorry

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

/-- Every nonempty finite lattice is complete for predicate subsets. -/
theorem FiniteLatticeIsComplete
    {Alpha : Type u} [Finite Alpha] [Nonempty Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation) :
    CompleteLattice (Set Alpha) relation := by
  sorry

/-- Every finite linear order is a well-order on predicate subsets. -/
theorem FiniteLinearOrderIsWellOrder
    {Alpha : Type u} [Finite Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    WellOrder (Set Alpha) relation := by
  sorry

end LRA.Order
