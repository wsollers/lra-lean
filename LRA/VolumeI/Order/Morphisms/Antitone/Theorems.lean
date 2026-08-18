import LRA.Order.Morphisms.Antitone.Theorems
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

/-- An antitone map sends an upper bound to a lower bound of the image. -/
theorem AntitoneSendsUpperBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound) := by
  sorry

/-- An antitone map sends a lower bound to an upper bound of the image. -/
theorem AntitoneSendsLowerBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound) := by
  sorry

/-- The image of the source upper bounds lies in the lower bounds of the image. -/
theorem AntitoneImageUpperBoundsIntoLowerBounds
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfUpperBound :
      LRA.Function.ImageClass map
        (fun input => UpperBound sourceRelation subset input) output)
    : LowerBound targetRelation imageSet output := by
  sorry

/-- Source upper bounds lie in the preimage of the image lower bounds. -/
theorem AntitoneUpperBoundsPreimageLowerBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceUpperBound : UpperBound sourceRelation subset bound)
    : LRA.Function.PreimageClass map
      (fun output => LowerBound targetRelation imageSet output) bound := by
  sorry

/-- The image of the source lower bounds lies in the upper bounds of the image. -/
theorem AntitoneImageLowerBoundsIntoUpperBounds
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (output : Beta)
    (outputIsImageOfLowerBound :
      LRA.Function.ImageClass map
        (fun input => LowerBound sourceRelation subset input) output)
    : UpperBound targetRelation imageSet output := by
  sorry

/-- Source lower bounds lie in the preimage of the image upper bounds. -/
theorem AntitoneLowerBoundsPreimageUpperBoundsContainment
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (bound : Alpha)
    (boundIsSourceLowerBound : LowerBound sourceRelation subset bound)
    : LRA.Function.PreimageClass map
      (fun output => UpperBound targetRelation imageSet output) bound := by
  sorry

end LRA.Order
