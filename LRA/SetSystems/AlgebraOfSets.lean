import LRA.SetSystems.RingOfSets

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]

/--
`AlgebraOfSets` TODO

Predicate logic:

  structure AlgebraOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  AmbientIsMember : IsMember ambient

Predicate logic (unfolded):

  structure AlgebraOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  AmbientIsMember : IsMember ambient (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure AlgebraOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  AmbientIsMember : IsMember ambient
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure AlgebraOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  AmbientIsMember : IsMember ambient

namespace AlgebraOfSets

variable {ambient : SetObject}

/--
`RelativeComplementIsMember` TODO

Predicate logic:

  (∀ A ∈ U), algebra.IsMember (ambient \ A)

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] {ambient : SetObject} (algebra : LRA.SetSystems.AlgebraOfSets ambient) (A : SetObject), algebra.toRingOfSets.1 A → algebra.toRingOfSets.1 (inst_2.1 ambient A)

Logical form (Lean):

```lean
theorem RelativeComplementIsMember
    (algebra : AlgebraOfSets ambient)
    (A : SetObject) (AIsMember : algebra.IsMember A) :
    algebra.IsMember (ambient \ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem RelativeComplementIsMember
    (algebra : AlgebraOfSets ambient)
    (A : SetObject) (AIsMember : algebra.IsMember A) :
    algebra.IsMember (ambient \ A) := by
  sorry

end AlgebraOfSets

end LRA.SetSystems
