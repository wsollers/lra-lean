import Mathlib.Data.Set.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.UniformSpace.Cauchy
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition.CauchySequencesConverge

   
                                                                             
                           

                                                                          
                                                                            
                                                                             
                                                          
  

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

                                                                                                          

             

       
                                                        
                                                                        
   
  
def HasGreatestLowerBoundProperty [Preorder F] : Prop :=
  ∀ A : Set F, A.Nonempty → (∃ l, IsLowerBound l A) → ∃ i, IsInfimum i A

                                                        

             

       
                                                                          
                                                    
                                         
                         
                                                                                      
   
  
def BolzanoWeierstrassProperty [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, (∃ u, IsUpperBound u (Set.range a)) →
    (∃ l, IsLowerBound l (Set.range a)) →
      ∃ indexMap : ℕ → ℕ,
        StrictMono indexMap ∧ ∃ L, Filter.Tendsto (a ∘ indexMap) Filter.atTop (nhds L)

end LRA.Analysis.Completeness
