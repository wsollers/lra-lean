import LRA.Set.ZFC.Axioms.Pairing
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

   
                                                   
  

namespace LRA.Set.ZFC

                                                                              
theorem PairSetExists (x1 x2 : Set) :
    ∃ P : Set, IsPairSet x1 x2 P := by
  sorry

                                                                            
theorem PairSetIsUnique
    {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P)
    (GIsPairSet : IsPairSet x1 x2 G) :
    G = P := by
  sorry

                                                  
                                                       
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  sorry

                                            
noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)

                                         
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2 := by
  sorry

                                                 
theorem EveryPairSetEqualsPairSet
    {x1 x2 P : Set}
    (PIsPairSet : IsPairSet x1 x2 P) :
    P = PairSet x1 x2 := by
  sorry

                                                               
noncomputable def TheSingleton (x : Set) : Set :=
  PairSet x x

                                                              
theorem TheSingletonIsSingletonSet (x : Set) :
    IsSingletonSet x (TheSingleton x) := by
  sorry

end LRA.Set.ZFC
