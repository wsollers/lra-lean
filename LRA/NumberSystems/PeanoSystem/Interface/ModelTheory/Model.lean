                                                                 
                                                                            

import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.Theory
import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

   
                                                  

                                            
                                                                       
                  
                                                    

                                                                         
              
  

                                                                      
                                                       
structure PeanoModel where
  toHenkinModel : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature
  satisfiesTheory : PeanoTheory toHenkinModel

                                                                         
             
abbrev PeanoSatisfaction := PeanoModel

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
