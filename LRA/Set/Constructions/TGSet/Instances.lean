import LRA.Set.Constructions.TGSet.Definition
import LRA.Set.Constructions.TG.Public
import LRA.Set.Interface.Operations

namespace LRA.Set.Constructions.TGSet

noncomputable instance : _root_.Union LRA.Set.Constructions.TGSet where
  union := LRA.Set.Constructions.TG.TheUnion

noncomputable instance : _root_.Inter LRA.Set.Constructions.TGSet where
  inter := LRA.Set.Constructions.TG.TheIntersection

instance : _root_.HasSubset LRA.Set.Constructions.TGSet where
  Subset := LRA.Set.Constructions.TG.Subset

noncomputable instance : _root_.EmptyCollection LRA.Set.Constructions.TGSet where
  emptyCollection := LRA.Set.Constructions.TG.TheEmptySet

noncomputable instance : _root_.SDiff LRA.Set.Constructions.TGSet where
  sdiff := LRA.Set.Constructions.TG.TheRelativeComplement

noncomputable instance : HasSymmDiff LRA.Set.Constructions.TGSet where
  symmDiff := LRA.Set.Constructions.TG.TheSymmetricDifference

noncomputable instance : HasSeparation LRA.Set.Constructions.TGSet LRA.Set.Constructions.TGSet where
  separation := LRA.Set.Constructions.TG.TheSeparatedSubset

noncomputable instance : HasPowerset LRA.Set.Constructions.TGSet LRA.Set.Constructions.TGSet where
  powerset := LRA.Set.Constructions.TG.ThePowerSet

noncomputable instance : HasCollectionUnion LRA.Set.Constructions.TGSet LRA.Set.Constructions.TGSet where
  collectionUnion := LRA.Set.Constructions.TG.TheUnionOver

noncomputable instance : HasCollectionIntersection LRA.Set.Constructions.TGSet LRA.Set.Constructions.TGSet where
  collectionIntersection := LRA.Set.Constructions.TG.TheIntersectionOver

end LRA.Set.Constructions.TGSet
