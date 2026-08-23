import LRA.SetSystems.RingOfSets

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]

                                                                                  
structure AlgebraOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  AmbientIsMember : IsMember ambient

namespace AlgebraOfSets

variable {ambient : SetObject}

                                                   
theorem RelativeComplementIsMember
    (algebra : AlgebraOfSets ambient)
    (A : SetObject) (AIsMember : algebra.IsMember A) :
    algebra.IsMember (ambient \ A) := by
  sorry

end AlgebraOfSets

end LRA.SetSystems
