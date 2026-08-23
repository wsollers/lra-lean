import LRA.Logic.Semantics.Substitution
import LRA.Logic.Syntax.FirstOrder.Sentence

namespace LRA.Logic.FirstOrder

   
                                         

                                                                      
                                                          
  

                                                                 
           

             

       
                                        
                                                            
                 
                                                           
                                  
                                               
                                        
                                         
   
  
theorem satisfies_iff_of_isClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (formula : Formula S Variable)
    (closedFormula : IsClosedFormula formula) :
    Satisfies M leftAssignment formula ↔
      Satisfies M rightAssignment formula := by
  apply satisfies_iff_of_agrees_on_freeVariables
  intro candidateVariable candidateVariableIsFree
  rw [closedFormula] at candidateVariableIsFree
  simp at candidateVariableIsFree

                                                                          
                      

             

       
                              
                                                            
                 
                                                           
                                      
                                             
                                              
   
  
theorem satisfies_sentence_iff
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (sentence : Sentence S Variable) :
    Satisfies M leftAssignment sentence.val ↔
      Satisfies M rightAssignment sentence.val :=
  satisfies_iff_of_isClosedFormula M sentence.val sentence.property

end LRA.Logic.FirstOrder
