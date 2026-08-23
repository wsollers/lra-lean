import Mathlib.Topology.UniformSpace.Cauchy
import LRA.Analysis.NormedLinearSpace.Definition

   
                                        

                                                                            
                                                                          
                                                         
  

namespace LRA.Analysis.FunctionalAnalysis.BanachSpaces

universe u v


                                                                            

                                                                                                                                                                                                                       


             

       
                    
                
                   
                
                                                                                                
                                
                                                         
                                                                                            
   
  
def IsCauchySequence
    {K : Type u}
    [NormedField K]
    {V : Type v}
    (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V)
    (sequence : ℕ → V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n →
    space.norm (space.vectorSpace.add (sequence m) (space.vectorSpace.neg (sequence n))) < ε


                                                                        

                                                                                                                                                                                                                              


             

       
               
                
                   
                
                                                                                                
                      
                         
                                               
                                                                                     
   
  
def ConvergesTo
    {K : Type u}
    [NormedField K]
    {V : Type v}
    (space : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V)
    (sequence : ℕ → V)
    (limit : V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    space.norm (space.vectorSpace.add (sequence n) (space.vectorSpace.neg limit)) < ε


                                      

                                                                                                           


             

       
                               
                
                   
                      
                                            
                                                                                                        
                                         
            
                       
                                                   
                                                               
   
  
structure BanachSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where
                                            
  normedLinearSpace : LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces.NormedLinearSpaceDefinition K V
                                         
  complete :
    ∀ sequence : ℕ → V,
      IsCauchySequence normedLinearSpace sequence →
      ∃ limit : V, ConvergesTo normedLinearSpace sequence limit

end LRA.Analysis.FunctionalAnalysis.BanachSpaces

