import LRA.Function.Properties.Definition

   
                                                                                 
  

namespace LRA.Function

universe u v

                                                              
def HasCollision {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : Domain, first ≠ second ∧ function first = function second

                                                   
def MissesValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ output : Codomain, ∀ input : Domain, function input ≠ output

                                                                                   
def FailsBijective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  HasCollision function ∨ MissesValue function

                                                             
theorem HasCollisionIffNotInjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    HasCollision function ↔ ¬ Injective function := by
  sorry

                                                           
theorem MissesValueIffNotSurjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    MissesValue function ↔ ¬ Surjective function := by
  sorry

end LRA.Function
