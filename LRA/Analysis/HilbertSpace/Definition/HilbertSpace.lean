import Mathlib.Analysis.InnerProductSpace.Basic
import LRA.Analysis.InnerProductSpace.Definition

   
                                              

                                                                            
                                                                          
                                                     
  

namespace LRA.Analysis.FunctionalAnalysis.HilbertSpaces

universe u


                                                            

                                                                                                                                                                                            


             

       
                               
                
                                                                                                  
                     
                             
   
  
noncomputable def ReferenceNorm
    {V : Type u}
    (space : LRA.Analysis.FunctionalAnalysis.InnerProductSpaces.RealInnerProductSpaceDefinition V)
    (x : V) : Real :=
  Real.sqrt (space.inner x x)


                                                                          

                                                                                                                                                                                            


             

       
                    
                
                                                                                                  
                                
                                                         
                                                                                                     
   
  
def IsCauchySequence
    {V : Type u}
    (space : LRA.Analysis.FunctionalAnalysis.InnerProductSpaces.RealInnerProductSpaceDefinition V)
    (sequence : ℕ → V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n →
    ReferenceNorm space (space.vectorSpace.add (sequence m) (space.vectorSpace.neg (sequence n))) < ε


                                                                      

                                                                                                                                                                                                   


             

       
               
                
                                                                                                  
                      
                         
                                               
                                                                                              
   
  
def ConvergesTo
    {V : Type u}
    (space : LRA.Analysis.FunctionalAnalysis.InnerProductSpaces.RealInnerProductSpaceDefinition V)
    (sequence : ℕ → V)
    (limit : V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    ReferenceNorm space (space.vectorSpace.add (sequence n) (space.vectorSpace.neg limit)) < ε


                                            

                                                                                   


             

       
                                                       
                                                 
                                                                                                          
                                                                   
            
                       
                                                   
                                                               
   
  
structure RealHilbertSpaceDefinition (V : Type u) where
                                                 
  innerProductSpace : LRA.Analysis.FunctionalAnalysis.InnerProductSpaces.RealInnerProductSpaceDefinition V
                                                                   
  complete :
    ∀ sequence : ℕ → V,
      IsCauchySequence innerProductSpace sequence →
      ∃ limit : V, ConvergesTo innerProductSpace sequence limit

end LRA.Analysis.FunctionalAnalysis.HilbertSpaces
