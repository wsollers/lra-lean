import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

universe u

                                                                          
                                                                         

                                                                              
                                                     

             

       
                         
                                             
                                                         
                                                          
                                   
                                                          
   
  
theorem IntegerInitiality
    (integerSystem : IntegerNumberSystem.{u})
    (target : DiscretelyOrderedIntegralDomainModel.{u}) :
    ∃! map : integerSystem.Model.Carrier → target.Carrier,
      EmbeddingPreservesOrderedRing
        integerSystem.Model.signature target.signature map := by
  sorry

end LRA.NumberSystems.Integers
