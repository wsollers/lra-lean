import LRA.Set.ZFC.Axioms.Union
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems
import LRA.Set.ZFC.Pairing.Theorems

   
                                                                            
                                              
  

namespace LRA.Set.ZFC

                                     
theorem UnionOverExists (A : Set) :
    ∃ U : Set, IsUnionOf A U := by
  sorry

                                                               
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
    V = U := by
  sorry

                                                
                                                               
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U) := by
  sorry

                                 
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)

                                                          
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A) := by
  sorry

                                                             
theorem EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) :
    U = TheUnionOver A := by
  sorry

                                                                             
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

                                             
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B := by
  sorry

end LRA.Set.ZFC
