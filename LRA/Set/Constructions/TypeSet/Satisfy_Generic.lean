import LRA.Set.Constructions.TypeSet.Laws

/-!
TypeSet satisfies the generic set API (LRA.Set.Interface). Instances only; the
theorems they package live in Laws/.
-/

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

instance : ExtensionalityLaw Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  SetExtensionality := LRA.Set.Constructions.TypeSetExtensionality

instance : MembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  EmptyMembership := NotMemberOfEmpty
  UnionMembership := UnionMembership
  IntersectionMembership := IntersectionMembership
  DifferenceMembership := DifferenceMembership
  SubsetIffAllMembers := SubsetIff

instance : SeparationLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  SeparationMembership := SeparationMembership

instance : UniversalMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  UniversalMembership := UniversalMembership
  ComplementMembership := ComplementMembership

instance : SymmDiffMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  SymmetricDifferenceMembership := SymmetricDifferenceMembership

instance : PowersetMembershipLaws
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) where
  PowersetMembership := PowerSetMembership

instance : IndexedMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  IndexedUnionMembership := fun family x => IndexedUnionMembership family x
  IndexedIntersectionMembership := fun family x =>
    IndexedIntersectionMembership family x

instance : CountableMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  CountableUnionMembership := fun family x => IndexedUnionMembership family x
  CountableIntersectionMembership := fun family x =>
    IndexedIntersectionMembership family x

instance : CollectionMembershipLaws
    Alpha
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) where
  CollectionUnionMembership := fun C x => CollectionUnionMembership C x
  CollectionIntersectionMembership := fun C x _ =>
    CollectionIntersectionMembership C x

instance : UnionLaws (LRA.Set.Constructions.TypeSet Alpha) where
  UnionCommutative := LRA.Set.Constructions.TypeSet.UnionCommutative
  UnionAssociative := LRA.Set.Constructions.TypeSet.UnionAssociative
  EmptyUnion := LRA.Set.Constructions.TypeSet.EmptyUnion
  UnionEmpty := LRA.Set.Constructions.TypeSet.UnionEmpty
  UnionIdempotent := LRA.Set.Constructions.TypeSet.UnionIdempotent
  UnionMonotone := LRA.Set.Constructions.TypeSet.UnionMonotone
  SubsetIffUnionEqRight := LRA.Set.Constructions.TypeSet.SubsetIffUnionEqRight

instance : IntersectionLaws (LRA.Set.Constructions.TypeSet Alpha) where
  IntersectionCommutative := LRA.Set.Constructions.TypeSet.IntersectionCommutative
  IntersectionAssociative := LRA.Set.Constructions.TypeSet.IntersectionAssociative
  EmptyIntersection := LRA.Set.Constructions.TypeSet.EmptyIntersection
  IntersectionEmpty := LRA.Set.Constructions.TypeSet.IntersectionEmpty
  IntersectionIdempotent := LRA.Set.Constructions.TypeSet.IntersectionIdempotent
  IntersectionMonotone := LRA.Set.Constructions.TypeSet.IntersectionMonotone
  SubsetIffIntersectionEqLeft :=
    LRA.Set.Constructions.TypeSet.SubsetIffIntersectionEqLeft

instance : SubsetLaws (LRA.Set.Constructions.TypeSet Alpha) where
  SubsetReflexive := LRA.Set.Constructions.TypeSet.SubsetReflexive
  SubsetTransitive := LRA.Set.Constructions.TypeSet.SubsetTransitive
  SetEqualityIffMutualSubset :=
    LRA.Set.Constructions.TypeSet.SetEqualityIffMutualSubset

