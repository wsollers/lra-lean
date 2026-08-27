import LRA.Set.Constructions.ZFCSet.Laws

/-!
ZFCSet satisfies the generic set API (LRA.Set.Interface). Instances only; the
theorems they package live in Laws/.
-/

namespace LRA.Set.Constructions.ZFCSet

instance : ExtensionalityLaw Set Set where
  SetExtensionality := fun {A B} h => LRA.Set.Constructions.ZFCSet.Axioms.SetExtensionality A B h

instance : MembershipLaws Set Set where
  EmptyMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheEmptySetIsEmpty
  UnionMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheUnionMembership
  IntersectionMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheIntersectionMembership
  DifferenceMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplementMembership
  SubsetIffAllMembers := SubsetIffAllMembers

instance : SeparationLaws Set Set where
  SeparationMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheSeparatedSubsetIsSeparatedSubset

instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheSymmetricDifferenceMembership

instance : PowersetMembershipLaws Set Set where
  PowersetMembership := LRA.Set.Constructions.ZFCSet.Axioms.ThePowerSetIsPowerSetOf

instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => LRA.Set.Constructions.ZFCSet.Axioms.TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    LRA.Set.Constructions.ZFCSet.Axioms.TheIntersectionOverMembership C x h

instance : UnionLaws Set where
  UnionCommutative := UnionCommutative
  UnionAssociative := UnionAssociative
  EmptyUnion := EmptyUnion
  UnionEmpty := UnionEmpty
  UnionIdempotent := UnionIdempotent
  UnionMonotone := UnionMonotone
  SubsetIffUnionEqRight := SubsetIffUnionEqRight

instance : IntersectionLaws Set where
  IntersectionCommutative := IntersectionCommutative
  IntersectionAssociative := IntersectionAssociative
  EmptyIntersection := EmptyIntersection
  IntersectionEmpty := IntersectionEmpty
  IntersectionIdempotent := IntersectionIdempotent
  IntersectionMonotone := IntersectionMonotone
  SubsetIffIntersectionEqLeft := SubsetIffIntersectionEqLeft

instance : SubsetLaws Set where
  SubsetReflexive := SubsetReflexive
  SubsetTransitive := SubsetTransitive
  SetEqualityIffMutualSubset := SetEqualityIffMutualSubset

instance : DifferenceLaws Set where
  DifferenceMonotoneLeft := DifferenceMonotoneLeft
  DifferenceAntitoneRight := DifferenceAntitoneRight
  DifferenceEmpty := DifferenceEmpty
  EmptyDifference := EmptyDifference
  DifferenceSelf := DifferenceSelf
  DifferenceUnion := DifferenceUnion
  DifferenceIntersection := DifferenceIntersection
  UnionDifferenceDistributes := UnionDifferenceDistributes
  IntersectionDifferenceDistributes := IntersectionDifferenceDistributes
  DifferenceSubsetLeft := DifferenceSubsetLeft
  DifferenceDisjointRight := DifferenceDisjointRight

instance : SymmDiffLaws Set where
  SymmetricDifferenceAsUnionDifferences := SymmetricDifferenceAsUnionDifferences
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    SymmetricDifferenceAsUnionDifferenceIntersection
  SymmetricDifferenceCommutative := SymmetricDifferenceCommutative
  SymmetricDifferenceAssociative := SymmetricDifferenceAssociative
  SymmetricDifferenceEmpty := SymmetricDifferenceEmpty
  EmptySymmetricDifference := EmptySymmetricDifference
  SymmetricDifferenceSelf := SymmetricDifferenceSelf
  SymmetricDifferenceEqEmptyIff := SymmetricDifferenceEqEmptyIff
  SymmetricDifferenceSubsetUnion := SymmetricDifferenceSubsetUnion

instance : DistributivityLaws Set where
  IntersectionDistributesOverUnion := IntersectionDistributesOverUnion
  UnionDistributesOverIntersection := UnionDistributesOverIntersection
  AbsorptionUnionIntersection := AbsorptionUnionIntersection
  AbsorptionIntersectionUnion := AbsorptionIntersectionUnion

end LRA.Set.Constructions.ZFCSet
