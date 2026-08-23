import LRA.NumberSystems.RationalNumbers.Definition
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Models
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
