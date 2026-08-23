                                                                      
                                                                                 

import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.Theory
import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.IntegerStructure.Interface.ModelTheory

   
                                                     

                                                       
                                      
                                                          
                             
                                                    

                                                                           
                                                            
  

                                                                     
                                                                    
structure IntegerStructureModel where
  toHenkinModel : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature
  satisfiesTheory : IntegerStructureTheory toHenkinModel

                                                                       
                   
abbrev IntegerStructureSatisfaction :=
  IntegerStructureModel

end LRA.NumberSystems.IntegerStructure.Interface.ModelTheory
