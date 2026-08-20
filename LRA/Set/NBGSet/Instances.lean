import LRA.Set.NBGSet.Definition
import LRA.Set.NBG.Public
import LRA.Set.Interface.Operations

/-!
The concrete `NBGSet` realization registered against the generic Set interface.
-/

namespace LRA.Set.NBGSet

noncomputable instance : _root_.Union LRA.Set.NBGSet where
  union := LRA.Set.NBG.TheUnion

noncomputable instance : _root_.Inter LRA.Set.NBGSet where
  inter := LRA.Set.NBG.TheIntersection

instance : _root_.HasSubset LRA.Set.NBGSet where
  Subset := LRA.Set.NBG.Subset

noncomputable instance : _root_.EmptyCollection LRA.Set.NBGSet where
  emptyCollection := LRA.Set.NBG.TheEmptySet

noncomputable instance : _root_.SDiff LRA.Set.NBGSet where
  sdiff := LRA.Set.NBG.TheRelativeComplement

noncomputable instance : HasSymmDiff LRA.Set.NBGSet where
  symmDiff := LRA.Set.NBG.TheSymmetricDifference

noncomputable instance : HasSeparation LRA.Set.NBGSet LRA.Set.NBGSet where
  separation := LRA.Set.NBG.TheSeparatedSubset

noncomputable instance : HasPowerset LRA.Set.NBGSet LRA.Set.NBGSet where
  powerset := LRA.Set.NBG.ThePowerSet

noncomputable instance : HasCollectionUnion LRA.Set.NBGSet LRA.Set.NBGSet where
  collectionUnion := LRA.Set.NBG.TheUnionOver

noncomputable instance : HasCollectionIntersection LRA.Set.NBGSet LRA.Set.NBGSet where
  collectionIntersection := LRA.Set.NBG.TheIntersectionOver

end LRA.Set.NBGSet
