import Mathlib.Order.BooleanAlgebra.Set
import Mathlib.Data.Set.SymmDiff
import Mathlib.Tactic.Tauto
import LRA.Set.Constructions.Mathlib.PredicateSet.Laws

/-!
Mathlib's predicate `Set` satisfies the generic set API (LRA.Set.Interface).
Instances only.
-/

namespace LRA.Set.MathlibPredicateSet

universe u

variable {Alpha : Type u}

open scoped symmDiff in
instance : UnionLaws (_root_.Set Alpha) := by
  sorry

instance : IntersectionLaws (_root_.Set Alpha) := by
  sorry

instance : DistributivityLaws (_root_.Set Alpha) := by
  sorry

instance : SubsetLaws (_root_.Set Alpha) := by
  sorry

instance : DifferenceLaws (_root_.Set Alpha) := by
  sorry

open scoped symmDiff in
instance : SymmDiffLaws (_root_.Set Alpha) := by
  sorry

instance : ComplementLaws (_root_.Set Alpha) := by
  sorry

instance : ExtensionalityLaw Alpha (_root_.Set Alpha) := by
  sorry

instance : MembershipLaws Alpha (_root_.Set Alpha) := by
  sorry

instance : SeparationLaws Alpha (_root_.Set Alpha) := by
  sorry

instance : UniversalMembershipLaws Alpha (_root_.Set Alpha) := by
  sorry

open scoped symmDiff in
instance : SymmDiffMembershipLaws Alpha (_root_.Set Alpha) := by
  sorry

instance : PowersetMembershipLaws (_root_.Set Alpha) (_root_.Set (_root_.Set Alpha)) := by
  sorry

instance : IndexedMembershipLaws Alpha (_root_.Set Alpha) := by
  sorry

instance : CountableMembershipLaws Alpha (_root_.Set Alpha) := by
  sorry

instance : CollectionMembershipLaws Alpha (_root_.Set Alpha)
    (_root_.Set (_root_.Set Alpha)) := by
  sorry

end LRA.Set.MathlibPredicateSet
