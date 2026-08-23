import LRA.Logic.Language.Symbols.Signature

namespace LRA.Logic

   
                                        

                                                                       
                                                                         
                                                                        
                                                                           
                                                                      
                                                                     
                                              

                                                                            
                                                                            
                                                                        
                                                                           
                                                         

                                                                       
                                                                          
                                                                           
                                                                           
           

                                                               
                                                                         
                                                                    
                                                                  
                                                                    
                                                                         
                                                                      
  

   
                                                     

             

       
                         
                                 
                                 
                  
   
  
structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type

                                                                         
                        

             

       
                                      
   
  
abbrev FirstOrderLanguage := Signature

   
                                                                                        

             

       
                                                         
                    
   
  
abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol

   
                                                                                        

             

       
                                                         
                    
   
  
abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol

   
                                                                                        

             

       
                                                         
             
   
  
abbrev Signature.ConstantSymbol (S : Signature) : Type :=
  S.Constants

   
                                                                          

             

       
                                                                        
                   
   
  
def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity

   
                                                                          

             

       
                                                                        
                   
   
  
def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity

   
                                                                      
                                                     
                                             
  

   
                                                                                            

             

       
                                                                                         
                            
   
  
def Signature.IsUnaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsUnary symbol

   
                                                                                              

             

       
                                                                                          
                             
   
  
def Signature.IsBinaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsBinary symbol

   
                                                                                            

             

       
                                                                                         
                            
   
  
def Signature.IsUnaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsUnary symbol

   
                                                                                              

             

       
                                                                                          
                             
   
  
def Signature.IsBinaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsBinary symbol

end LRA.Logic
