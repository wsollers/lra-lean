import LRA.Order.Morphisms.OrderIsomorphism.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition
import LRA.Order.Bounds.BoundSets.Theorems
import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.UpperBound.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Function.Calculus.Classes.Definition
import LRA.Set.SetClass.Representation
import LRA.Relation.Operations.Converse.Definition

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

open LRA.Set



variable {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
variable [Membership Alpha SourceSet] [Membership Beta TargetSet]
variable {sourceRelation : LRA.Relation.Endorelation Alpha}
variable {targetRelation : LRA.Relation.Endorelation Beta}
variable {map : Alpha → Beta}

/-- An order isomorphism carries an upper bound to an upper bound of the image. -/
theorem OrderIsomorphismPreservesUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound) := by
  sorry

/-- An order isomorphism carries a lower bound to a lower bound of the image. -/
theorem OrderIsomorphismPreservesLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound) := by
  sorry

/-- An order isomorphism carries a supremum to a supremum of the image. -/
theorem OrderIsomorphismPreservesSupremum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum)
    : Supremum targetRelation imageSet (map supremum) := by
  sorry

/-- An order isomorphism carries an infimum to an infimum of the image. -/
theorem OrderIsomorphismPreservesInfimum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation map inverse)
    {infimum : Alpha}
    (infimumIsInfimum : Infimum sourceRelation subset infimum)
    : Infimum targetRelation imageSet (map infimum) := by
  sorry

/-- An order isomorphism onto the converse order carries a supremum to an infimum. -/
theorem OrderIsomorphismToConverseSendsSupremumToInfimum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation (LRA.Relation.Converse targetRelation) map inverse)
    {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum)
    : Infimum targetRelation imageSet (map supremum) := by
  sorry

/-- An order isomorphism onto the converse order carries an infimum to a supremum. -/
theorem OrderIsomorphismToConverseSendsInfimumToSupremum
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    {inverse : Beta → Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation (LRA.Relation.Converse targetRelation) map inverse)
    {infimum : Alpha}
    (infimumIsInfimum : Infimum sourceRelation subset infimum)
    : Supremum targetRelation imageSet (map infimum) := by
  sorry

end LRA.Order
