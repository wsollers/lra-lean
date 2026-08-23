import LRA.Identity.Axioms
import LRA.Identity.Distinctness
import LRA.Identity.Uniqueness
import LRA.Identity.ExistenceAndUniqueness
import LRA.Identity.Interface.ModelTheory.LStructure

namespace LRA.Identity

universe u

                                          

                                                            
structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y

                                                              
theorem NativeEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier := by
  sorry

                                                                                
def Exists {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∃ x, predicate x

                                                                           
def AtLeastTwo (Carrier : Type u) : Prop :=
  ∃ x y : Carrier, Distinct x y

                                                                          
def AtMostTwo (Carrier : Type u) : Prop :=
  ∀ x y z : Carrier, x = y ∨ y = z ∨ x = z

end LRA.Identity
