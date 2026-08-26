import LRA.Set.Constructions.TypeSet.Operations
import LRA.Set.Interface.Operations

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

instance : _root_.Union (LRA.Set.Constructions.TypeSet Alpha) where
  union := LRA.Set.Constructions.TypeSet.Union

instance : _root_.Inter (LRA.Set.Constructions.TypeSet Alpha) where
  inter := LRA.Set.Constructions.TypeSet.Intersection

instance : _root_.HasSubset (LRA.Set.Constructions.TypeSet Alpha) where
  Subset := LRA.Set.Constructions.TypeSet.Subset

instance : _root_.EmptyCollection (LRA.Set.Constructions.TypeSet Alpha) where
  emptyCollection := LRA.Set.Constructions.TypeSet.Empty Alpha

instance : _root_.Singleton Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  singleton := LRA.Set.Constructions.TypeSet.Singleton

instance : _root_.Insert Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  insert := LRA.Set.Constructions.TypeSet.Insert

instance : _root_.SDiff (LRA.Set.Constructions.TypeSet Alpha) where
  sdiff := LRA.Set.Constructions.TypeSet.Difference

instance : HasComplement (LRA.Set.Constructions.TypeSet Alpha) where
  complement := LRA.Set.Constructions.TypeSet.Complement

instance : HasUniversal (LRA.Set.Constructions.TypeSet Alpha) where
  universal := LRA.Set.Constructions.TypeSet.Universal Alpha

instance : HasSymmDiff (LRA.Set.Constructions.TypeSet Alpha) where
  symmDiff := LRA.Set.Constructions.TypeSet.SymmetricDifference

instance : HasSeparation Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  separation := LRA.Set.Constructions.TypeSet.Separation

instance : HasPowerset
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) where
  powerset := LRA.Set.Constructions.TypeSet.PowerSet

instance : HasIndexedUnion (LRA.Set.Constructions.TypeSet Alpha) where
  indexedUnion := fun family => LRA.Set.Constructions.TypeSet.IndexedUnion family

instance : HasIndexedIntersection (LRA.Set.Constructions.TypeSet Alpha) where
  indexedIntersection := fun family =>
    LRA.Set.Constructions.TypeSet.IndexedIntersection family

instance : HasCountableUnion (LRA.Set.Constructions.TypeSet Alpha) where
  countableUnion := fun family => LRA.Set.Constructions.TypeSet.IndexedUnion family

instance : HasCountableIntersection (LRA.Set.Constructions.TypeSet Alpha) where
  countableIntersection := fun family =>
    LRA.Set.Constructions.TypeSet.IndexedIntersection family

instance : HasCollectionUnion
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) where
  collectionUnion := LRA.Set.Constructions.TypeSet.CollectionUnion

instance : HasCollectionIntersection
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) where
  collectionIntersection := LRA.Set.Constructions.TypeSet.CollectionIntersection

end LRA.Set.Constructions.TypeSet
