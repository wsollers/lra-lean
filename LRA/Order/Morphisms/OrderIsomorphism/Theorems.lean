import LRA.Order.Morphisms.OrderIsomorphism.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u v w

/-- Order isomorphisms preserve every existing binary join. -/
theorem OrderIsomorphismPreservesJoin
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {left right join : Alpha}
    (joinIsJoin : Join sourceRelation left right join) :
    Join targetRelation (forward left) (forward right) (forward join) := by
  sorry

/-- Order isomorphisms preserve every existing binary meet. -/
theorem OrderIsomorphismPreservesMeet
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {left right meet : Alpha}
    (meetIsMeet : Meet sourceRelation left right meet) :
    Meet targetRelation (forward left) (forward right) (forward meet) := by
  sorry

/-- Swapping the maps of an order isomorphism gives its inverse isomorphism. -/
theorem OrderIsomorphismInverse
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse) :
    OrderIsomorphism targetRelation sourceRelation inverse forward := by
  sorry

/-- Order isomorphisms compose. -/
theorem OrderIsomorphismComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstForward : Alpha -> Beta} {firstInverse : Beta -> Alpha}
    {secondForward : Beta -> Gamma} {secondInverse : Gamma -> Beta}
    (firstMapsAreIsomorphism :
      OrderIsomorphism sourceRelation middleRelation
        firstForward firstInverse)
    (secondMapsAreIsomorphism :
      OrderIsomorphism middleRelation targetRelation
        secondForward secondInverse) :
    OrderIsomorphism sourceRelation targetRelation
      (fun element => secondForward (firstForward element))
      (fun element => firstInverse (secondInverse element)) := by
  sorry

end LRA.Order
