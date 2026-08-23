import LRA.SetSystems.AlgebraOfSets

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableUnion SetObject]

                                                                          
structure SigmaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

                                                                                 
structure SigmaAlgebraOfSets (ambient : SetObject) extends
    AlgebraOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

                                                           
def SigmaAlgebraOfSets.toSigmaRingOfSets {ambient : SetObject}
    (sigma : SigmaAlgebraOfSets ambient) : SigmaRingOfSets ambient where
  toRingOfSets := sigma.toRingOfSets
  CountableUnionIsMember := sigma.CountableUnionIsMember

end LRA.SetSystems
