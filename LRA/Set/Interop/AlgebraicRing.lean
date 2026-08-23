import LRA.Set.PredicateSet.Laws
import LRA.AlgebraicStructures.CommutativeRing.Laws.Definition

namespace LRA.Set.Interop.AlgebraicRing

open LRA.Set
open LRA.Set.PredicateSet
open LRA.AlgebraicStructures

universe u

variable {Alpha : Type u}

   
                                        

                                                         
                                                                           
                                                                            
                                                                           

                                                                      
                    

                                                                   
                                                                    
                                                                      
                                                                
                                                                       
                                        
                                                        

                                                                      
                                                                        
                                                                 
                                                                       
                                                                        
                      
  

                                                     
scoped instance : Add (PredicateSet Alpha) where
  add := SymmetricDifference

                                                   
scoped instance : Mul (PredicateSet Alpha) where
  mul := Intersection

                                          
scoped instance : OfNat (PredicateSet Alpha) 0 where
  ofNat := Empty Alpha

                                             
scoped instance : OfNat (PredicateSet Alpha) 1 where
  ofNat := Universal Alpha

                                                               
scoped instance : Neg (PredicateSet Alpha) where
  neg := id

                                                                     

             

       
                                                             
   
  
theorem UniversalIntersection : ∀ A : PredicateSet Alpha, 1 * A = A := by
  sorry

                                                                      

             

       
                                                             
   
  
theorem IntersectionUniversal : ∀ A : PredicateSet Alpha, A * 1 = A := by
  sorry

                                                                   

             

       
                                                        
                                                       
   
  
theorem IntersectionDistributesOverSymmetricDifference :
    ∀ A B C : PredicateSet Alpha, A * (B + C) = A * B + A * C := by
  sorry

                                                                    

             

       
                                                    
                                                       
   
  
theorem SymmetricDifferenceIntersectionDistributes :
    ∀ A B C : PredicateSet Alpha, (A + B) * C = A * C + B * C := by
  sorry

                                                         
                               
scoped instance : AdditiveSemigroupLaws (PredicateSet Alpha) := by
  sorry

                                        
scoped instance : AdditiveCommutativeLaws (PredicateSet Alpha) := by
  sorry

                                                  
scoped instance : AdditiveIdentityLaws (PredicateSet Alpha) := by
  sorry

                                                                  
                
scoped instance : AdditiveInverseLaws (PredicateSet Alpha) := by
  sorry

                                        
scoped instance : MultiplicativeSemigroupLaws (PredicateSet Alpha) := by
  sorry

                                        
scoped instance : MultiplicativeCommutativeLaws (PredicateSet Alpha) := by
  sorry

                                                        
scoped instance : MultiplicativeIdentityLaws (PredicateSet Alpha) := by
  sorry

                                     
scoped instance : ZeroAbsorbingLaws (PredicateSet Alpha) := by
  sorry

                                              
scoped instance : DistributiveLaws (PredicateSet Alpha) := by
  sorry

   
                                                                        
                                                                   
                                                                        
                                                                        
                                                            
                                          
  

example (A B : PredicateSet Alpha) : A + B = B + A :=
  AddCommutative A B

example (A B C : PredicateSet Alpha) : (A + B) + C = A + (B + C) :=
  AddAssociative A B C

example (A B C : PredicateSet Alpha) : (A + B) * C = A * C + B * C :=
  RightDistributive A B C

example (A : PredicateSet Alpha) : A + A = 0 :=
  AddNegCancel A

example : CommutativeRingLaws (PredicateSet Alpha) := inferInstance

end LRA.Set.Interop.AlgebraicRing
