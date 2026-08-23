import Mathlib.Data.Set.Basic
import Mathlib.Order.SetNotation
import Mathlib.Order.SymmDiff
import LRA.Set.Interface.Operations

   
                                                       

                                                                    
                                                       
                                                                        
                                                                  
                                                                 
                                                                        
                                                                      
                                                               
              

                                                                  
                                                                      
                                                 
  

namespace LRA.Set.MathlibPredicateSet

universe u

variable {Alpha : Type u}

                                                                        
                                                               
                                                                    
                                                               
                                                                   
             
instance : _root_.HasSubset (_root_.Set Alpha) where
  Subset := fun A B => A ≤ B

instance : HasComplement (_root_.Set Alpha) where
  complement := Compl.compl

instance : HasUniversal (_root_.Set Alpha) where
  universal := _root_.Set.univ

instance : HasSymmDiff (_root_.Set Alpha) where
  symmDiff := symmDiff

instance : HasSeparation Alpha (_root_.Set Alpha) where
  separation := fun ambient property => {x ∈ ambient | property x}

instance : HasPowerset (_root_.Set Alpha) (_root_.Set (_root_.Set Alpha)) where
  powerset := _root_.Set.powerset

instance : HasIndexedUnion (_root_.Set Alpha) where
  indexedUnion := fun family => _root_.Set.iUnion family

instance : HasIndexedIntersection (_root_.Set Alpha) where
  indexedIntersection := fun family => _root_.Set.iInter family

instance : HasCountableUnion (_root_.Set Alpha) where
  countableUnion := fun family => _root_.Set.iUnion family

instance : HasCountableIntersection (_root_.Set Alpha) where
  countableIntersection := fun family => _root_.Set.iInter family

instance : HasCollectionUnion (_root_.Set Alpha) (_root_.Set (_root_.Set Alpha)) where
  collectionUnion := _root_.Set.sUnion

instance : HasCollectionIntersection (_root_.Set Alpha) (_root_.Set (_root_.Set Alpha)) where
  collectionIntersection := _root_.Set.sInter

end LRA.Set.MathlibPredicateSet
