import LRA.Logic.Syntax.FirstOrder.FreeVariables

namespace LRA.Logic.FirstOrder

   
                              

                                                                            
                                                                  
                                                                             
                               
  

                                                      

             

       
                   
                                                            
                                            
                           
   
  
def IsClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (formula : Formula S Variable) : Prop :=
  freeVariables formula = ∅

                                               

             

       
                                                                           
                                                             
   
  
abbrev Sentence (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  { formula : Formula S Variable // IsClosedFormula formula }

                                                               

             

       
                                   
                                                            
                                      
                                  
   
  
theorem sentence_hasNoFreeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (sentence : Sentence S Variable) :
    freeVariables sentence.val = ∅ :=
  sentence.property

end LRA.Logic.FirstOrder
