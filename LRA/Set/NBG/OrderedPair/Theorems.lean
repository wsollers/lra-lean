import LRA.Set.NBG.Pairing.Theorems
import LRA.Set.Interface.Pairing

namespace LRA.Set.NBG

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

  (∀ element candidate ∈ Set), candidate ∈ SingletonSet element <-> candidate = element

Predicate logic (unfolded):

  ∀ (element candidate : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 (Classical.indefiniteDescription (LRA.Set.NBG.IsPairSet element element) ⋯).1 candidate ↔ candidate = element

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

  (∀ firstLeft secondLeft firstRight secondRight ∈ Set), KuratowskiPair firstLeft firstRight = KuratowskiPair secondLeft secondRight <-> firstLeft = secondLeft ∧ firstRight = secondRight

Predicate logic (unfolded):

  ∀ (firstLeft secondLeft firstRight secondRight : LRA.Set.NBG.Set), Classical.indefiniteDescription (LRA.Set.NBG.IsPairSet (LRA.Set.NBG.SingletonSet firstLeft) (LRA.Set.NBG.PairSet firstLeft firstRight)) ⋯ = .1 (Classical.indefiniteDescription (LRA.Set.NBG.IsPairSet (LRA.Set.NBG.SingletonSet secondLeft) (LRA.Set.NBG.PairSet secondLeft secondRight)) ⋯).1 ↔ (firstLeft = secondLeft ∧ firstRight = secondRight)

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

instance : PairingLaws Set Set Set :=
  ⟨fun firstLeft secondLeft firstRight secondRight =>
    KuratowskiPairInjective firstLeft secondLeft firstRight secondRight⟩

end LRA.Set.NBG
