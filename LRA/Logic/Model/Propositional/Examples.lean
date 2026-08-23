import LRA.Logic.Model.Propositional.PropositionalModel

namespace LRA.Logic.Propositional

   
                                                               

                                                                         
                                                                        
                                                                     
                                                                       

                                                                          
                                                                    
                                                        
                                                                           
                                                                   
  

                                                          

             

       
                        
     
     
   
  
inductive TestAtom where
  | A
  | B

   
                                                              

             

       
                                              
                   
   
  
def testLanguage : PropositionalLanguage where
  Atoms := TestAtom

                                                                         
                            

             

       
                                         
                                                 
   
  
def testFormula : Formula testLanguage :=
  Formula.and (Formula.atom .A) (Formula.atom .B)

                                               

             

       
                                                     
           
                
                
   
  
def testModel : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true

                                                  

             

       
                                   
                                   
   
  
theorem testModel_satisfies_aAndB :
    testModel.satisfies testFormula := by
  show evaluate testModel.valuation (Formula.and (Formula.atom .A) (Formula.atom .B)) = true
  rw [Formula.and_evaluatesToConjunction]
  rfl

end LRA.Logic.Propositional
