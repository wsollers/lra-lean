                                                            
                                                                          

import LRA.VolumeII.NumberSystems.Models
import LRA.Carrier.Countability

namespace LRA.NumberSystems.Models.CharacteristicCardinality

open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory

   
                                               
                                                               
                                                                 
                                                     
  

                                                                              
                  
def CharacteristicZero (signature : OrderedRingSignature) : Prop :=
  ∀ n : Nat,
    n ≠ 0 →
      Nat.rec signature.zero
        (fun _ previous => signature.add previous signature.one)
        n ≠ signature.zero

                                                                          
                                                                          
                                      
theorem IntegerDenselyOrderedFieldRealHaveCharacteristicZero
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel)
    (SelectedRealModel : RealModel) :
    CharacteristicZero SelectedIntegerModel.signature ∧
      CharacteristicZero
        SelectedDenselyOrderedFieldModel.signature.toOrderedRingSignature ∧
      CharacteristicZero SelectedRealModel.signature.toOrderedRingSignature := by
  sorry

                                                                                
                                                                                
                                                         
theorem RealsAreUncountable
    (SelectedRealModel : RealModel) :
    LRA.Carrier.IsUncountable SelectedRealModel.Carrier := by
  sorry

end LRA.NumberSystems.Models.CharacteristicCardinality
