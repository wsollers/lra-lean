import LRA.Set.Constructions.NBGSet.Definition
import LRA.Set.Constructions.NBGSet.Axioms.Public
import LRA.Set.Interface.Operations

namespace LRA.Set.Constructions.NBGSet

noncomputable instance : _root_.Union LRA.Set.Constructions.NBGSet where
  union := LRA.Set.Constructions.NBGSet.Axioms.TheUnion

noncomputable instance : _root_.Inter LRA.Set.Constructions.NBGSet where
  inter := LRA.Set.Constructions.NBGSet.Axioms.TheIntersection

instance : _root_.HasSubset LRA.Set.Constructions.NBGSet where
  Subset := LRA.Set.Constructions.NBGSet.Axioms.Subset

noncomputable instance : _root_.EmptyCollection LRA.Set.Constructions.NBGSet where
  emptyCollection := LRA.Set.Constructions.NBGSet.Axioms.TheEmptySet

noncomputable instance : _root_.SDiff LRA.Set.Constructions.NBGSet where
  sdiff := LRA.Set.Constructions.NBGSet.Axioms.TheRelativeComplement

noncomputable instance : HasSymmDiff LRA.Set.Constructions.NBGSet where
  symmDiff := LRA.Set.Constructions.NBGSet.Axioms.TheSymmetricDifference

noncomputable instance : HasSeparation LRA.Set.Constructions.NBGSet LRA.Set.Constructions.NBGSet where
  separation := LRA.Set.Constructions.NBGSet.Axioms.TheSeparatedSubset

noncomputable instance : HasPowerset LRA.Set.Constructions.NBGSet LRA.Set.Constructions.NBGSet where
  powerset := LRA.Set.Constructions.NBGSet.Axioms.ThePowerSet

noncomputable instance : HasCollectionUnion LRA.Set.Constructions.NBGSet LRA.Set.Constructions.NBGSet where
  collectionUnion := LRA.Set.Constructions.NBGSet.Axioms.TheUnionOver

noncomputable instance : HasCollectionIntersection LRA.Set.Constructions.NBGSet LRA.Set.Constructions.NBGSet where
  collectionIntersection := LRA.Set.Constructions.NBGSet.Axioms.TheIntersectionOver

end LRA.Set.Constructions.NBGSet
