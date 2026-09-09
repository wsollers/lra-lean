import LRA.Set.Constructions.TGSet.Pairing.Theorems
import LRA.Set.Interface.Definitions.Pairing
import LRA.Set.Interface.Laws.Pairing

namespace LRA.Set.Constructions.TGSet

/--
`SingletonSet` TODO

Predicate logic:

  noncomputable def SingletonSet (element : Set) : Set :=
    PairSet element element

Predicate logic (unfolded):

  noncomputable def SingletonSet (element : Set) : Set :=
    PairSet element element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element
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
noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element

/--
`KuratowskiPair` TODO

Predicate logic:

  noncomputable def KuratowskiPair (first second : Set) : Set :=
    PairSet (SingletonSet first) (PairSet first second)

Predicate logic (unfolded):

  noncomputable def KuratowskiPair (first second : Set) : Set :=
    PairSet (SingletonSet first) (PairSet first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)
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
noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)

/--
`MemberOfSingletonSet` TODO

Predicate logic:

  ∀ (element candidate : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.mem (LRA.Set.Constructions.TGSet.SingletonSet element) candidate ↔ candidate = element

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    element candidate : Set
  Prove
    LRA.Set.Constructions.instMembershipTGSet.mem (LRA.Set.Constructions.TGSet.SingletonSet element) candidate ↔ candidate = element

Logical form (Lean):

```lean
theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element <-> candidate = element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element <-> candidate = element := by
  sorry

/--
`KuratowskiPairInjective` TODO

Predicate logic:

  ∀ (firstLeft secondLeft firstRight secondRight : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.KuratowskiPair firstLeft firstRight = LRA.Set.Constructions.TGSet.KuratowskiPair secondLeft secondRight ↔ (firstLeft = secondLeft ∧ firstRight = secondRight)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    firstLeft secondLeft firstRight secondRight : Set
  Prove
    LRA.Set.Constructions.TGSet.KuratowskiPair firstLeft firstRight = LRA.Set.Constructions.TGSet.KuratowskiPair secondLeft secondRight ↔ (firstLeft = secondLeft ∧ firstRight = secondRight)

Logical form (Lean):

```lean
theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight <->
      firstLeft = secondLeft /\ firstRight = secondRight
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight <->
      firstLeft = secondLeft /\ firstRight = secondRight := by
  sorry

noncomputable instance (priority := high) : HasPairing Set Set Set :=
  ⟨KuratowskiPair⟩

end LRA.Set.Constructions.TGSet

