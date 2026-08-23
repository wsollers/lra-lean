import LRA.SetSystems.SigmaAlgebra

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableUnion SetObject]

                                                                         

                                                                                
                                                               

             

       
                                   
                                                                              
          
                                         
                                                              
   
  
def GeneratedSigmaAlgebraCollection
    (ambient : SetObject) (generator : SetObject → Prop) :
    SetObject → Prop :=
  fun A =>
    ∀ sigma : SigmaAlgebraOfSets ambient,
      (∀ G, generator G → sigma.IsMember G) → sigma.IsMember A

                                                                   
                                                    

                                                          
                                                                         
               

             

       
                       
                                                                  
                                       
                                       
   
  
def GeneratorAdmissible
    (ambient : SetObject) (generator : SetObject → Prop) : Prop :=
  ∃ sigma : SigmaAlgebraOfSets ambient,
    ∀ G, generator G → sigma.IsMember G

                                                                             
                                                           

             

       
                                              
                                                        
                                                          
                                                                          
   
  
theorem GeneratedSigmaAlgebraMembersAreSubsets
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator) :
    ∀ A, GeneratedSigmaAlgebraCollection ambient generator A →
      A ⊆ ambient := by
  sorry


theorem GeneratedSigmaAlgebraEmptyIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    GeneratedSigmaAlgebraCollection ambient generator (∅ : SetObject) := by
  sorry


theorem GeneratedSigmaAlgebraUnionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∪ B) := by
  sorry


theorem GeneratedSigmaAlgebraIntersectionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∩ B) := by
  sorry


theorem GeneratedSigmaAlgebraDifferenceIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A \ B) := by
  sorry


theorem GeneratedSigmaAlgebraSymmetricDifferenceIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∆ B) := by
  sorry


theorem GeneratedSigmaAlgebraAmbientIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    GeneratedSigmaAlgebraCollection ambient generator ambient := by
  sorry


theorem GeneratedSigmaAlgebraCountableUnionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ family : Nat → SetObject,
      (∀ index, GeneratedSigmaAlgebraCollection ambient generator
        (family index)) →
        GeneratedSigmaAlgebraCollection ambient generator
          (HasCountableUnion.countableUnion family) := by
  sorry

                                                                               
                                                                 

             

       
                         
                                                        
                                                          
                              
   
  
def GeneratedSigmaAlgebra
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator) :
    SigmaAlgebraOfSets ambient where
  IsMember := GeneratedSigmaAlgebraCollection ambient generator
  MembersAreSubsets :=
    GeneratedSigmaAlgebraMembersAreSubsets ambient generator admissible
  EmptyIsMember := GeneratedSigmaAlgebraEmptyIsMember ambient generator
  UnionIsMember := GeneratedSigmaAlgebraUnionIsMember ambient generator
  IntersectionIsMember :=
    GeneratedSigmaAlgebraIntersectionIsMember ambient generator
  DifferenceIsMember := GeneratedSigmaAlgebraDifferenceIsMember ambient generator
  SymmetricDifferenceIsMember :=
    GeneratedSigmaAlgebraSymmetricDifferenceIsMember ambient generator
  AmbientIsMember := GeneratedSigmaAlgebraAmbientIsMember ambient generator
  CountableUnionIsMember :=
    GeneratedSigmaAlgebraCountableUnionIsMember ambient generator

                                                           

             

       
                                              
                                                        
                                                        
                                                  
                                                                   
   
  
theorem GeneratedSigmaAlgebraContainsGenerator
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator)
    (G : SetObject) (GIsGenerator : generator G) :
    (GeneratedSigmaAlgebra ambient generator admissible).IsMember G := by
  sorry

                                                                               
                                         

             

       
                                    
                                                        
                                                        
                                        
                                                                   
                                                                          
                      
   
  
theorem GeneratedSigmaAlgebraMinimal
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator)
    (sigma : SigmaAlgebraOfSets ambient)
    (sigmaAdmitsGenerators : ∀ G, generator G → sigma.IsMember G) :
    ∀ A, (GeneratedSigmaAlgebra ambient generator admissible).IsMember A →
      sigma.IsMember A := by
  sorry

                                                                        
                                                                          
                                                                              
                        

             

       
                     
                                                    
                                                           
                                 
                                                     
   
  
def BorelSigmaAlgebra
    (ambient : SetObject) (opens : SetObject → Prop)
    (opensAdmissible : GeneratorAdmissible ambient opens) :
    SigmaAlgebraOfSets ambient :=
  GeneratedSigmaAlgebra ambient opens opensAdmissible

end LRA.SetSystems
