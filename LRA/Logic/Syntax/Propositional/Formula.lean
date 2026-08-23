import LRA.Logic.Language.Propositional.PropositionalLanguage

namespace LRA.Logic.Propositional

   
                       

                                                      

                                     
                                         
                                                

                                                                     
                                                                        
                                                                    
                                                                           
                                                                       
                      
  

   
                                                                 

             

       
                                                   
                               
                                
                                              
   
  
inductive Formula (L : PropositionalLanguage) where
  | atom : L.Atoms -> Formula L
  | neg : Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L

   
           

                                                                         
                                                                     
                                                                        
                                                                    
                     
  

   
                                                     

             

       
                                                                        
                     
                          
                                     
                                                                
   
  
def evaluate {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) :
    Formula L -> Bool
  | .atom a => valuation a
  | .neg φ => !(evaluate valuation φ)
  | .impl φ ψ => !(evaluate valuation φ) || evaluate valuation ψ

   
                    

                                                                      

                        
                     
                                

                                                                        
                                                                         
                                                                         
                            
  

   
                                                   

             

       
                                                                            
                                              
   
  
def Formula.and {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

   
                                                 

             

       
                                                                           
                                
   
  
def Formula.or {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.impl (Formula.neg φ) ψ

   
                                                   

             

       
                                                                            
                                                   
   
  
def Formula.iff {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.and (Formula.impl φ ψ) (Formula.impl ψ φ)

   
                                                                         

             

       
                                          
                                                                                 
                                          
                                                    
   
  
theorem Formula.and_evaluatesToConjunction
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.and φ ψ) =
      (evaluate valuation φ && evaluate valuation ψ) := by
  simp [Formula.and, evaluate, Bool.not_or, Bool.not_not]

   
                                                                       

             

       
                                         
                                                                                 
                                         
                                                    
   
  
theorem Formula.or_evaluatesToDisjunction
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.or φ ψ) =
      (evaluate valuation φ || evaluate valuation ψ) := by
  simp [Formula.or, evaluate]

   
                                                                             

             

       
                                            
                                                                                 
                                          
                                                    
   
  
theorem Formula.iff_evaluatesToBiconditional
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.iff φ ψ) =
      (evaluate valuation φ == evaluate valuation ψ) := by
  simp only [Formula.iff, Formula.and_evaluatesToConjunction, evaluate]
  cases evaluate valuation φ <;> cases evaluate valuation ψ <;> rfl

end LRA.Logic.Propositional
