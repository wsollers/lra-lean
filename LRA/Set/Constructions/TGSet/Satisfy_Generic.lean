import LRA.Set.Constructions.TGSet.Laws
import LRA.Set.Constructions.TGSet.OrderedPair.Theorems

/-!
TGSet satisfies the generic set API (LRA.Set.Interface). Instances only; the
theorems they package live in Laws/ (and OrderedPair/Theorems.lean for
PairingLaws).
-/

namespace LRA.Set.Constructions.TGSet

instance : ExtensionalityLaw Set Set := by
  sorry

instance : MembershipLaws Set Set := by
  sorry

instance : SeparationLaws Set Set := by
  sorry

instance : SymmDiffMembershipLaws Set Set := by
  sorry

instance : PowersetMembershipLaws Set Set := by
  sorry

instance : CollectionMembershipLaws Set Set Set := by
  sorry

instance : UnionLaws Set := by
  sorry

instance : IntersectionLaws Set := by
  sorry

instance : SubsetLaws Set := by
  sorry

instance : DifferenceLaws Set := by
  sorry

instance : SymmDiffLaws Set := by
  sorry

instance : DistributivityLaws Set := by
  sorry

instance : PairingLaws Set Set Set := by
  sorry

end LRA.Set.Constructions.TGSet
