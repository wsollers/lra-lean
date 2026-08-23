import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

   
                                                                          
                                                                 
                                                                        
                                                                 
  

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.Set

                                                    
axiom LandauBaseNotSuccessor :
    ∀ element : LandauElement, LandauSuccessor element ≠ LandauOne

                                            
axiom LandauSuccessorInjective :
    ∀ first second : LandauElement,
      LandauSuccessor first = LandauSuccessor second → first = second

                 
axiom LandauInduction :
    ∀ subset : PredicateSet LandauElement,
      LandauOne ∈ subset →
      (∀ element : LandauElement, element ∈ subset → LandauSuccessor element ∈ subset) →
      ∀ element : LandauElement, element ∈ subset

                                                                     
                                                                        
                                                     
noncomputable def LandauPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      LandauElement (PredicateSet LandauElement) where
  one := LandauOne
  successor := LandauSuccessor
  one_not_successor := LandauBaseNotSuccessor
  successor_injective := LandauSuccessorInjective
  induction := LandauInduction

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