instance : ComplementLaws (LRA.Set.Constructions.TypeSet Alpha) where
  DoubleComplement := LRA.Set.Constructions.TypeSet.DoubleComplement
  ComplementEmpty := LRA.Set.Constructions.TypeSet.ComplementEmpty
  ComplementUniversal := LRA.Set.Constructions.TypeSet.ComplementUniversal
  UnionComplement := LRA.Set.Constructions.TypeSet.UnionComplement
  IntersectionComplement := LRA.Set.Constructions.TypeSet.IntersectionComplement
  DeMorganUnion := LRA.Set.Constructions.TypeSet.DeMorganUnion
  DeMorganIntersection := LRA.Set.Constructions.TypeSet.DeMorganIntersection
  DifferenceAsIntersectionComplement :=
    LRA.Set.Constructions.TypeSet.DifferenceAsIntersectionComplement
  DifferenceUniversal := LRA.Set.Constructions.TypeSet.DifferenceUniversal
  UniversalDifference := LRA.Set.Constructions.TypeSet.UniversalDifference

instance : DifferenceLaws (LRA.Set.Constructions.TypeSet Alpha) where
  DifferenceMonotoneLeft := LRA.Set.Constructions.TypeSet.DifferenceMonotoneLeft
  DifferenceAntitoneRight := LRA.Set.Constructions.TypeSet.DifferenceAntitoneRight
  DifferenceEmpty := LRA.Set.Constructions.TypeSet.DifferenceEmpty
  EmptyDifference := LRA.Set.Constructions.TypeSet.EmptyDifference
  DifferenceSelf := LRA.Set.Constructions.TypeSet.DifferenceSelf
  DifferenceUnion := LRA.Set.Constructions.TypeSet.DifferenceUnion
  DifferenceIntersection := LRA.Set.Constructions.TypeSet.DifferenceIntersection
  UnionDifferenceDistributes :=
    LRA.Set.Constructions.TypeSet.UnionDifferenceDistributes
  IntersectionDifferenceDistributes :=
    LRA.Set.Constructions.TypeSet.IntersectionDifferenceDistributes
  DifferenceSubsetLeft := LRA.Set.Constructions.TypeSet.DifferenceSubsetLeft
  DifferenceDisjointRight := LRA.Set.Constructions.TypeSet.DifferenceDisjointRight

instance : SymmDiffLaws (LRA.Set.Constructions.TypeSet Alpha) where
  SymmetricDifferenceAsUnionDifferences :=
    LRA.Set.Constructions.TypeSet.SymmetricDifferenceAsUnionDifferences
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    LRA.Set.Constructions.TypeSet.SymmetricDifferenceAsUnionDifferenceIntersection
  SymmetricDifferenceCommutative :=
    LRA.Set.Constructions.TypeSet.SymmetricDifferenceCommutative
  SymmetricDifferenceAssociative :=
    LRA.Set.Constructions.TypeSet.SymmetricDifferenceAssociative
  SymmetricDifferenceEmpty :=
    LRA.Set.Constructions.TypeSet.SymmetricDifferenceEmpty
  EmptySymmetricDifference :=
    LRA.Set.Constructions.TypeSet.EmptySymmetricDifference
  SymmetricDifferenceSelf :=
    LRA.Set.Constructions.TypeSet.SymmetricDifferenceSelf
  SymmetricDifferenceEqEmptyIff :=
    LRA.Set.Constructions.TypeSet.SymmetricDifferenceEqEmptyIff
  SymmetricDifferenceSubsetUnion :=
    LRA.Set.Constructions.TypeSet.SymmetricDifferenceSubsetUnion

instance : DistributivityLaws (LRA.Set.Constructions.TypeSet Alpha) where
  IntersectionDistributesOverUnion :=
    LRA.Set.Constructions.TypeSet.IntersectionDistributesOverUnion
  UnionDistributesOverIntersection :=
    LRA.Set.Constructions.TypeSet.UnionDistributesOverIntersection
  AbsorptionUnionIntersection :=
    LRA.Set.Constructions.TypeSet.AbsorptionUnionIntersection
  AbsorptionIntersectionUnion :=
    LRA.Set.Constructions.TypeSet.AbsorptionIntersectionUnion

end LRA.Set.Constructions.TypeSet
