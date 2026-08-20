import LRA.Set.TGSet.Definition
import LRA.Set.TG.Public
import LRA.Set.Interface.Operations

/-!
The concrete `TGSet` realization registered against the generic Set interface.
-/

namespace LRA.Set.TGSet

noncomputable instance : _root_.Union LRA.Set.TGSet where
  union := LRA.Set.TG.TheUnion

noncomputable instance : _root_.Inter LRA.Set.TGSet where
  inter := LRA.Set.TG.TheIntersection

instance : _root_.HasSubset LRA.Set.TGSet where
  Subset := LRA.Set.TG.Subset

noncomputable instance : _root_.EmptyCollection LRA.Set.TGSet where
  emptyCollection := LRA.Set.TG.TheEmptySet

noncomputable instance : _root_.SDiff LRA.Set.TGSet where
  sdiff := LRA.Set.TG.TheRelativeComplement

noncomputable instance : HasSymmDiff LRA.Set.TGSet where
  symmDiff := LRA.Set.TG.TheSymmetricDifference

noncomputable instance : HasSeparation LRA.Set.TGSet LRA.Set.TGSet where
  separation := LRA.Set.TG.TheSeparatedSubset

noncomputable instance : HasPowerset LRA.Set.TGSet LRA.Set.TGSet where
  powerset := LRA.Set.TG.ThePowerSet

noncomputable instance : HasCollectionUnion LRA.Set.TGSet LRA.Set.TGSet where
  collectionUnion := LRA.Set.TG.TheUnionOver

noncomputable instance : HasCollectionIntersection LRA.Set.TGSet LRA.Set.TGSet where
  collectionIntersection := LRA.Set.TG.TheIntersectionOver

end LRA.Set.TGSet
