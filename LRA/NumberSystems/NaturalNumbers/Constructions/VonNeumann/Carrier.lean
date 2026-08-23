import LRA.Set.ZFC

   
                                                                     
                                                                    
        

                                                                          
                                                                         
                                                                       
                                                                       
                                                                         

                                                                                        
                                                                         
           
  

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.Set.ZFC

                                                                     
noncomputable def TheInfinityWitness : LRA.Set.ZFCSet :=
  Classical.choose Infinity

                                                                      
                                       
theorem TheInfinityWitnessIsInductiveSet :
    IsInductiveSet TheInfinityWitness := by
  sorry

                                                   
noncomputable def VonNeumannSuccessor (x : LRA.Set.ZFCSet) : LRA.Set.ZFCSet :=
  TheUnion x (TheSingleton x)

                                                                     
                                                            
theorem VonNeumannSuccessorIsSuccessorOf (x : LRA.Set.ZFCSet) :
    IsSuccessorOf x (VonNeumannSuccessor x) := by
  sorry

                                                                       
                                                                  
                                                            
noncomputable def Omega : LRA.Set.ZFCSet :=
  TheSeparatedSubset TheInfinityWitness
    (fun x => ∀ B : LRA.Set.ZFCSet, IsInductiveSet B → Subset B TheInfinityWitness → x ∈ B)

                                                                       
                         
theorem OmegaIsInductiveSet : IsInductiveSet Omega := by
  sorry

                                                                             
                                                               
theorem TheEmptySetInOmega : TheEmptySet ∈ Omega := by
  sorry

                                                                      
                                                         
theorem OmegaClosedUnderSuccessor :
    ∀ x : LRA.Set.ZFCSet, x ∈ Omega → VonNeumannSuccessor x ∈ Omega := by
  sorry

   
                                                                        
                                                                         
                                                                         
                                                                    
  

                                                                           
def NaturalElement : Type := {x : LRA.Set.ZFCSet // x ∈ Omega}

                                                                          
                                       

                                                                     
                                                                          
                                                                    
                                                                      
                                                                      
                                                                  
                                                                          
                                                                       
                                                                        
                                                                           
                                                                        
instance (priority := high) : Membership NaturalElement LRA.Set.ZFCSet where
  mem containingSet element := element.val ∈ containingSet

                                                                 
                        
noncomputable def NaturalZero : NaturalElement :=
  ⟨TheEmptySet, TheEmptySetInOmega⟩

                                                     
                               
noncomputable def NaturalSuccessor (element : NaturalElement) : NaturalElement :=
  ⟨VonNeumannSuccessor element.val, OmegaClosedUnderSuccessor element.val element.property⟩

end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
