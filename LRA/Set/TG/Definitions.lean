import LRA.Set.TGSet.Primitives
import LRA.Identity.ExistenceAndUniqueness

                                                                  

namespace LRA.Set.TG

abbrev Set := LRA.Set.TGSet

                                                           
abbrev ExistsAndUnique (property : Set -> Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

                                                     
def IsEmptySet (A : Set) : Prop := forall x : Set, x ∉ A

                                            
def IsPairSet (x1 x2 P : Set) : Prop :=
  forall w : Set, w ∈ P <-> w = x1 \/ w = x2

                                       
def IsSingletonSet (x S : Set) : Prop :=
  forall w : Set, w ∈ S <-> w = x

                                                 
def IsUnionOf (A U : Set) : Prop :=
  forall x : Set, x ∈ U <-> exists B : Set, B ∈ A /\ x ∈ B

                                   
def IsPowerSetOf (A P : Set) : Prop :=
  forall x : Set, x ∈ P <-> forall y : Set, y ∈ x -> y ∈ A

                                                        
def IsSeparatedSubset (A : Set) (property : Set -> Prop) (B : Set) : Prop :=
  forall x : Set, x ∈ B <-> x ∈ A /\ property x

                                                    
def IsRelativeComplementOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∉ B

                                              
def IsIntersectionOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∈ B

                                                      
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> (x ∈ A /\ x ∉ B) \/ (x ∈ B /\ x ∉ A)

                              
def Subset (A B : Set) : Prop := forall x : Set, x ∈ A -> x ∈ B

                                                                   
def IsFunctionalOn (A : Set) (relation : Set -> Set -> Prop) : Prop :=
  forall x : Set, x ∈ A ->
    exists y : Set,
      relation x y /\
      forall other : Set, relation x other -> other = y

                                                            
def IsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop) (B : Set) : Prop :=
  forall y : Set, y ∈ B <-> exists x : Set, x ∈ A /\ relation x y

                                           
def IsSuccessorOf (x successor : Set) : Prop :=
  forall w : Set, w ∈ successor <-> w ∈ x \/ w = x

                               
def IsInductiveSet (A : Set) : Prop :=
  (exists empty : Set, empty ∈ A /\ IsEmptySet empty) /\
  forall x : Set, x ∈ A -> exists successor : Set, successor ∈ A /\ IsSuccessorOf x successor

                                           
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A /\ forall y : Set, y ∈ x -> y ∉ A

                                                      
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  forall B : Set, B ∈ A ->
    exists x : Set,
      (x ∈ B /\ x ∈ choiceSet) /\
      forall other : Set, (other ∈ B /\ other ∈ choiceSet) -> other = x

                                                  

                                                                            
                                                                              
                                                                             
                      

             

       
                                                   
          
                                                              
                                           
                                 
                           
                               
                                                
                           
                      
                                                                                 
                           
                               
                                                
                           
                      
                                                                              
   
  
def IsGrothendieckUniverseFor (A U : Set) : Prop :=
  A ∈ U /\
  (forall x : Set, x ∈ U -> forall y : Set, y ∈ x -> y ∈ U) /\
  (forall x : Set, x ∈ U -> exists P : Set,
    P ∈ U /\ IsPowerSetOf x P) /\
  (forall I : Set, I ∈ U ->
    forall family : Set -> Set,
      (forall i : Set, i ∈ I -> family i ∈ U) ->
        exists image : Set,
          image ∈ U /\
          forall y : Set, y ∈ image <-> exists i : Set, i ∈ I /\ y = family i) /\
  (forall I : Set, I ∈ U ->
    forall family : Set -> Set,
      (forall i : Set, i ∈ I -> family i ∈ U) ->
        exists union : Set,
          union ∈ U /\
          forall x : Set, x ∈ union <-> exists i : Set, i ∈ I /\ x ∈ family i)

end LRA.Set.TG
