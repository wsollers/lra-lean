import Mathlib.Order.BooleanAlgebra.Set
import Mathlib.Data.Set.SymmDiff
import Mathlib.Tactic.Tauto
import LRA.Set.Interop.Mathlib.PredicateSet.Instances
import LRA.Set.Interface

/-!
Certificate registrations for the `MathlibPredicateSet` backend: every law
family and every membership family, each field dispatching to Mathlib's
own lemma for `Set` (or to a one-line `ext`/`simp` bridge where Mathlib
states the fact in a different shape). Nothing here is `sorry` -- this
backend's whole point is that Mathlib has already done the proving.
-/

namespace LRA.Set.MathlibPredicateSet

universe u

variable {Alpha : Type u}

open scoped symmDiff in
instance : UnionLaws (_root_.Set Alpha) where
  UnionCommutative := fun A B => _root_.Set.union_comm A B
  UnionAssociative := fun A B C => _root_.Set.union_assoc A B C
  EmptyUnion := fun A => _root_.Set.empty_union A
  UnionEmpty := fun A => _root_.Set.union_empty A
  UnionIdempotent := fun A => _root_.Set.union_self A
  UnionMonotone := fun _ _ _ _ hA hB => _root_.Set.union_subset_union hA hB
  SubsetIffUnionEqRight := fun A B => (_root_.Set.union_eq_right (s := A) (t := B)).symm

instance : IntersectionLaws (_root_.Set Alpha) where
  IntersectionCommutative := fun A B => _root_.Set.inter_comm A B
  IntersectionAssociative := fun A B C => _root_.Set.inter_assoc A B C
  EmptyIntersection := fun A => _root_.Set.empty_inter A
  IntersectionEmpty := fun A => _root_.Set.inter_empty A
  IntersectionIdempotent := fun A => _root_.Set.inter_self A
  IntersectionMonotone := fun _ _ _ _ hA hB => _root_.Set.inter_subset_inter hA hB
  SubsetIffIntersectionEqLeft := fun A B => (_root_.Set.inter_eq_left (s := A) (t := B)).symm

instance : DistributivityLaws (_root_.Set Alpha) where
  IntersectionDistributesOverUnion := fun A B C =>
    _root_.Set.inter_union_distrib_left A B C
  UnionDistributesOverIntersection := fun A B C =>
    _root_.Set.union_inter_distrib_left A B C
  AbsorptionUnionIntersection := fun A B => sup_inf_self
  AbsorptionIntersectionUnion := fun A B => inf_sup_self

instance : SubsetLaws (_root_.Set Alpha) where
  SubsetReflexive := fun A => _root_.Set.Subset.refl A
  SubsetTransitive := fun _ _ _ hAB hBC => _root_.Set.Subset.trans hAB hBC
  SetEqualityIffMutualSubset := fun A B => _root_.Set.Subset.antisymm_iff

instance : DifferenceLaws (_root_.Set Alpha) where
  DifferenceMonotoneLeft := fun _ _ B h => _root_.Set.diff_subset_diff_left h
  DifferenceAntitoneRight := fun A _ _ h => _root_.Set.diff_subset_diff_right h
  DifferenceEmpty := fun A => _root_.Set.diff_empty
  EmptyDifference := fun A => _root_.Set.empty_diff A
  DifferenceSelf := fun A => _root_.Set.diff_self
  DifferenceUnion := fun A B C => by ext x; simp; tauto
  DifferenceIntersection := fun A B C => by ext x; simp; tauto
  UnionDifferenceDistributes := fun A B C => _root_.Set.union_diff_distrib
  IntersectionDifferenceDistributes := fun A B C => by ext x; simp; tauto
  DifferenceSubsetLeft := fun A B => _root_.Set.diff_subset
  DifferenceDisjointRight := fun A B => by ext x; simp

open scoped symmDiff in
instance : SymmDiffLaws (_root_.Set Alpha) where
  SymmetricDifferenceAsUnionDifferences := fun A B => symmDiff_def A B
  SymmetricDifferenceAsUnionDifferenceIntersection := fun A B =>
    symmDiff_eq_sup_sdiff_inf A B
  SymmetricDifferenceCommutative := fun A B => symmDiff_comm A B
  SymmetricDifferenceAssociative := fun A B C => symmDiff_assoc A B C
  SymmetricDifferenceEmpty := fun A => symmDiff_bot A
  EmptySymmetricDifference := fun A => bot_symmDiff A
  SymmetricDifferenceSelf := fun A => symmDiff_self A
  SymmetricDifferenceEqEmptyIff := fun A B => symmDiff_eq_bot
  SymmetricDifferenceSubsetUnion := fun A B => symmDiff_le_sup

instance : ComplementLaws (_root_.Set Alpha) where
  DoubleComplement := fun A => compl_compl A
  ComplementEmpty := _root_.Set.compl_empty
  ComplementUniversal := _root_.Set.compl_univ
  UnionComplement := fun A => _root_.Set.union_compl_self A
  IntersectionComplement := fun A => _root_.Set.inter_compl_self A
  DeMorganUnion := fun A B => _root_.Set.compl_union A B
  DeMorganIntersection := fun A B => _root_.Set.compl_inter A B
  DifferenceAsIntersectionComplement := fun A B => _root_.Set.diff_eq A B
  DifferenceUniversal := fun A => sdiff_top A
  UniversalDifference := fun A => top_sdiff

instance : ExtensionalityLaw Alpha (_root_.Set Alpha) where
  SetExtensionality := fun h => _root_.Set.ext h

instance : MembershipLaws Alpha (_root_.Set Alpha) where
  EmptyMembership := fun x => _root_.Set.notMem_empty x
  UnionMembership := fun A B x => _root_.Set.mem_union x A B
  IntersectionMembership := fun A B x => _root_.Set.mem_inter_iff x A B
  DifferenceMembership := fun A B x => _root_.Set.mem_diff x
  SubsetIffAllMembers := fun A B => Iff.rfl

instance : SeparationLaws Alpha (_root_.Set Alpha) where
  SeparationMembership := fun A p x => _root_.Set.mem_sep_iff

instance : UniversalMembershipLaws Alpha (_root_.Set Alpha) where
  UniversalMembership := fun x => _root_.Set.mem_univ x
  ComplementMembership := fun A x => _root_.Set.mem_compl_iff A x

open scoped symmDiff in
instance : SymmDiffMembershipLaws Alpha (_root_.Set Alpha) where
  SymmetricDifferenceMembership := fun A B x => _root_.Set.mem_symmDiff

instance : PowersetMembershipLaws (_root_.Set Alpha) (_root_.Set (_root_.Set Alpha)) where
  PowersetMembership := fun A B => _root_.Set.mem_powerset_iff B A

instance : IndexedMembershipLaws Alpha (_root_.Set Alpha) where
  IndexedUnionMembership := fun _ _ => _root_.Set.mem_iUnion
  IndexedIntersectionMembership := fun _ _ => _root_.Set.mem_iInter

instance : CountableMembershipLaws Alpha (_root_.Set Alpha) where
  CountableUnionMembership := fun _ _ => _root_.Set.mem_iUnion
  CountableIntersectionMembership := fun _ _ => _root_.Set.mem_iInter

instance : CollectionMembershipLaws Alpha (_root_.Set Alpha)
    (_root_.Set (_root_.Set Alpha)) where
  CollectionUnionMembership := fun _ _ => _root_.Set.mem_sUnion
  CollectionIntersectionMembership := fun _ _ _ => _root_.Set.mem_sInter

end LRA.Set.MathlibPredicateSet
