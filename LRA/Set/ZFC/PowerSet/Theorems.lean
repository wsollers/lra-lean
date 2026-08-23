import LRA.Set.ZFC.Axioms.PowerSet
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

   
                                                
  

namespace LRA.Set.ZFC

                                       
theorem PowerSetOfExists (A : Set) :
    ∃ P : Set, IsPowerSetOf A P := by
  sorry

                                                                   
theorem PowerSetOfIsUnique
    {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P)
    (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P := by
  sorry

                                                    
                                                         
theorem PowerSetOfExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun P : Set => IsPowerSetOf A P) := by
  sorry

                                   
noncomputable def ThePowerSet (A : Set) : Set :=
  Classical.choose (PowerSetOfExists A)

                                                            
theorem ThePowerSetIsPowerSetOf (A : Set) :
    IsPowerSetOf A (ThePowerSet A) := by
  sorry

                                                                      
theorem EveryPowerSetOfEqualsThePowerSet
    {A P : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) :
    P = ThePowerSet A := by
  sorry

end LRA.Set.ZFC
