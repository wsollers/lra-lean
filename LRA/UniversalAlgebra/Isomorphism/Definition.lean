import LRA.UniversalAlgebra.Embedding.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

   
                                             
                                             
                                                                    
       

                                                               
                                                                  
                                                                   
                                                              
                                              
  

                                           

             

       
                                     
                                                                   
                                                                 
   
  
structure Isomorphism {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Embedding M N where
  surjective : ∀ target : N.Domain, ∃ source, map source = target

                             

             

       
                                                                            
                               
                                           
   
  
def Isomorphism.id {S : Signature} (M : Model.{u} S) : Isomorphism M M where
  toEmbedding := Embedding.id M
  surjective := fun target => ⟨target, rfl⟩

                                                                  
     

             

       
                                                                            
                            
   
  
def Isomorphic {S : Signature} (M : Model.{u} S) (N : Model.{v} S) : Prop :=
  Nonempty (Isomorphism M N)

                                                                     
                                                             
                       

             

       
                                       
                                         
                                   
   
  
theorem isomorphic_symm {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S} :
    Isomorphic M N → Isomorphic N M := by
  sorry

end LRA.UniversalAlgebra
