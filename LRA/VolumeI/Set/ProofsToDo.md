# Volume I Set Proofs To Do

This file tracks Set declarations whose theorem bodies are intentionally still
proof obligations. Definitions should remain concrete; `sorry` belongs in the
theorems listed here, not in manufactured structures or data.

Current backlog: 200 theorem/proof obligations.

## Algebra

### Algebra/BooleanAlgebra.lean

- [ ] `RelativeComplementIsMember`

### Algebra/BorelAlgebra.lean

- [ ] `GeneratedSigmaAlgebraMembersAreSubsets`
- [ ] `GeneratedSigmaAlgebraEmptyIsMember`
- [ ] `GeneratedSigmaAlgebraUnionIsMember`
- [ ] `GeneratedSigmaAlgebraIntersectionIsMember`
- [ ] `GeneratedSigmaAlgebraDifferenceIsMember`
- [ ] `GeneratedSigmaAlgebraSymmetricDifferenceIsMember`
- [ ] `GeneratedSigmaAlgebraAmbientIsMember`
- [ ] `GeneratedSigmaAlgebraCountableUnionIsMember`
- [ ] `GeneratedSigmaAlgebraContainsGenerator`
- [ ] `GeneratedSigmaAlgebraMinimal`

### Algebra/Examples.lean

- [ ] `activeSetAlgebraMembersAreSubsets`
- [ ] `activeSetAlgebraUnionIsMember`
- [ ] `activeSetAlgebraIntersectionIsMember`
- [ ] `activeSetAlgebraDifferenceIsMember`
- [ ] `activeSetAlgebraSymmetricDifferenceIsMember`
- [ ] `emptyUniversalSetAlgebraMembersAreSubsets`
- [ ] `emptyUniversalSetAlgebraEmptyIsMember`
- [ ] `emptyUniversalSetAlgebraUnionIsMember`
- [ ] `emptyUniversalSetAlgebraIntersectionIsMember`
- [ ] `emptyUniversalSetAlgebraDifferenceIsMember`
- [ ] `emptyUniversalSetAlgebraSymmetricDifferenceIsMember`
- [ ] `emptyUniversalSetAlgebraAmbientIsMember`
- [ ] `activeSigmaAlgebraCountableUnionIsMember`
- [ ] `lraSetAlgebraMembersAreSubsets`
- [ ] `lraSetAlgebraUnionIsMember`
- [ ] `lraSetAlgebraIntersectionIsMember`
- [ ] `lraSetAlgebraDifferenceIsMember`
- [ ] `lraSetAlgebraSymmetricDifferenceIsMember`

## Boolean ring surface

### BooleanRing.lean

- [ ] `UniversalIntersection`
- [ ] `IntersectionUniversal`
- [ ] `IntersectionDistributesOverSymmetricDifference`
- [ ] `SymmetricDifferenceIntersectionDistributes`

## Enderton laws

### Enderton/Laws/Difference.lean

- [ ] `DifferenceMonotoneLeft`
- [ ] `DifferenceAntitoneRight`
- [ ] `DifferenceEmpty`
- [ ] `EmptyDifference`
- [ ] `DifferenceSelf`
- [ ] `DifferenceUnion`
- [ ] `DifferenceIntersection`
- [ ] `UnionDifferenceDistributes`
- [ ] `IntersectionDifferenceDistributes`
- [ ] `DifferenceSubsetLeft`
- [ ] `DifferenceDisjointRight`

### Enderton/Laws/Distributivity.lean

- [ ] `IntersectionDistributesOverUnion`
- [ ] `UnionDistributesOverIntersection`
- [ ] `AbsorptionUnionIntersection`
- [ ] `AbsorptionIntersectionUnion`

### Enderton/Laws/Intersection.lean

- [ ] `IntersectionCommutative`
- [ ] `IntersectionAssociative`
- [ ] `EmptyIntersection`
- [ ] `IntersectionEmpty`
- [ ] `IntersectionIdempotent`
- [ ] `IntersectionMonotone`
- [ ] `SubsetIffIntersectionEqLeft`

### Enderton/Laws/Membership.lean

- [ ] `SubsetIffAllMembers`

### Enderton/Laws/Subset.lean

