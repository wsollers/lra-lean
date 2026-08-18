import LRA.Order.Morphisms.OrderIsomorphism.Theorems
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

/-!
Order transport across a morphism, for set-backed bounds.

The image is supplied as a *representing set object* rather than built by
separation from a universal set. The previous form separated from `𝒰`, which
required `HasUniversal` — a capability only the predicate-set backends register
— so those statements silently did not apply to the ZFC or `ZFSet` backends.
Taking a representative instead states the same mathematics against every
backend, and routes the image through `LRA.Function.ImageClass`, which is the
`LRA.Relation` calculus applied to the function's graph.
-/

namespace LRA.Order

open LRA.Set

universe u v w x

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
