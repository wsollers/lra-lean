import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

universe u

                                                         

                                                                           
                                                                           
                                                                       
                                                                             
                                                                         

             

       
                               
                                               
                                                          
   
  
structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel

                                                                         

             

       
                                       
                                               
                                                        
                                                                      
                                             
   
  
def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal

end LRA.NumberSystems.RealNumbers
