import Mathlib.Data.ENNReal.Basic
import Mathlib.MeasureTheory.Measure.MeasureSpaceDef
import LRA.Analysis.MeasureTheory.MeasurableSpace.Definition

   
                                         

                                                                            
                                                                          
                                                     
  

namespace LRA.Analysis.MeasureTheory.MeasureSpaces

universe u

                                                                      

                                                                              
                    

                                                                                                                                                                       


             

       
                           
                
                                                                                                      
                                                         
                           
                                        
                               
                                                               
                      
                    
                                                
                                      
                                              
                                              
   
  
structure MeasureDefinition
    (X : Type u)
    (measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn X) where
                                                         
  measure : Set X → ENNReal
                                        
  measure_empty : measure ∅ = 0
                                                               
  countably_additive :
    ∀ A : ℕ → Set X,
      (∀ n, measurableSets.IsMeasurable (A n)) →
      (∀ m n, m ≠ n → A m ∩ A n = ∅) →
      measurableSets.IsMeasurable (⋃ n, A n) →
      measure (⋃ n, A n) = ∑' n, measure (A n)


                                       

                                                                  


             

       
                                      
                                
                  
                                            
                                                                                                  
                                             
                                                    
   
  
structure MeasureSpaceDefinition where
                                
  Carrier : Type u
                                            
  measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn Carrier
                                             
  measure : MeasureDefinition Carrier measurableSets

end LRA.Analysis.MeasureTheory.MeasureSpaces
