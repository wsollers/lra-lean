import LRA.Set.Constructions.ZFCSet.Axioms.OrderedPair.Canonical
import LRA.Set.Interface.Definitions.Pairing
import LRA.Set.Interface.Laws.Pairing

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem MemberOfSingletonSet (element candidate : Set) :
    candidate ∈ SingletonSet element ↔ candidate = element := by
  sorry

theorem KuratowskiPairInjective
    (firstLeft secondLeft firstRight secondRight : Set) :
    KuratowskiPair firstLeft firstRight =
        KuratowskiPair secondLeft secondRight ↔
      firstLeft = secondLeft ∧ firstRight = secondRight := by
  sorry

theorem SingletonMemberOfKuratowskiPair (first second : Set) :
    SingletonSet first ∈ KuratowskiPair first second := by
  sorry

noncomputable instance (priority := high) :
    HasPairing Set Set Set :=
  ⟨KuratowskiPair⟩

instance : PairingLaws Set Set Set := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
