import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

   
                                                                                
                                                                               
                                                                         

                                                                           
                                                                                       
                                                                      
                             
  

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.Set.ZFC

                                                                    
                                                                       
              
theorem NaturalZeroIsNotSuccessor :
    ∀ element : NaturalElement, NaturalSuccessor element ≠ NaturalZero := by
  sorry

                                                                     
                                                                            
                                                              
                   
theorem NaturalSuccessorInjective :
    ∀ first second : NaturalElement,
      NaturalSuccessor first = NaturalSuccessor second → first = second := by
  sorry

                                                                            
                                                                           
                                                                             
                                         
theorem NaturalInductionPrinciple :
    ∀ subset : LRA.Set.ZFCSet,
      NaturalZero ∈ subset →
      (∀ element : NaturalElement, element ∈ subset → NaturalSuccessor element ∈ subset) →
      ∀ element : NaturalElement, element ∈ subset := by
  sorry

                                                                          
                                              
                                                                             
noncomputable def VonNeumannPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem NaturalElement LRA.Set.ZFCSet where
  one := NaturalZero
  successor := NaturalSuccessor
  one_not_successor := NaturalZeroIsNotSuccessor
  successor_injective := NaturalSuccessorInjective
  induction := NaturalInductionPrinciple

end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
