                                    
                                                                        
                                                                             
                                                                        
                                                                          
                                                                            
  
                                                                            
                                                                  
                                                                          
                                                                            
                                                                          
                                                          
  
                                             
                                                                         
                                            
  
                                          
  
                                                                           
                                                                          
                                                                      
                                                                       
                                                                           
                                                                            
                                                                     
  
                                                                      
                                    
                                                                         
                                                                          
                                                                         
                                                                      
                                                                           
                                                                            
                                                                           
                                                                           
                                                                         
                         
                                                                       
                                                                           
                                                                   
                                                                         
                                                                        
                                                                         
                                                                       
                                                                           
                                                            
                                                                           
                                                                          
                

import Lean

open Lean

                                                                     
                                                          
                                               
syntax (name := corollary) (priority := default + 1) declModifiers
  group("corollary " declId ppIndent(declSig) declVal) : command

                                                                        
                                                          
@[macro «corollary»] def expandCorollary : Macro := fun stx =>
  let stx := stx.modifyArg 1 fun stx =>
    let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
    stx.setKind ``Parser.Command.theorem
  pure <| stx.setKind ``Parser.Command.declaration

                                                                      
                                               
                                                   
syntax (name := proposition) (priority := default + 1) declModifiers
  group("proposition " declId ppIndent(declSig) declVal) : command

                                                                          
                                                          
@[macro «proposition»] def expandProposition : Macro := fun stx =>
  let stx := stx.modifyArg 1 fun stx =>
    let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
    stx.setKind ``Parser.Command.theorem
  pure <| stx.setKind ``Parser.Command.declaration

                                                                  

                                                                           
                                   
  

namespace LRA.Meta.DeclarationKeywords.SmokeTest

corollary corollary_smoke_test (a : Nat) : a + 0 = a := rfl

proposition proposition_smoke_test (a b : Nat) : a + b = b + a := Nat.add_comm a b

                                                                        
                                                                  
#check (corollary_smoke_test : ∀ a : Nat, a + 0 = a)
#check (proposition_smoke_test : ∀ a b : Nat, a + b = b + a)

end LRA.Meta.DeclarationKeywords.SmokeTest
