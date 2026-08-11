import LRA.VolumeI.Set.Algebra.Ring

namespace LRA.VolumeI.Set.Algebra

open LRA.VolumeI.Set

universe u v

/-!
Delta-rings of sets: the countable-intersection analogue of the
sigma-ring, over the `HasCountableIntersection` capability.
-/

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableIntersection SetObject]

/-- A delta-ring of sets on `ambient`: a ring of sets closed under
countable intersections.

Logical form:

```lean
structure DeltaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableIntersectionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableIntersection.countableIntersection family)
```
-/
structure DeltaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableIntersectionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableIntersection.countableIntersection family)

end LRA.VolumeI.Set.Algebra
