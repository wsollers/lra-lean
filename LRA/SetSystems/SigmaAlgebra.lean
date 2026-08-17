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

/-- A sigma-ring of sets: a ring of sets closed under countable unions. -/
structure SigmaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

/-- A sigma-algebra of sets: an algebra of sets closed under countable unions. -/
structure SigmaAlgebraOfSets (ambient : SetObject) extends
    AlgebraOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

/-- Every sigma-algebra of sets is a sigma-ring of sets. -/
def SigmaAlgebraOfSets.toSigmaRingOfSets {ambient : SetObject}
    (sigma : SigmaAlgebraOfSets ambient) : SigmaRingOfSets ambient where
  toRingOfSets := sigma.toRingOfSets
  CountableUnionIsMember := sigma.CountableUnionIsMember

end LRA.SetSystems

namespace LRA.Set.Algebra
export LRA.SetSystems (SigmaRingOfSets SigmaAlgebraOfSets)
end LRA.Set.Algebra
