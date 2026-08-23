import LRA.Set.ZFC.Pairing.Theorems
import LRA.Set.Interface.Pairing

   
                                                       

                                                                         
                                                                               
                                                                       
  

namespace LRA.Set.ZFC

                                    
noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element

                                                            
noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)

                                                  
theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element ↔ candidate = element := by
  sorry

                                                                              
               
theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight ↔
      firstLeft = secondLeft ∧ firstRight = secondRight := by
  sorry

                                                                           
theorem SingletonMemberOfKuratowskiPair (first second : Set) :
    SingletonSet first ∈ KuratowskiPair first second := by
  sorry

                                                                                  
noncomputable instance (priority := high) :
    HasPairing Set Set Set :=
  ⟨KuratowskiPair⟩

                                                                        
instance : PairingLaws Set Set Set :=
  ⟨fun firstLeft secondLeft firstRight secondRight =>
    KuratowskiPairInjective firstLeft secondLeft firstRight secondRight⟩

end LRA.Set.ZFC
