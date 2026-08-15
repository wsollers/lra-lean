import LRA.VolumeI.Set.Algebra.BooleanAlgebra

namespace LRA.Set.Algebra

open LRA.Set

universe u v

/-!
Sigma-rings and sigma-algebras of sets, relative to an ambient set.

The countable-union operation comes from the `HasCountableUnion`
capability class: `LRASet` and Mathlib's `Set` take it as `Nat`-indexed
union, Mathlib's `ZFSet` derives it via Replacement (`⋃₀ (range f)`),
and Enderton cannot register it until naturals-as-sets exist -- so
sigma-structures are available exactly at the backends that can express
them, enforced by instance search rather than convention.
-/

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableUnion SetObject]

/-- A sigma-ring of sets on `ambient`: a ring of sets closed under
countable unions.

Logical form:

```lean
structure SigmaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)
```
-/
structure SigmaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

/-- A sigma-algebra of sets on `ambient`: an algebra of sets closed under
countable unions. This is the measurable-space structure.

Logical form:

```lean
structure SigmaAlgebraOfSets (ambient : SetObject) extends
    AlgebraOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)
```
-/
structure SigmaAlgebraOfSets (ambient : SetObject) extends
    AlgebraOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

/-- Every sigma-algebra of sets is a sigma-ring of sets.

Logical form:

```lean
def SigmaAlgebraOfSets.toSigmaRingOfSets {ambient : SetObject}
    (sigma : SigmaAlgebraOfSets ambient) : SigmaRingOfSets ambient where
  toRingOfSets := sigma.toRingOfSets
  CountableUnionIsMember := sigma.CountableUnionIsMember
```
-/
def SigmaAlgebraOfSets.toSigmaRingOfSets {ambient : SetObject}
    (sigma : SigmaAlgebraOfSets ambient) : SigmaRingOfSets ambient where
  toRingOfSets := sigma.toRingOfSets
  CountableUnionIsMember := sigma.CountableUnionIsMember

end LRA.Set.Algebra
