import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Interface.Operations

   
                                                                          

                                                                      
                                                                     
                                                                     
                                                                         
                                                          
                                                                    
                                                                      

                                                                 
                                                                         
                                                                     
                                             
  

namespace LRA.Set.MathlibZFSet

                                                                    
                                                                     

             

       
                                                                  
   
  
def SymmetricDifference (A B : ZFSet) : ZFSet := (A \ B) ∪ (B \ A)

                                                                         
                                                           
                                                                        
instance : _root_.HasSubset ZFSet where
  Subset := fun A B => A ≤ B

instance : HasSeparation ZFSet ZFSet where
  separation := fun ambient property => ZFSet.sep property ambient

instance : HasPowerset ZFSet ZFSet where
  powerset := ZFSet.powerset

instance : HasSymmDiff ZFSet where
  symmDiff := SymmetricDifference

                                                                     
                     

             

       
                                                                  
                                   
   
  
noncomputable def CountableUnion (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sUnion (ZFSet.range family)

                                                                       
                    

             

       
                                                                         
                                   
   
  
noncomputable def CountableIntersection (family : Nat → ZFSet) : ZFSet :=
  ZFSet.sInter (ZFSet.range family)

instance : HasCollectionUnion ZFSet ZFSet where
  collectionUnion := ZFSet.sUnion

instance : HasCollectionIntersection ZFSet ZFSet where
  collectionIntersection := ZFSet.sInter

noncomputable instance : HasCountableUnion ZFSet where
  countableUnion := CountableUnion

noncomputable instance : HasCountableIntersection ZFSet where
  countableIntersection := CountableIntersection

end LRA.Set.MathlibZFSet
