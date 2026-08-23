                                                        
                                                               

import LRA.NumberSystems.Models
import LRA.AlgebraicStructures.OrderedField.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Models
open LRA.AlgebraicStructures.OrderedField.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

   
                                  
                                                             
                                         

                                                                 
                                                                        
                                                                         
                                   
  


                                                                     

                                                                                                                                            


             

       
                    
                              
                                                                 
                                             
   
  
def realNumbersModel
    (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature

end LRA.NumberSystems.RealNumbers
