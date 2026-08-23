import LRA.Function.Definition

   
                                      

                                                                       
                                                                               
                                                                               
                                                         
  

namespace LRA.Function.Examples

universe u v

                                                                       
def collapse : LRA.Function Bool Unit :=
  fun _ => ()

                                                                                     
def shift : Endofunction Nat :=
  Nat.succ

                                                              
def vacuous : LRA.Function Empty Bool :=
  fun input => nomatch input

                                                              
def swap : Endofunction Bool :=
  fun input => !input

                                                
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : LRA.Function Domain Codomain :=
  fun _ => output

end LRA.Function.Examples
