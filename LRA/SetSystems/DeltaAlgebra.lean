import LRA.SetSystems.RingOfSets

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableIntersection SetObject]

                                                                                 
structure DeltaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableIntersectionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableIntersection.countableIntersection family)

end LRA.SetSystems
