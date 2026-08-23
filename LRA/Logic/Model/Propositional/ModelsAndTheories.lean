import Mathlib.Data.Set.Defs
import LRA.Logic.Model.Propositional.PropositionalModel

namespace LRA.Logic.Propositional

   
                                                              

                                                                         
                                                                     
                                                                    
                                                                         
                                                                      
                                                                          
                                                                    
                                                          

                                                                          
                                                                        
                                                      

                                                                    
                            

                                                                     
                                                             
                                                                          
                                                                    

                                                                         
                                                                         
                                                                       
                                                                   
                                                                     
                                                                      
                                                                          
                                                                        
                                                                  

                                                                          
                                                                         
                                                                        
                                                                    
                                                                     
                                                       
  

                                                                          
                    

             

       
                                                                                          
                     
   
  
def modelClass {L : PropositionalLanguage} (φ : Formula L) : Set (PropositionalModel L) :=
  {M | M.satisfies φ}

                                                                         
                      

             

       
                                                                                                    
                              
   
  
def ModelsOfTheory {L : PropositionalLanguage} (Γ : Set (Formula L)) : Set (PropositionalModel L) :=
  {M | ∀ φ ∈ Γ, M.satisfies φ}

                                                                      
                                                

             

       
                                                                                                    
                              
   
  
def TheoryOfModels {L : PropositionalLanguage} (K : Set (PropositionalModel L)) : Set (Formula L) :=
  {φ | ∀ M ∈ K, M.satisfies φ}

                                                                   
                                                                        
             

             

       
                                                                 
                                           
   
  
def IsValid {L : PropositionalLanguage} (φ : Formula L) : Prop :=
  ∀ M : PropositionalModel L, M.satisfies φ

                                                           
                                           

             

       
                                                                             
                             
   
  
def IsSatisfiable {L : PropositionalLanguage} (Γ : Set (Formula L)) : Prop :=
  (ModelsOfTheory Γ).Nonempty

                                                                         
                    
                                    

             

       
                                                                                                   
                                 
   
  
def SemanticConsequence {L : PropositionalLanguage} (Γ : Set (Formula L)) (φ : Formula L) : Prop :=
  ModelsOfTheory Γ ⊆ modelClass φ

                                                                     
                                                                  
                                                              
scoped notation:50 Γ " ⊨ₜ " φ => SemanticConsequence Γ φ

end LRA.Logic.Propositional
