import LRA.Set.PredicateSet.Instances
import LRA.SetSystems.GeneratedSigmaAlgebra

   
                                                                           
                                     
  

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableUnion SetObject]

                                                                        
                                                                               
                               

             

       
                                          
                                                                  
                                           
                                                            
   
  
def GeneratedSigmaAlgebraCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop) : Prop :=
  ¬ GeneratorAdmissible ambient generator ∧
    ∀ A, GeneratedSigmaAlgebraCollection ambient generator A

                                                                              
                         

             

       
                                                             
                                                        
                                                               
                                                            
   
  
theorem NonAdmissibleGeneratorMakesGeneratedCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop)
    (notAdmissible : ¬ GeneratorAdmissible ambient generator) :
    GeneratedSigmaAlgebraCollectionVacuous ambient generator := by
  sorry

                                             

             

       
                                                        
   
  
def EmptyNatAmbient : PredicateSet Nat := fun _ => False

                                               

             

       
                                                      
   
  
def ZeroSingleton : PredicateSet Nat := fun n => n = 0

                                                

             

       
                                                                   
                           
   
  
def ZeroSingletonGenerator (candidate : PredicateSet Nat) : Prop :=
  candidate = ZeroSingleton

                                                                              
      

             

       
                                                  
                                                                
   
  
theorem EmptyAmbientZeroGeneratorIsNotAdmissible :
    ¬ GeneratorAdmissible EmptyNatAmbient ZeroSingletonGenerator := by
  sorry

                                                                             
                                                                              
                                                               

             

       
                                                         
                                   
                                                              
                                       
   
  
theorem EmptyAmbientZeroGeneratorRealizesVacuityFailure :
    GeneratedSigmaAlgebraCollection
        EmptyNatAmbient ZeroSingletonGenerator ZeroSingleton ∧
      ¬ ZeroSingleton ⊆ EmptyNatAmbient := by
  sorry

end LRA.SetSystems
