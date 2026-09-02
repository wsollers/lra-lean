import Mathlib.Tactic.Tauto
import LRA.Set.Constructions.Mathlib.ZFSet.Laws
import LRA.Set.Constructions.Mathlib.ZFSet.Pairing

/-!
Mathlib's ZFSet satisfies the generic set API (LRA.Set.Interface). Instances
only; the theorems they package live in Laws.lean (and Pairing.lean for
PairingLaws).
-/

namespace LRA.Set.MathlibZFSet

instance : ExtensionalityLaw ZFSet ZFSet := by
  sorry

instance : MembershipLaws ZFSet ZFSet := by
  sorry

instance : SeparationLaws ZFSet ZFSet := by
  sorry

instance : SymmDiffMembershipLaws ZFSet ZFSet := by
  sorry

instance : PowersetMembershipLaws ZFSet ZFSet := by
  sorry

instance : UnionLaws ZFSet := by
  sorry

instance : IntersectionLaws ZFSet := by
  sorry

instance : DistributivityLaws ZFSet := by
  sorry

instance : SubsetLaws ZFSet := by
  sorry

instance : DifferenceLaws ZFSet := by
  sorry

instance : SymmDiffLaws ZFSet := by
  sorry

instance : CollectionMembershipLaws ZFSet ZFSet ZFSet := by
  sorry

instance : CountableMembershipLaws ZFSet ZFSet := by
  sorry

instance : PairingLaws ZFSet ZFSet ZFSet := by
  sorry

end LRA.Set.MathlibZFSet