- [ ] `SubsetReflexive`
- [ ] `SubsetTransitive`
- [ ] `SetEqualityIffMutualSubset`

### Enderton/Laws/SymmetricDifference.lean

- [ ] `SymmetricDifferenceAsUnionDifferences`
- [ ] `SymmetricDifferenceAsUnionDifferenceIntersection`
- [ ] `SymmetricDifferenceCommutative`
- [ ] `SymmetricDifferenceAssociative`
- [ ] `SymmetricDifferenceEmpty`
- [ ] `EmptySymmetricDifference`
- [ ] `SymmetricDifferenceSelf`
- [ ] `SymmetricDifferenceEqEmptyIff`
- [ ] `SymmetricDifferenceSubsetUnion`

### Enderton/Laws/Union.lean

- [ ] `UnionCommutative`
- [ ] `UnionAssociative`
- [ ] `EmptyUnion`
- [ ] `UnionEmpty`
- [ ] `UnionIdempotent`
- [ ] `UnionMonotone`
- [ ] `SubsetIffUnionEqRight`

## Enderton theorems

### Enderton/Theorems/Choice.lean

- [ ] `ChoiceSetExists`
- [ ] `TheChoiceSetIsChoiceSetFor`

### Enderton/Theorems/Foundation.lean

- [ ] `FoundationWitnessExists`
- [ ] `NoSetIsMemberOfItself`

### Enderton/Theorems/Infinity.lean

- [ ] `InductiveSetExists`

### Enderton/Theorems/Intersection.lean

- [ ] `TheIntersectionIsIntersectionOf`
- [ ] `TheIntersectionMembership`
- [ ] `EveryIntersectionEqualsTheIntersection`

### Enderton/Theorems/IntersectionOver.lean

- [ ] `TheIntersectionOverMembership`

### Enderton/Theorems/OrderedPairs.lean

- [ ] `MemberOfSingletonSet`
- [ ] `KuratowskiPairInjective`
- [ ] `SingletonMemberOfKuratowskiPair`

### Enderton/Theorems/PowerSet.lean

- [ ] `PowerSetOfExists`
- [ ] `PowerSetOfIsUnique`
- [ ] `PowerSetOfExistsAndIsUnique`
- [ ] `ThePowerSetIsPowerSetOf`
- [ ] `EveryPowerSetOfEqualsThePowerSet`

### Enderton/Theorems/RelativeComplement.lean

- [ ] `TheRelativeComplementIsRelativeComplementOf`
- [ ] `TheRelativeComplementMembership`
- [ ] `EveryRelativeComplementEqualsTheRelativeComplement`

### Enderton/Theorems/Replacement.lean

- [ ] `ReplacementImageExists`
- [ ] `ReplacementImageIsUnique`
- [ ] `ReplacementImageExistsAndIsUnique`
- [ ] `TheReplacementImageIsReplacementImageOf`
- [ ] `EveryReplacementImageEqualsTheReplacementImage`

### Enderton/Theorems/Separation.lean

- [ ] `SeparatedSubsetExists`
- [ ] `SeparatedSubsetIsUnique`
- [ ] `SeparatedSubsetExistsAndIsUnique`
- [ ] `TheSeparatedSubsetIsSeparatedSubset`
- [ ] `EverySeparatedSubsetEqualsTheSeparatedSubset`

### Enderton/Theorems/SymmetricDifference.lean

- [ ] `TheSymmetricDifferenceIsSymmetricDifferenceOf`
- [ ] `TheSymmetricDifferenceMembership`
- [ ] `EverySymmetricDifferenceEqualsTheSymmetricDifference`

## Relation-set interface

### Interface/RelationLaws.lean

- [ ] `RelatesUnion`
- [ ] `RelatesIntersection`
- [ ] `MemberOfDomainOf`
- [ ] `MemberOfRangeOf`
- [ ] `MemberOfImageOf`
- [ ] `MemberOfPreimageOf`
- [ ] `MemberOfFiberOf`
- [ ] `RelatesInverseOf`
- [ ] `RelatesRestrictionOf`
- [ ] `RestrictionIsSubset`
- [ ] `RestrictionOfFunctionalIsFunctional`
- [ ] `UnionOfCompatibleFunctionalIsFunctional`
- [ ] `RelatesGraphSetOf`
- [ ] `GraphSetOfIsFunctional`
- [ ] `AppliedToUnique`

