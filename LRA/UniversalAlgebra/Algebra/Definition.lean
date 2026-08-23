import LRA.UniversalAlgebra.Signature
import LRA.Logic.Model.Model
import LRA.Logic.Syntax.Term
import LRA.Logic.Semantics.TermEvaluation

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

   
                                                 
                                                 
                                        

                                                                     
                                                                 
                                                                    
                                                                    
                                                               
                                                                       
                                                             
          
  

                                                                     
                    

             

       
                      
                                                                          
                        
                                  
                        
   
  
def algebraicSignature
    (Functions : ArityIndexedSymbols) (Constants : Type) : Signature where
  Functions := Functions
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Constants

                                                             

             

       
                                                                    
                           
   
  
def _root_.LRA.Logic.Signature.IsAlgebraic (S : Signature) : Prop :=
  S.RelationSymbol -> False

   
                                                                        

             

       
                                     
                                                          
                                                        
   
  
theorem algebraicSignatureIsAlgebraic
    (Functions : ArityIndexedSymbols) (Constants : Type) :
    (algebraicSignature Functions Constants).IsAlgebraic := by
  sorry

                                                                  
                                                                     
                                                                  
      

             

       
                             
                                                           
                     
                           
                                                           
                                                      
                                   
                                       
                                                                  
   
  
noncomputable def termAlgebra
    (S : Signature) (Variable : Type) [Nonempty Variable] :
    Model.{0} S where
  Domain := Term S Variable
  domainNonempty := ⟨.var (Classical.choice inferInstance)⟩
  interpretFunction := fun functionSymbol arguments =>
    .apply functionSymbol arguments
  interpretRelation := fun _ _ => False
  interpretConstant := fun constantSymbol => .const constantSymbol

                                                             
                                                                     
                         

             

       
                                    
                                                         
                              
                                                              
   
  
theorem termAlgebraEvaluatesToItself
    (S : Signature) (Variable : Type) [Nonempty Variable]
    (term : Term S Variable) :
    evaluateTerm (termAlgebra S Variable) Term.var term = term := by
  sorry

end LRA.UniversalAlgebra
