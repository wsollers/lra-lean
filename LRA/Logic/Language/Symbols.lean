import LRA.Logic.Language.Symbols.Signature

namespace LRA.Logic.Language

   
                                                                
  

   
                                               

             

       
                                                                                    
   
  
theorem symbolsWiringTest :
    forall Symbol : Type, Nonempty Symbol -> Nonempty Symbol := by
  intro Symbol symbolIsNonempty
  exact symbolIsNonempty

end LRA.Logic.Language
