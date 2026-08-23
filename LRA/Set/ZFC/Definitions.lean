import LRA.Set.ZFCSet.Primitives
import LRA.Identity.ExistenceAndUniqueness

   
                                                            

                                                                   
  

namespace LRA.Set.ZFC

abbrev Set := LRA.Set.ZFCSet

                                                            
abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

                                                     
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

                                            
def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2

                                       
def IsSingletonSet (x S : Set) : Prop :=
  ∀ w : Set, w ∈ S ↔ w = x

                                                 
def IsUnionOf (A U : Set) : Prop :=
  ∀ x : Set, x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B

                                   
def IsPowerSetOf (A P : Set) : Prop :=
  ∀ x : Set, x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A

                                                        
def IsSeparatedSubset (A : Set) (property : Set → Prop) (B : Set) : Prop :=
  ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x

                                                    
def IsRelativeComplementOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∉ B

                                              
def IsIntersectionOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∈ B

                                                      
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

                              
def Subset (A B : Set) : Prop :=
  ∀ x : Set, x ∈ A → x ∈ B

                                                                   
def IsFunctionalOn (A : Set) (relation : Set → Set → Prop) : Prop :=
  ∀ x : Set, x ∈ A →
    ∃ y : Set,
      relation x y ∧
      ∀ other : Set, relation x other → other = y

                                                            
def IsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop) (B : Set) : Prop :=
  ∀ y : Set, y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y

                                           
def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x

                               
def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor

                                           
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A

                                                      
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  ∀ B : Set, B ∈ A →
    ∃ x : Set,
      (x ∈ B ∧ x ∈ choiceSet) ∧
      ∀ other : Set, (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.Set.ZFC
