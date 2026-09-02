import LRA.Set.Constructions.TypeSet.Laws

/-!
TypeSet satisfies the generic set API (LRA.Set.Interface). Instances only; the
theorems they package live in Laws/.
-/

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

instance : ExtensionalityLaw Alpha (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : MembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : SeparationLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : UniversalMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : SymmDiffMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : PowersetMembershipLaws
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) := by
  sorry

instance : IndexedMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : CountableMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : CollectionMembershipLaws
    Alpha
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) := by
  sorry

instance : UnionLaws (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : IntersectionLaws (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : SubsetLaws (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : ComplementLaws (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : DifferenceLaws (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : SymmDiffLaws (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : DistributivityLaws (LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

end LRA.Set.Constructions.TypeSet
