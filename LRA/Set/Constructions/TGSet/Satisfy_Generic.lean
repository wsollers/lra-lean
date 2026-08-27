import LRA.Set.Constructions.TGSet.Laws
import LRA.Set.Constructions.TGSet.OrderedPair.Theorems

/-!
TGSet satisfies the generic set API (LRA.Set.Interface). Instances only; the
theorems they package live in Laws/ (and OrderedPair/Theorems.lean for
PairingLaws).
-/

namespace LRA.Set.Constructions.TGSet

instance : ExtensionalityLaw Set Set where
  SetExtensionality := fun {A B} h => LRA.Set.Constructions.TGSet.SetExtensionality A B h

instance : MembershipLaws Set Set where
  EmptyMembership := LRA.Set.Constructions.TGSet.TheEmptySetIsEmpty
  UnionMembership := LRA.Set.Constructions.TGSet.TheUnionMembership
  IntersectionMembership := LRA.Set.Constructions.TGSet.TheIntersectionMembership
  DifferenceMembership := LRA.Set.Constructions.TGSet.TheRelativeComplementMembership
  SubsetIffAllMembers := SubsetIffAllMembers

instance : SeparationLaws Set Set where
  SeparationMembership := LRA.Set.Constructions.TGSet.TheSeparatedSubsetIsSeparatedSubset

instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := LRA.Set.Constructions.TGSet.TheSymmetricDifferenceMembership

instance : PowersetMembershipLaws Set Set where
  PowersetMembership := LRA.Set.Constructions.TGSet.ThePowerSetIsPowerSetOf

instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => LRA.Set.Constructions.TGSet.TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    LRA.Set.Constructions.TGSet.TheIntersectionOverMembership C x h

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
  IntersectionIdempotent := IntersectionIdempotent
  EmptyIntersection := EmptyIntersection
  IntersectionEmpty := IntersectionEmpty
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

instance : PairingLaws Set Set Set :=
  ⟨fun firstLeft secondLeft firstRight secondRight =>
    KuratowskiPairInjective firstLeft secondLeft firstRight secondRight⟩

end LRA.Set.Constructions.TGSet
