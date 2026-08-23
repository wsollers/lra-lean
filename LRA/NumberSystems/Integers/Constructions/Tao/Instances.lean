                                                              
                                             

import LRA.NumberSystems.Integers.Constructions.Tao.Behavior
import LRA.NumberSystems.Integers.Definition

namespace LRA.NumberSystems.Integers.Tao

                                                                              
                          

             

       
                                                      
                                                                
                                                                            
                                       
   
  
theorem TaoIntegersFormDiscretelyOrderedIntegralDomain
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      model.Carrier = Carrier wholeData := by
  sorry

                                                                             
                                                                           

             

       
                                      
                                                                
                                                                     
                                                     
   
  
theorem TaoRealizesIntegerNumberSystem
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier wholeData := by
  sorry

end LRA.NumberSystems.Integers.Tao
