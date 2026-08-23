import Mathlib.Analysis.Normed.Module.Basic
import LRA.Algebra.LinearAlgebra.VectorSpace.Definition

   
                                               

                                                                            
                                                                          
                                     
  

namespace LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces

universe u v


                                                                 

                                                                                                                 


             

       
                                     
                
                   
                      
                                          
                                                           
                  
                 
                               
                                   
                                                           
                                                           
                                 
                                                                    
                                                              
                                                                          
   
  
structure NormedLinearSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where
                                          
  vectorSpace : LRA.LinearAlgebra.VectorSpaceDefinition K V
                  
  norm : V → Real
                               
  norm_nonneg : ∀ x : V, 0 ≤ norm x
                                                           
  norm_eq_zero : ∀ x : V, norm x = 0 ↔ x = vectorSpace.zero
                                 
  triangle : ∀ x y : V, norm (vectorSpace.add x y) ≤ norm x + norm y
                                                              
  norm_smul : ∀ a : K, ∀ x : V, norm (vectorSpace.smul a x) = ‖a‖ * norm x

end LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces

