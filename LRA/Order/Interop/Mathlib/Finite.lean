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

   
                                     

                                                                             
                                                                                
             
  

namespace LRA.Order

universe u v

                                                                                       
theorem NonemptyFiniteSubsetHasMaximalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists maximal, MaximalElement (StrictPart relation) subset maximal := by
  sorry

   
                                        

                                                                         
                 

                                                                                                         
  
theorem NonemptyFiniteSubsetHasGreatestElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists greatest, GreatestElement relation subset greatest := by
  sorry

                                                                                       
theorem NonemptyFiniteSubsetHasMinimalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists minimal, MinimalElement (StrictPart relation) subset minimal := by
  sorry

   
                                     

                                                                         
              

                                                                                                
  
theorem NonemptyFiniteSubsetHasLeastElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists least, LeastElement relation subset least := by
  sorry

                                                                       
theorem FiniteLatticeIsComplete
    {Alpha : Type u} [Finite Alpha] [Nonempty Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation) :
    CompleteLattice (Set Alpha) relation := by
  sorry

                                                                      
theorem FiniteLinearOrderIsWellOrder
    {Alpha : Type u} [Finite Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    WellOrder (Set Alpha) relation := by
  sorry

end LRA.Order
