import LRA.Set.Constructions.ZFCSet.Laws

/-!
ZFCSet satisfies the generic set API (LRA.Set.Interface). Instances only; the
theorems they package live in Laws/.
-/

namespace LRA.Set.Constructions.ZFCSet

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

end LRA.Set.Constructions.ZFCSet
