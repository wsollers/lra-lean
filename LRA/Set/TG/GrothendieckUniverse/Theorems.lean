import LRA.Set.TG.Axioms.GrothendieckUniverse
import LRA.Set.TG.Definitions

namespace LRA.Set.TG

                                                            
theorem GrothendieckUniverseExists (A : Set) :
    exists U : Set, IsGrothendieckUniverseFor A U := by
  sorry

                                                     
noncomputable def TheGrothendieckUniverse (A : Set) : Set :=
  Classical.choose (GrothendieckUniverseExists A)

                                                                            
theorem TheGrothendieckUniverseIsGrothendieckUniverseFor (A : Set) :
    IsGrothendieckUniverseFor A (TheGrothendieckUniverse A) := by
  sorry

                                                                         

                                                                      
                                                                              
                                                                          

             

       
                                            
                 
                                                        
                           
                       
                                    
   
  
theorem GrothendieckUniverseClosedUnderUnion
    {A U X : Set}
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (XInUniverse : X ∈ U) :
    exists union : Set,
      union ∈ U /\ IsUnionOf X union := by
  sorry

end LRA.Set.TG
