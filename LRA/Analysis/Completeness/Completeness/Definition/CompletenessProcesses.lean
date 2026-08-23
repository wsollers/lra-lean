import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Bounds.Extrema.SupremaInfima

   
                                                                          

                                                                             
                                                                          
                                                        
  

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

                                                             

             

       
                                                                                  
                                                                 
                                                                            
   
  
def IncreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Monotone a → (∃ u, IsUpperBound u (Set.range a)) →
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)

                                                             

             

       
                                                                                  
                                                                 
                                                                           
   
  
def DecreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Antitone a → (∃ l, IsLowerBound l (Set.range a)) →
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)

                                                             

             

       
                                 
                                                        
                                                                       
   
  
def ArchimedeanReciprocalProperty
    (F : Type*) [Field F] [TopologicalSpace F] : Prop :=
  Filter.Tendsto (fun n : ℕ => (1 : F) / (n : F)) Filter.atTop (nhds 0)

end LRA.Analysis.Completeness
