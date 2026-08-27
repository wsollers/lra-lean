import LRA.Set.Constructions.ZFCSet.Definition
import LRA.Set.Constructions.ZFCSet.Axioms.Public
import LRA.Set.Interface.Definitions.Operations

namespace LRA.Set.Constructions.ZFCSet

noncomputable instance : _root_.Union LRA.Set.Constructions.ZFCSet where
  union := LRA.Set.Constructions.ZFCSet.Axioms.TheUnion

noncomputable instance : _root_.Inter LRA.Set.Constructions.ZFCSet where
  inter := LRA.Set.Constructions.ZFCSet.Axioms.TheIntersection

instance : _root_.HasSubset LRA.Set.Constructions.ZFCSet where
  Subset := LRA.Set.Constructions.ZFCSet.Axioms.Subset

noncomputable instance : _root_.EmptyCollection LRA.Set.Constructions.ZFCSet where
  emptyCollection := LRA.Set.Constructions.ZFCSet.Axioms.TheEmptySet

noncomputable instance : _root_.SDiff LRA.Set.Constructions.ZFCSet where
  sdiff := LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement

noncomputable instance : HasSymmDiff LRA.Set.Constructions.ZFCSet where
  symmDiff := LRA.Set.Constructions.ZFCSet.Axioms.TheSymmetricDifference

noncomputable instance : HasSeparation LRA.Set.Constructions.ZFCSet LRA.Set.Constructions.ZFCSet where
  separation := LRA.Set.Constructions.ZFCSet.Axioms.TheSeparatedSubset

noncomputable instance : HasPowerset LRA.Set.Constructions.ZFCSet LRA.Set.Constructions.ZFCSet where
  powerset := LRA.Set.Constructions.ZFCSet.Axioms.ThePowerSet

noncomputable instance : HasCollectionUnion LRA.Set.Constructions.ZFCSet LRA.Set.Constructions.ZFCSet where
  collectionUnion := LRA.Set.Constructions.ZFCSet.Axioms.TheUnionOver

noncomputable instance : HasCollectionIntersection LRA.Set.Constructions.ZFCSet LRA.Set.Constructions.ZFCSet where
  collectionIntersection := LRA.Set.Constructions.ZFCSet.Axioms.TheIntersectionOver

end LRA.Set.Constructions.ZFCSet
