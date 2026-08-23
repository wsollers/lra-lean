import LRA.Set.ZFCSet.Definition
import LRA.Set.ZFC.Public
import LRA.Set.Interface.Operations

   
                                                                               

                                                                        
                                                                            
                                                                      
                           
  

namespace LRA.Set.ZFCSet

noncomputable instance : _root_.Union LRA.Set.ZFCSet where
  union := LRA.Set.ZFC.TheUnion

noncomputable instance : _root_.Inter LRA.Set.ZFCSet where
  inter := LRA.Set.ZFC.TheIntersection

instance : _root_.HasSubset LRA.Set.ZFCSet where
  Subset := LRA.Set.ZFC.Subset

noncomputable instance : _root_.EmptyCollection LRA.Set.ZFCSet where
  emptyCollection := LRA.Set.ZFC.TheEmptySet

noncomputable instance : _root_.SDiff LRA.Set.ZFCSet where
  sdiff := LRA.Set.ZFC.TheRelativeComplement

noncomputable instance : HasSymmDiff LRA.Set.ZFCSet where
  symmDiff := LRA.Set.ZFC.TheSymmetricDifference

noncomputable instance : HasSeparation LRA.Set.ZFCSet LRA.Set.ZFCSet where
  separation := LRA.Set.ZFC.TheSeparatedSubset

noncomputable instance : HasPowerset LRA.Set.ZFCSet LRA.Set.ZFCSet where
  powerset := LRA.Set.ZFC.ThePowerSet

noncomputable instance : HasCollectionUnion LRA.Set.ZFCSet LRA.Set.ZFCSet where
  collectionUnion := LRA.Set.ZFC.TheUnionOver

noncomputable instance : HasCollectionIntersection LRA.Set.ZFCSet LRA.Set.ZFCSet where
  collectionIntersection := LRA.Set.ZFC.TheIntersectionOver

end LRA.Set.ZFCSet
