                                                            
                                                                   

import LRA.NumberSystems.Models
import LRA.AlgebraicStructures.OrderedField.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Models
open LRA.AlgebraicStructures.OrderedField.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

   
                                      
                                                                 
                                         

                                                                     
                                                                  
                                                                                
                                                      
  


                                                                         

             

       
                        
                                                 
                                                                 
                                                 
   
  
def rationalNumbersModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature

end LRA.NumberSystems.RationalNumbers
