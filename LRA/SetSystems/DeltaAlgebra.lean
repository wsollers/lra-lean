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

/--
`DeltaRingOfSets` TODO

Predicate logic:

  structure DeltaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableIntersectionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableIntersection.countableIntersection family)

Predicate logic (unfolded):

  structure DeltaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableIntersectionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableIntersection.countableIntersection family) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure DeltaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableIntersectionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableIntersection.countableIntersection family)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure DeltaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableIntersectionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableIntersection.countableIntersection family)

end LRA.SetSystems
