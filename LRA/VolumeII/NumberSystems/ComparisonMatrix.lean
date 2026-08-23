                                                   
                                                                 

import LRA.VolumeII.NumberSystems.CharacteristicCardinality
import LRA.VolumeII.NumberSystems.CanonicalEmbeddings

namespace LRA.NumberSystems.Models.ComparisonMatrix

   
                                                
                                                      
                                                       
                                                     
  
   
                                               

             

       
                                               
                             
                                   
                                
                 
                                
                              
                             
   
  

structure SystemLedger (carrier : Type _) where
  HasAdditiveStructure : Prop
  HasMultiplicativeStructure : Prop
  HasRingOrFieldStructure : Prop
  HasOrder : Prop
  HasCompletenessProperty : Prop
  HasCharacteristicZero : Prop
  CardinalityStatement : Prop
   
                                                     

             

       
                                                   
                                 
                  
                          
                                
                            
                                  
                   
                      
   
  

structure CanonicalMapLedger {source target : Type}
    (map : source → target) where
  injective : Prop
  PreservesAddition : Prop
  PreservesMultiplication : Prop
  PreservesIdentities : Prop
  PreservesAndReflectsOrder : Prop
  DenseImage : Prop
  UniversalRole : Prop

   
                                                                               
                                               

             

       
                             
                                                                 
                                                    
                                                                 
                                   
                          
                                                                               
         
                                                           
                  
                
                                                                                    
                                                                          
                           
                      
                                                                            
                        
                      
                                                                    
   
  
structure ZQRComparisonMatrix
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedArchimedeanDenseOrderedFieldExtension :
      ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension :
      CofinalRealExtension
        SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel)
    where
  IntegerLedger : SystemLedger SelectedIntegerModel.Carrier
  RationalLedger :
    SystemLedger
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.Carrier
  RealLedger : SystemLedger SelectedCofinalRealExtension.RealModel.Carrier
  IntegerToRationalLedger :
    CanonicalMapLedger
      SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField
  RationalToRealLedger :
    CanonicalMapLedger
      SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
   
                                                         

             

       
                              
                                                                 
                                                                                                                
                                                                                                                                  
            
                          
                            
                                                     
                                     
   
  

theorem ComparisonMatrixForZQR
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) :
    Nonempty
      (ZQRComparisonMatrix
        SelectedIntegerModel
        SelectedArchimedeanDenseOrderedFieldExtension
        SelectedCofinalRealExtension) := by
  sorry

end LRA.NumberSystems.Models.ComparisonMatrix