## LRASet laws

### LRASet/Laws/Complement.lean

- [ ] `DoubleComplement`
- [ ] `ComplementEmpty`
- [ ] `ComplementUniversal`
- [ ] `UnionComplement`
- [ ] `IntersectionComplement`
- [ ] `DeMorganUnion`
- [ ] `DeMorganIntersection`
- [ ] `DifferenceAsIntersectionComplement`
- [ ] `DifferenceUniversal`
- [ ] `UniversalDifference`

### LRASet/Laws/Difference.lean

- [ ] `DifferenceMonotoneLeft`
- [ ] `DifferenceAntitoneRight`
- [ ] `DifferenceEmpty`
- [ ] `EmptyDifference`
- [ ] `DifferenceSelf`
- [ ] `DifferenceUnion`
- [ ] `DifferenceIntersection`
- [ ] `UnionDifferenceDistributes`
- [ ] `IntersectionDifferenceDistributes`
- [ ] `DifferenceSubsetLeft`
- [ ] `DifferenceDisjointRight`

### LRASet/Laws/Distributivity.lean

- [ ] `IntersectionDistributesOverUnion`
- [ ] `UnionDistributesOverIntersection`
- [ ] `AbsorptionUnionIntersection`
- [ ] `AbsorptionIntersectionUnion`

### LRASet/Laws/Intersection.lean

- [ ] `IntersectionCommutative`
- [ ] `IntersectionAssociative`
- [ ] `EmptyIntersection`
- [ ] `IntersectionEmpty`
- [ ] `IntersectionIdempotent`
- [ ] `IntersectionMonotone`
- [ ] `SubsetIffIntersectionEqLeft`

### LRASet/Laws/Membership.lean

- [ ] `NotMemberOfEmpty`

### LRASet/Laws/Subset.lean

- [ ] `SubsetReflexive`
- [ ] `SubsetTransitive`
- [ ] `SetEqualityIffMutualSubset`

### LRASet/Laws/SymmetricDifference.lean

- [ ] `SymmetricDifferenceAsUnionDifferences`
- [ ] `SymmetricDifferenceAsUnionDifferenceIntersection`
- [ ] `SymmetricDifferenceCommutative`
- [ ] `SymmetricDifferenceAssociative`
- [ ] `SymmetricDifferenceEmpty`
- [ ] `EmptySymmetricDifference`
- [ ] `SymmetricDifferenceSelf`
- [ ] `SymmetricDifferenceEqEmptyIff`
- [ ] `SymmetricDifferenceSubsetUnion`

### LRASet/Laws/Union.lean

- [ ] `UnionCommutative`
- [ ] `UnionAssociative`
- [ ] `EmptyUnion`
- [ ] `UnionEmpty`
- [ ] `UnionIdempotent`
- [ ] `UnionMonotone`
- [ ] `SubsetIffUnionEqRight`

## LRASet core operations

### LRASet/LRASet.lean

- [ ] `LRASetExtensionality`

### LRASet/Operations.lean

- [ ] `EmptyMembership`
- [ ] `SingletonMembership`
- [ ] `InsertMembership`
- [ ] `PairMembership`
- [ ] `PairEqualsInsertSingleton`
- [ ] `UnionMembership`
- [ ] `IntersectionMembership`
- [ ] `ComplementMembership`
- [ ] `UniversalMembership`
- [ ] `DifferenceMembership`
- [ ] `SymmetricDifferenceMembership`
- [ ] `SubsetIff`
- [ ] `PowerSetMembership`
- [ ] `CollectionUnionMembership`
- [ ] `CollectionIntersectionMembership`
- [ ] `SeparationMembership`
- [ ] `IndexedUnionMembership`
- [ ] `IndexedIntersectionMembership`

## Model theory

### ModelTheory/EndertonModel.lean

- [ ] `endertonSatisfiesInfinity`
- [ ] `endertonSatisfiesFoundation`
- [ ] `endertonSatisfiesChoice`
- [ ] `endertonSatisfiesReplacement`

### ModelTheory/ZFSetModel.lean

- [ ] `zfSetSatisfiesChoice`
- [ ] `zfSetSatisfiesReplacement`
