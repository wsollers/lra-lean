import LRA.Set.Constructions.ZFCSet.Axioms.OrderedPair.Canonical
import LRA.Set.Interface.Definitions.Pairing
import LRA.Set.Interface.Laws.Pairing

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`MemberOfSingletonSet` TODO

Predicate logic:

  ∀ (element candidate : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.SingletonSet element) candidate ↔ candidate = element

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    element candidate : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.SingletonSet element) candidate ↔ candidate = element

Logical form (Lean):

```lean
theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element ↔ candidate = element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element ↔ candidate = element := by
  sorry

/--
`KuratowskiPairInjective` TODO

Predicate logic:

  ∀ (firstLeft secondLeft firstRight secondRight : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.KuratowskiPair firstLeft firstRight = LRA.Set.Constructions.ZFCSet.Axioms.KuratowskiPair secondLeft secondRight ↔ (firstLeft = secondLeft ∧ firstRight = secondRight)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    firstLeft secondLeft firstRight secondRight : Set
  Prove
    LRA.Set.Constructions.ZFCSet.Axioms.KuratowskiPair firstLeft firstRight = LRA.Set.Constructions.ZFCSet.Axioms.KuratowskiPair secondLeft secondRight ↔ (firstLeft = secondLeft ∧ firstRight = secondRight)

Logical form (Lean):

```lean
theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight ↔
      firstLeft = secondLeft ∧ firstRight = secondRight
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight ↔
      firstLeft = secondLeft ∧ firstRight = secondRight := by
  sorry

/--
`SingletonMemberOfKuratowskiPair` TODO

Predicate logic:

  ∀ (first second : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.KuratowskiPair first second) (LRA.Set.Constructions.ZFCSet.Axioms.SingletonSet first)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    first second : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet (LRA.Set.Constructions.ZFCSet.Axioms.SingletonSet first) (LRA.Set.Constructions.ZFCSet.Axioms.PairSet first second)) ⋯).1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet first first) ⋯).1

Logical form (Lean):

```lean
theorem SingletonMemberOfKuratowskiPair (first second : Set) :
    SingletonSet first ∈ KuratowskiPair first second
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
theorem SingletonMemberOfKuratowskiPair (first second : Set) :
    SingletonSet first ∈ KuratowskiPair first second := by
  sorry

noncomputable instance (priority := high) :
    HasPairing Set Set Set :=
  ⟨KuratowskiPair⟩

instance : PairingLaws Set Set Set := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
