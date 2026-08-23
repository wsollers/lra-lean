import LRA.Set.PredicateSet.Operations
import LRA.Set.Interface.Operations

   
                                                                           
                                                                            
                                                                   
  

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

instance : _root_.Union (LRA.Set.PredicateSet Alpha) where
  union := LRA.Set.PredicateSet.Union

instance : _root_.Inter (LRA.Set.PredicateSet Alpha) where
  inter := LRA.Set.PredicateSet.Intersection

instance : _root_.HasSubset (LRA.Set.PredicateSet Alpha) where
  Subset := LRA.Set.PredicateSet.Subset

instance : _root_.EmptyCollection (LRA.Set.PredicateSet Alpha) where
  emptyCollection := LRA.Set.PredicateSet.Empty Alpha

instance : _root_.Singleton Alpha (LRA.Set.PredicateSet Alpha) where
  singleton := LRA.Set.PredicateSet.Singleton

instance : _root_.Insert Alpha (LRA.Set.PredicateSet Alpha) where
  insert := LRA.Set.PredicateSet.Insert

instance : _root_.SDiff (LRA.Set.PredicateSet Alpha) where
  sdiff := LRA.Set.PredicateSet.Difference

instance : HasComplement (LRA.Set.PredicateSet Alpha) where
  complement := LRA.Set.PredicateSet.Complement

instance : HasUniversal (LRA.Set.PredicateSet Alpha) where
  universal := LRA.Set.PredicateSet.Universal Alpha

instance : HasSymmDiff (LRA.Set.PredicateSet Alpha) where
  symmDiff := LRA.Set.PredicateSet.SymmetricDifference

instance : HasSeparation Alpha (LRA.Set.PredicateSet Alpha) where
  separation := LRA.Set.PredicateSet.Separation

instance : HasPowerset
    (LRA.Set.PredicateSet Alpha)
    (LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) where
  powerset := LRA.Set.PredicateSet.PowerSet

instance : HasIndexedUnion (LRA.Set.PredicateSet Alpha) where
  indexedUnion := fun family => LRA.Set.PredicateSet.IndexedUnion family

instance : HasIndexedIntersection (LRA.Set.PredicateSet Alpha) where
  indexedIntersection := fun family =>
    LRA.Set.PredicateSet.IndexedIntersection family

instance : HasCountableUnion (LRA.Set.PredicateSet Alpha) where
  countableUnion := fun family => LRA.Set.PredicateSet.IndexedUnion family

instance : HasCountableIntersection (LRA.Set.PredicateSet Alpha) where
  countableIntersection := fun family =>
    LRA.Set.PredicateSet.IndexedIntersection family

instance : HasCollectionUnion
    (LRA.Set.PredicateSet Alpha)
    (LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) where
  collectionUnion := LRA.Set.PredicateSet.CollectionUnion

instance : HasCollectionIntersection
    (LRA.Set.PredicateSet Alpha)
    (LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) where
  collectionIntersection := LRA.Set.PredicateSet.CollectionIntersection

end LRA.Set.PredicateSet
