import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima

   
                                                                               
  

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

                                                                                                       

             

       
                                                                 
                                                                         
   
  
def HasLeastUpperBoundProperty (S : Type*) [Preorder S] : Prop :=
  ∀ A : Set S, A.Nonempty → (∃ u, IsUpperBound u A) → ∃ s, IsSupremum s A

   
                                            

                                                                      
                                                                     
                                                     


             

       
                                                        
   
  
axiom AxiomOfCompleteness : HasLeastUpperBoundProperty ℝ

end LRA.Analysis.Completeness
