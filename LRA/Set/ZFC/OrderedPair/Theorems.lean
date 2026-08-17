import LRA.Set.ZFC.Pairing.Theorems
import LRA.Set.Interface.Pairing

/-!
Kuratowski ordered pairs for the in-house ZFC universe.

The construction is derived from Pairing. The registered `HasPairing` and
`PairingLaws` instances make this realization available through the generic Set
interface without changing the underlying relation/function vocabulary.
-/

namespace LRA.Set.ZFC

/-- The singleton `{a} = {a, a}`. -/
noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element

/-- The Kuratowski ordered pair `⟨a, b⟩ = {{a}, {a, b}}`. -/
noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)

/-- The singleton's only member is its element. -/
theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element ↔ candidate = element := by
  sorry

/-- Enderton's Theorem 3A: equality of Kuratowski pairs determines equality of
coordinates. -/
theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight ↔
      firstLeft = secondLeft ∧ firstRight = secondRight := by
  sorry

/-- The first coordinate's singleton is a member of the Kuratowski pair. -/
theorem SingletonMemberOfKuratowskiPair (first second : Set) :
    SingletonSet first ∈ KuratowskiPair first second := by
  sorry

/-- On ZFC sets, the generic pairing interface is realized by Kuratowski pairs. -/
noncomputable instance (priority := high) :
    HasPairing Set Set Set :=
  ⟨KuratowskiPair⟩

/-- Kuratowski pairing satisfies the generic pairing injectivity law. -/
instance : PairingLaws Set Set Set :=
  ⟨fun firstLeft secondLeft firstRight secondRight =>
    KuratowskiPairInjective firstLeft secondLeft firstRight secondRight⟩

end LRA.Set.ZFC

/-! Compatibility aliases for the historical Enderton ordered-pair names. -/
namespace LRA.Set.Enderton

noncomputable abbrev SingletonSet (element : Set) : Set :=
  LRA.Set.ZFC.SingletonSet element

noncomputable abbrev KuratowskiPair (first second : Set) : Set :=
  LRA.Set.ZFC.KuratowskiPair first second

abbrev MemberOfSingletonSet (element candidate : Set) :=
  LRA.Set.ZFC.MemberOfSingletonSet element candidate

abbrev KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :=
  LRA.Set.ZFC.KuratowskiPairInjective
    firstLeft secondLeft firstRight secondRight

abbrev SingletonMemberOfKuratowskiPair (first second : Set) :=
  LRA.Set.ZFC.SingletonMemberOfKuratowskiPair first second

end LRA.Set.Enderton
