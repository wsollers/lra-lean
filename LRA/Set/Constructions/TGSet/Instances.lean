import LRA.Set.Constructions.TGSet.Definition
import LRA.Set.Constructions.TGSet.Public
import LRA.Set.Interface.Definitions.Operations

namespace LRA.Set.Constructions.TGSet

noncomputable instance : _root_.Union LRA.Set.Constructions.TGSet where
  union := LRA.Set.Constructions.TGSet.TheUnion

noncomputable instance : _root_.Inter LRA.Set.Constructions.TGSet where
  inter := LRA.Set.Constructions.TGSet.TheIntersection

instance : _root_.HasSubset LRA.Set.Constructions.TGSet where
  Subset := LRA.Set.Constructions.TGSet.Subset

noncomputable instance : _root_.EmptyCollection LRA.Set.Constructions.TGSet where
  emptyCollection := LRA.Set.Constructions.TGSet.TheEmptySet

noncomputable instance : _root_.SDiff LRA.Set.Constructions.TGSet where
  sdiff := LRA.Set.Constructions.TGSet.TheRelativeComplement

noncomputable instance : HasSymmDiff LRA.Set.Constructions.TGSet where
  symmDiff := LRA.Set.Constructions.TGSet.TheSymmetricDifference

noncomputable instance : HasSeparation LRA.Set.Constructions.TGSet LRA.Set.Constructions.TGSet where
  separation := LRA.Set.Constructions.TGSet.TheSeparatedSubset

noncomputable instance : HasPowerset LRA.Set.Constructions.TGSet LRA.Set.Constructions.TGSet where
  powerset := LRA.Set.Constructions.TGSet.ThePowerSet

noncomputable instance : HasCollectionUnion LRA.Set.Constructions.TGSet LRA.Set.Constructions.TGSet where
  collectionUnion := LRA.Set.Constructions.TGSet.TheUnionOver

noncomputable instance : HasCollectionIntersection LRA.Set.Constructions.TGSet LRA.Set.Constructions.TGSet where
  collectionIntersection := LRA.Set.Constructions.TGSet.TheIntersectionOver

end LRA.Set.Constructions.TGSet

