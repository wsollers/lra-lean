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

/--
`SigmaRingOfSets` TODO

Predicate logic:

  structure SigmaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

Predicate logic (unfolded):

  structure SigmaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SigmaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)
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
structure SigmaRingOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

/--
`SigmaAlgebraOfSets` TODO

Predicate logic:

  structure SigmaAlgebraOfSets (ambient : SetObject) extends
    AlgebraOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

Predicate logic (unfolded):

  structure SigmaAlgebraOfSets (ambient : SetObject) extends
    AlgebraOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SigmaAlgebraOfSets (ambient : SetObject) extends
    AlgebraOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)
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
structure SigmaAlgebraOfSets (ambient : SetObject) extends
    AlgebraOfSets ambient where
  CountableUnionIsMember :
    ∀ family : Nat → SetObject,
      (∀ index, IsMember (family index)) →
        IsMember (HasCountableUnion.countableUnion family)

/--
`SigmaAlgebraOfSets.toSigmaRingOfSets` TODO

Predicate logic:

  def SigmaAlgebraOfSets.toSigmaRingOfSets {ambient : SetObject}
    (sigma : SigmaAlgebraOfSets ambient) : SigmaRingOfSets ambient where
  toRingOfSets := sigma.toRingOfSets
  CountableUnionIsMember := sigma.CountableUnionIsMember

Predicate logic (unfolded):

  def SigmaAlgebraOfSets.toSigmaRingOfSets {ambient : SetObject}
    (sigma : SigmaAlgebraOfSets ambient) : SigmaRingOfSets ambient where
  toRingOfSets := sigma.toRingOfSets
  CountableUnionIsMember := sigma.CountableUnionIsMember (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SigmaAlgebraOfSets.toSigmaRingOfSets {ambient : SetObject}
    (sigma : SigmaAlgebraOfSets ambient) : SigmaRingOfSets ambient where
  toRingOfSets := sigma.toRingOfSets
  CountableUnionIsMember := sigma.CountableUnionIsMember
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def SigmaAlgebraOfSets.toSigmaRingOfSets {ambient : SetObject}
    (sigma : SigmaAlgebraOfSets ambient) : SigmaRingOfSets ambient where
  toRingOfSets := sigma.toRingOfSets
  CountableUnionIsMember := sigma.CountableUnionIsMember

end LRA.SetSystems
