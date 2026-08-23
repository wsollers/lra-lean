import LRA.Logic.Language.Symbols

namespace LRA.UniversalAlgebra.Signature.FormalVocabulary

   
                             

             

       
                   
   
  
abbrev Arity := Nat

   
                                    

             

       
                                               
   
  
def Nullary (arity : Arity) : Prop := arity = 0

   
                                                         

             

       
                                             
   
  
def Unary (arity : Arity) : Prop := arity = 1

   
                                                          

             

       
                                              
   
  
def Binary (arity : Arity) : Prop := arity = 2

end LRA.UniversalAlgebra.Signature.FormalVocabulary
