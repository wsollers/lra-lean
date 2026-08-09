# Volume I Set Lean Coverage Checklist

This checklist records the generic `LRA.VolumeI.Set` Lean surface in the order
loaded by `LRA/VolumeI/Set.lean`, so the LaTeX notes can be checked against the
formal development.  The main list excludes concrete backends
(`Implementations/LRASet`, `TT`, `MathlibSet`, `MathlibZFC`) except for the ZFC
named-axiom appendix at the end.

There are no top-level Lean `axiom` declarations in the generic Set layer.
Axiom-like content appears as operation-law structures, foundational existence
and uniqueness theorem statements, and ZFC formula definitions.

Legend:

- `[x]` accounted for in Volume I set notes
- `[ ]` not yet accounted for in Volume I set notes
- Coverage was marked from `F:\repos\lra-volume-i\volume-i\book-sets\set-theory`: exact `\LeanFormalizes` declarations, direct named TeX artifacts, or immediate mathematical counterparts count as accounted; internal Lean packaging with no reader-facing counterpart remains unchecked.
- kind: `structure`, `def`, `abbrev`, `theorem`
- source is shown as `file:line`

## Import Order

1. `LRA.VolumeI.Set.Public`
2. `LRA.VolumeI.Set.Finiteness`
3. `LRA.VolumeI.Set.Foundation`
4. `LRA.VolumeI.Set.Models`
5. `LRA.VolumeI.Set.Operations`
6. `LRA.VolumeI.Set.Laws`
7. `LRA.VolumeI.Set.Algebra`
8. `LRA.VolumeI.Set.Theory`

## Public Interface

Source order: `LRA/VolumeI/Set/Public.lean`.

- [ ] `SetInterface` (`abbrev`) - `Public/Interface.lean:16`
- [ ] `SetInterfaceLaws` (`structure`) - `Public/Interface.lean:23`
- [ ] `GenericSetModel` (`structure`) - `Public/Interface.lean:31`
- [x] `Member` (`def`) - `Public/Interface.lean:38`
- [x] `Empty` (`def`) - `Public/Interface.lean:43`
- [ ] `Singleton` (`def`) - `Public/Interface.lean:47`
- [x] `Pair` (`def`) - `Public/Interface.lean:52`
- [x] `Union` (`def`) - `Public/Interface.lean:57`
- [x] `Intersection` (`def`) - `Public/Interface.lean:62`
- [x] `Subset` (`def`) - `Public/Interface.lean:67`

## Finiteness

Source order: `LRA/VolumeI/Set/Finiteness.lean`.

- [ ] `ListedBy` (`def`) - `Finiteness.lean:15`
- [ ] `FinitePredicate` (`def`) - `Finiteness.lean:21`
- [ ] `FiniteType` (`def`) - `Finiteness.lean:26`

## Foundation

Source order: `Foundation/Foundational.lean`, which imports existence then
uniqueness.

### Existence

- [x] `EmptySetExist` (`theorem`) - `Foundation/Existence.lean:13`
- [ ] `SingletonSetExist` (`theorem`) - `Foundation/Existence.lean:20`
- [x] `PairSetExist` (`theorem`) - `Foundation/Existence.lean:28`
- [x] `BinaryUnionExist` (`theorem`) - `Foundation/Existence.lean:37`
- [x] `IntersectionExist` (`theorem`) - `Foundation/Existence.lean:47`
- [x] `SeparationExist` (`theorem`) - `Foundation/Existence.lean:57`

### Uniqueness

- [x] `EmptySetUnique` (`theorem`) - `Foundation/Uniqueness.lean:13`
- [ ] `SingletonSetUnique` (`theorem`) - `Foundation/Uniqueness.lean:22`
- [x] `PairSetUnique` (`theorem`) - `Foundation/Uniqueness.lean:34`
- [x] `BinaryUnionUnique` (`theorem`) - `Foundation/Uniqueness.lean:50`
- [x] `IntersectionUnique` (`theorem`) - `Foundation/Uniqueness.lean:66`
- [x] `SeparationUnique` (`theorem`) - `Foundation/Uniqueness.lean:82`

## Models

Source order: `Models/Language.lean`, `Models/Structure.lean`,
`Models/Theory.lean`.

- [x] `Language` (`abbrev`) - `Models/Language.lean:16`
- [x] `Structure` (`abbrev`) - `Models/Structure.lean:12`
- [x] `Model` (`structure`) - `Models/Structure.lean:15`
- [x] `Theory` (`abbrev`) - `Models/Theory.lean:13`
- [x] `ModelSatisfiesTheory` (`theorem`) - `Models/Theory.lean:17`

## Operations

Source order: `Operations.lean`.

### Public Operations

- [ ] `PublicSetOperations` (`structure`) - `Operations/Public.lean:18`
- [ ] `PublicSetOperationLaws` (`structure`) - `Operations/Public.lean:33`

### Native Public Abbreviations

- [x] `Empty` (`abbrev`) - `Operations/Native.lean:16`
- [ ] `Singleton` (`abbrev`) - `Operations/Native.lean:20`
- [x] `Pair` (`abbrev`) - `Operations/Native.lean:25`
- [x] `Union` (`abbrev`) - `Operations/Native.lean:30`
- [x] `Intersection` (`abbrev`) - `Operations/Native.lean:35`
- [x] `Subset` (`abbrev`) - `Operations/Native.lean:40`
- [x] `EmptySetHasNoMembers` (`theorem`) - `Operations/Native.lean:45`
- [ ] `SingletonSetMembershipIff` (`theorem`) - `Operations/Native.lean:51`
- [x] `PairSetMembershipIff` (`theorem`) - `Operations/Native.lean:58`
- [x] `EmptyMembership` (`theorem`) - `Operations/Native.lean:66`
- [ ] `SingletonMembership` (`theorem`) - `Operations/Native.lean:72`
- [x] `PairMembership` (`theorem`) - `Operations/Native.lean:79`

### Comprehension

- [ ] `ComprehensionSetOperations` (`structure`) - `Operations/Comprehension.lean:17`
- [ ] `ComprehensionSetOperationLaws` (`structure`) - `Operations/Comprehension.lean:21`
- [ ] `ComprehensionSetInterfaceLaws` (`structure`) - `Operations/Comprehension.lean:30`
- [ ] `BooleanComprehensionSetOperations` (`structure`) - `Operations/Comprehension.lean:39`
- [ ] `BooleanComprehensionSetOperationLaws` (`structure`) - `Operations/Comprehension.lean:43`
- [ ] `BooleanComprehensionSetInterfaceLaws` (`structure`) - `Operations/Comprehension.lean:52`
- [x] `Separation` (`abbrev`) - `Operations/Comprehension.lean:67`
- [x] `SeparationSetMembershipIff` (`theorem`) - `Operations/Comprehension.lean:73`
- [ ] `BooleanSeparation` (`abbrev`) - `Operations/Comprehension.lean:82`

### Boolean Operations

- [ ] `BooleanSetOperations` (`structure`) - `Operations/Boolean.lean:17`
- [ ] `BooleanSetOperationLaws` (`structure`) - `Operations/Boolean.lean:24`
- [ ] `BooleanSetInterfaceLaws` (`structure`) - `Operations/Boolean.lean:43`
- [x] `Universal` (`abbrev`) - `Operations/Boolean.lean:57`
- [x] `Complement` (`abbrev`) - `Operations/Boolean.lean:61`
- [x] `Difference` (`abbrev`) - `Operations/Boolean.lean:66`
- [x] `SymmetricDifference` (`abbrev`) - `Operations/Boolean.lean:71`

### Indexed Operations

- [ ] `IndexedSetOperations` (`structure`) - `Operations/Indexed.lean:12`
- [ ] `IndexedSetOperationLaws` (`structure`) - `Operations/Indexed.lean:19`
- [ ] `IndexedSetInterfaceLaws` (`structure`) - `Operations/Indexed.lean:39`
- [ ] `BooleanIndexedSetOperations` (`structure`) - `Operations/Indexed.lean:48`
- [ ] `toIndexedSetOperations` (`def`) - `Operations/Indexed.lean:57`
- [ ] `BooleanIndexedSetOperationLaws` (`structure`) - `Operations/Indexed.lean:68`
- [ ] `BooleanIndexedSetInterfaceLaws` (`structure`) - `Operations/Indexed.lean:75`
- [x] `IndexedUnion` (`abbrev`) - `Operations/Indexed.lean:90`
- [x] `IndexedIntersection` (`abbrev`) - `Operations/Indexed.lean:95`
- [ ] `CountableUnion` (`abbrev`) - `Operations/Indexed.lean:100`
- [ ] `CountableIntersection` (`abbrev`) - `Operations/Indexed.lean:105`

### Power Sets

- [ ] `PowerSetOperations` (`structure`) - `Operations/PowerSet.lean:17`
- [ ] `PowerSetOperationLaws` (`structure`) - `Operations/PowerSet.lean:24`
- [ ] `PowerSetInterfaceLaws` (`structure`) - `Operations/PowerSet.lean:38`
- [ ] `SubsetElement` (`abbrev`) - `Operations/PowerSet.lean:61`
- [x] `PowerSet` (`abbrev`) - `Operations/PowerSet.lean:68`
- [ ] `ContainsSubset` (`def`) - `Operations/PowerSet.lean:75`
- [x] `IsFamilyOfSubsets` (`def`) - `Operations/PowerSet.lean:84`

### Families

- [ ] `CollectionSetOperations` (`structure`) - `Operations/Families.lean:12`
- [ ] `CollectionSetOperationLaws` (`structure`) - `Operations/Families.lean:19`
- [ ] `CollectionSetInterfaceLaws` (`structure`) - `Operations/Families.lean:42`
- [x] `SetFamily` (`abbrev`) - `Operations/Families.lean:65`
- [x] `IndexedSetFamily` (`abbrev`) - `Operations/Families.lean:70`
- [x] `CollectionUnion` (`abbrev`) - `Operations/Families.lean:76`
- [x] `CollectionIntersection` (`abbrev`) - `Operations/Families.lean:83`
- [x] `Covers` (`def`) - `Operations/Families.lean:90`
- [x] `Subcover` (`def`) - `Operations/Families.lean:97`
- [x] `RelativeComplementCollection` (`def`) - `Operations/Families.lean:106`

### Products

- [x] `Product` (`abbrev`) - `Operations/Products.lean:8`
- [ ] `Tuple` (`abbrev`) - `Operations/Products.lean:12`
- [ ] `FirstProjection` (`def`) - `Operations/Products.lean:16`
- [ ] `SecondProjection` (`def`) - `Operations/Products.lean:21`
- [ ] `ProductExtensionality` (`theorem`) - `Operations/Products.lean:27`
- [ ] `FinitePower` (`abbrev`) - `Operations/Products.lean:36`

## Laws

Source order: `Laws.lean`.

### Membership

- [x] `UnionSetMembershipIff` (`theorem`) - `Laws/Membership.lean:15`
- [x] `IntersectionSetMembershipIff` (`theorem`) - `Laws/Membership.lean:23`
- [x] `SubsetMembershipIff` (`theorem`) - `Laws/Membership.lean:31`
- [x] `UnionMembership` (`theorem`) - `Laws/Membership.lean:39`
- [x] `IntersectionMembership` (`theorem`) - `Laws/Membership.lean:47`
- [x] `SubsetMembership` (`theorem`) - `Laws/Membership.lean:55`

### Extensionality

- [x] `SetExtensionality` (`theorem`) - `Laws/Extensionality.lean:12`
- [x] `SetExtensionalityIff` (`theorem`) - `Laws/Extensionality.lean:21`

### Subsets

- [ ] `SubsetReflexive` (`theorem`) - `Laws/Subset.lean:12`
- [ ] `SubsetTransitive` (`theorem`) - `Laws/Subset.lean:19`
- [x] `SetEqualityIffMutualSubset` (`theorem`) - `Laws/Subset.lean:28`
- [x] `SubsetIffUnionEqRight` (`theorem`) - `Laws/Subset.lean:36`
- [x] `SubsetIffIntersectionEqLeft` (`theorem`) - `Laws/Subset.lean:44`

### Union

- [x] `UnionCommutative` (`theorem`) - `Laws/Union.lean:12`
- [x] `UnionAssociative` (`theorem`) - `Laws/Union.lean:19`
- [x] `EmptyUnion` (`theorem`) - `Laws/Union.lean:27`
- [x] `UnionEmpty` (`theorem`) - `Laws/Union.lean:34`
- [x] `UnionIdempotent` (`theorem`) - `Laws/Union.lean:41`
- [x] `UnionMonotone` (`theorem`) - `Laws/Union.lean:48`

### Intersection

- [x] `IntersectionCommutative` (`theorem`) - `Laws/Intersection.lean:12`
- [x] `IntersectionAssociative` (`theorem`) - `Laws/Intersection.lean:19`
- [x] `EmptyIntersection` (`theorem`) - `Laws/Intersection.lean:27`
- [x] `IntersectionEmpty` (`theorem`) - `Laws/Intersection.lean:34`
- [x] `IntersectionIdempotent` (`theorem`) - `Laws/Intersection.lean:41`
- [x] `IntersectionMonotone` (`theorem`) - `Laws/Intersection.lean:48`

### Distributivity and Absorption

- [x] `IntersectionDistributesOverUnion` (`theorem`) - `Laws/Distributivity.lean:12`
- [x] `UnionDistributesOverIntersection` (`theorem`) - `Laws/Distributivity.lean:22`
- [x] `AbsorptionUnionIntersection` (`theorem`) - `Laws/Distributivity.lean:32`
- [x] `AbsorptionIntersectionUnion` (`theorem`) - `Laws/Distributivity.lean:39`

### Boolean Laws

- [x] `UniversalMembership` (`theorem`) - `Laws/Boolean.lean:15`
- [x] `ComplementMembership` (`theorem`) - `Laws/Boolean.lean:22`
- [x] `DifferenceMembership` (`theorem`) - `Laws/Boolean.lean:31`
- [x] `SymmetricDifferenceMembership` (`theorem`) - `Laws/Boolean.lean:40`
- [x] `DoubleComplement` (`theorem`) - `Laws/Boolean.lean:50`
- [x] `ComplementEmpty` (`theorem`) - `Laws/Boolean.lean:58`
- [x] `ComplementUniversal` (`theorem`) - `Laws/Boolean.lean:65`
- [x] `UnionComplement` (`theorem`) - `Laws/Boolean.lean:72`
- [x] `IntersectionComplement` (`theorem`) - `Laws/Boolean.lean:81`
- [x] `DeMorganUnion` (`theorem`) - `Laws/Boolean.lean:90`
- [x] `DeMorganIntersection` (`theorem`) - `Laws/Boolean.lean:99`
- [x] `DifferenceAsIntersectionComplement` (`theorem`) - `Laws/Boolean.lean:108`
- [x] `SymmetricDifferenceAsUnionDifferences` (`theorem`) - `Laws/Boolean.lean:117`

### Complement

- [x] `ComplementAntitoneInclusion` (`theorem`) - `Laws/Complement.lean:14`
- [x] `ComplementUnion` (`theorem`) - `Laws/Complement.lean:25`
- [x] `ComplementIntersection` (`theorem`) - `Laws/Complement.lean:34`
- [x] `UnionUniversal` (`theorem`) - `Laws/Complement.lean:43`
- [x] `UniversalUnion` (`theorem`) - `Laws/Complement.lean:51`
- [x] `IntersectionUniversal` (`theorem`) - `Laws/Complement.lean:59`
- [x] `UniversalIntersection` (`theorem`) - `Laws/Complement.lean:67`

### Difference

- [x] `DifferenceMonotoneLeft` (`theorem`) - `Laws/Difference.lean:14`
- [x] `DifferenceAntitoneRight` (`theorem`) - `Laws/Difference.lean:25`
- [x] `DifferenceEmpty` (`theorem`) - `Laws/Difference.lean:36`
- [x] `EmptyDifference` (`theorem`) - `Laws/Difference.lean:44`
- [ ] `DifferenceUniversal` (`theorem`) - `Laws/Difference.lean:52`
- [ ] `UniversalDifference` (`theorem`) - `Laws/Difference.lean:60`
- [x] `DifferenceSelf` (`theorem`) - `Laws/Difference.lean:69`
- [x] `DifferenceUnion` (`theorem`) - `Laws/Difference.lean:77`
- [x] `DifferenceIntersection` (`theorem`) - `Laws/Difference.lean:88`
- [x] `UnionDifferenceDistributes` (`theorem`) - `Laws/Difference.lean:99`
- [x] `IntersectionDifferenceDistributes` (`theorem`) - `Laws/Difference.lean:110`
- [x] `DifferenceSubsetLeft` (`theorem`) - `Laws/Difference.lean:121`
- [x] `DifferenceDisjointRight` (`theorem`) - `Laws/Difference.lean:129`

### Symmetric Difference

- [x] `SymmetricDifferenceAsUnionDifferenceIntersection` (`theorem`) - `Laws/SymmetricDifference.lean:14`
- [x] `SymmetricDifferenceCommutative` (`theorem`) - `Laws/SymmetricDifference.lean:25`
- [x] `SymmetricDifferenceEmpty` (`theorem`) - `Laws/SymmetricDifference.lean:34`
- [x] `EmptySymmetricDifference` (`theorem`) - `Laws/SymmetricDifference.lean:42`
- [x] `SymmetricDifferenceSelf` (`theorem`) - `Laws/SymmetricDifference.lean:50`
- [x] `SymmetricDifferenceAssociative` (`theorem`) - `Laws/SymmetricDifference.lean:58`
- [x] `SymmetricDifferenceEqEmptyIff` (`theorem`) - `Laws/SymmetricDifference.lean:71`
- [x] `SymmetricDifferenceSubsetUnion` (`theorem`) - `Laws/SymmetricDifference.lean:79`

### Indexed

- [x] `IndexedUnionMembership` (`theorem`) - `Laws/Indexed.lean:15`
- [x] `IndexedIntersectionMembership` (`theorem`) - `Laws/Indexed.lean:25`
- [ ] `CountableUnionMembership` (`theorem`) - `Laws/Indexed.lean:35`
- [ ] `CountableIntersectionMembership` (`theorem`) - `Laws/Indexed.lean:44`
- [x] `IndexedUnionMonotone` (`theorem`) - `Laws/Indexed.lean:53`
- [x] `IndexedIntersectionMonotone` (`theorem`) - `Laws/Indexed.lean:67`
- [x] `ComplementIndexedUnion` (`theorem`) - `Laws/Indexed.lean:81`
- [x] `ComplementIndexedIntersection` (`theorem`) - `Laws/Indexed.lean:92`

### Power Set

- [x] `PowerSetMembership` (`theorem`) - `Laws/PowerSet.lean:14`
- [x] `MemberOfPowerSet` (`theorem`) - `Laws/PowerSet.lean:25`
- [x] `PowerSetMonotone` (`theorem`) - `Laws/PowerSet.lean:37`
- [ ] `IsFamilyOfSubsetsIff` (`theorem`) - `Laws/PowerSet.lean:49`

### Families

- [x] `CollectionUnionMembership` (`theorem`) - `Laws/Families.lean:15`
- [x] `CollectionIntersectionMembership` (`theorem`) - `Laws/Families.lean:28`
- [x] `CoversElementwiseIff` (`theorem`) - `Laws/Families.lean:41`
- [x] `SubcoverIff` (`theorem`) - `Laws/Families.lean:55`
- [ ] `IndexedFamilyHasRepresentingCollection` (`theorem`) - `Laws/Families.lean:66`
- [ ] `RelativeComplementCollectionIsFamily` (`theorem`) - `Laws/Families.lean:80`
- [x] `CoverFailureIffRelativeComplementIntersectionNonempty` (`theorem`) - `Laws/Families.lean:91`

## Algebra

Source order: `Algebra.lean`.

### Closure

- [ ] `Collection` (`abbrev`) - `Algebra/Closure.lean:17`
- [ ] `Contains` (`def`) - `Algebra/Closure.lean:20`
- [ ] `ContainsPredicate` (`def`) - `Algebra/Closure.lean:25`
- [ ] `ClosedUnderNullary` (`def`) - `Algebra/Closure.lean:31`
- [ ] `ClosedUnderUnary` (`def`) - `Algebra/Closure.lean:36`
- [ ] `ClosedUnderBinary` (`def`) - `Algebra/Closure.lean:41`
- [ ] `ClosedUnderIndexed` (`def`) - `Algebra/Closure.lean:47`
- [ ] `ClosedUnderCountable` (`def`) - `Algebra/Closure.lean:54`
- [ ] `ClosedUnderFinite` (`def`) - `Algebra/Closure.lean:59`
- [ ] `CoreClosed` (`structure`) - `Algebra/Closure.lean:70`
- [ ] `BooleanClosed` (`structure`) - `Algebra/Closure.lean:81`
- [ ] `IndexedClosed` (`structure`) - `Algebra/Closure.lean:90`
- [ ] `BooleanIndexedClosed` (`structure`) - `Algebra/Closure.lean:101`

### Set Rings

- [ ] `SetRingSignature` (`structure`) - `Algebra/Ring.lean:12`
- [ ] `SetRingLaws` (`structure`) - `Algebra/Ring.lean:22`
- [ ] `SetRingModel` (`structure`) - `Algebra/Ring.lean:38`
- [ ] `fromBooleanOperations` (`def`) - `Algebra/Ring.lean:48`

### Set Algebras

- [ ] `SetAlgebraSignature` (`structure`) - `Algebra/BooleanAlgebra.lean:12`
- [ ] `toSetRingSignature` (`def`) - `Algebra/BooleanAlgebra.lean:26`
- [ ] `SetAlgebraLaws` (`structure`) - `Algebra/BooleanAlgebra.lean:39`
- [ ] `SetAlgebraModel` (`structure`) - `Algebra/BooleanAlgebra.lean:58`
- [ ] `fromBooleanOperations` (`def`) - `Algebra/BooleanAlgebra.lean:68`

### Sigma Algebras

- [ ] `SigmaRingSignature` (`structure`) - `Algebra/SigmaAlgebra.lean:12`
- [ ] `SigmaAlgebraSignature` (`structure`) - `Algebra/SigmaAlgebra.lean:16`
- [ ] `toSigmaRingSignature` (`def`) - `Algebra/SigmaAlgebra.lean:22`
- [ ] `SigmaRingLaws` (`structure`) - `Algebra/SigmaAlgebra.lean:36`
- [ ] `SigmaAlgebraLaws` (`structure`) - `Algebra/SigmaAlgebra.lean:44`
- [ ] `SigmaRingModel` (`structure`) - `Algebra/SigmaAlgebra.lean:52`
- [ ] `SigmaAlgebraModel` (`structure`) - `Algebra/SigmaAlgebra.lean:57`
- [ ] `fromBooleanIndexedOperations` (`def`) - `Algebra/SigmaAlgebra.lean:67`
- [ ] `fromBooleanIndexedOperations` (`def`) - `Algebra/SigmaAlgebra.lean:88`

### Delta and Borel Algebras

- [ ] `DeltaRingSignature` (`structure`) - `Algebra/DeltaAlgebra.lean:16`
- [ ] `DeltaRingLaws` (`structure`) - `Algebra/DeltaAlgebra.lean:20`
- [ ] `DeltaRingModel` (`structure`) - `Algebra/DeltaAlgebra.lean:28`
- [ ] `BorelAlgebraSignature` (`structure`) - `Algebra/BorelAlgebra.lean:13`
- [ ] `BorelAlgebraLaws` (`structure`) - `Algebra/BorelAlgebra.lean:21`
- [ ] `BorelAlgebraModel` (`structure`) - `Algebra/BorelAlgebra.lean:27`

### Collection Algebra

- [x] `SetCollection` (`abbrev`) - `Algebra/CollectionAlgebra.lean:21`
- [ ] `Contains` (`def`) - `Algebra/CollectionAlgebra.lean:26`
- [ ] `FiniteCollectionPredicate` (`abbrev`) - `Algebra/CollectionAlgebra.lean:34`
- [ ] `NonemptySetPredicate` (`abbrev`) - `Algebra/CollectionAlgebra.lean:40`
- [x] `FiniteSubcover` (`def`) - `Algebra/CollectionAlgebra.lean:45`
- [x] `HasNoFiniteSubcover` (`def`) - `Algebra/CollectionAlgebra.lean:53`
- [x] `HasFiniteSubcover` (`def`) - `Algebra/CollectionAlgebra.lean:64`
- [x] `FiniteIntersectionProperty` (`def`) - `Algebra/CollectionAlgebra.lean:76`
- [x] `ClosedUnderUnaryOperation` (`def`) - `Algebra/CollectionAlgebra.lean:87`
- [x] `ClosedUnderBinaryOperation` (`def`) - `Algebra/CollectionAlgebra.lean:98`
- [x] `ClosedUnderIndexedOperation` (`def`) - `Algebra/CollectionAlgebra.lean:111`
- [x] `ClosedUnderCountableOperation` (`def`) - `Algebra/CollectionAlgebra.lean:123`
- [x] `ClosedUnderCollectionUnion` (`def`) - `Algebra/CollectionAlgebra.lean:132`
- [x] `ClosedUnderCollectionIntersection` (`def`) - `Algebra/CollectionAlgebra.lean:140`
- [x] `FiniteUnionFromList` (`def`) - `Algebra/CollectionAlgebra.lean:149`
- [x] `FiniteIntersectionFromList` (`def`) - `Algebra/CollectionAlgebra.lean:159`
- [x] `ClosedUnderFiniteUnions` (`def`) - `Algebra/CollectionAlgebra.lean:170`
- [x] `ClosedUnderFiniteIntersections` (`def`) - `Algebra/CollectionAlgebra.lean:184`
- [ ] `CollectionBooleanOperations` (`structure`) - `Algebra/CollectionAlgebra.lean:199`
- [ ] `CollectionCountableOperations` (`structure`) - `Algebra/CollectionAlgebra.lean:225`
- [ ] `CollectionCountableOperationLaws` (`structure`) - `Algebra/CollectionAlgebra.lean:237`
- [x] `ClosedUnderComplements` (`def`) - `Algebra/CollectionAlgebra.lean:257`
- [x] `ClosedUnderPairwiseUnions` (`def`) - `Algebra/CollectionAlgebra.lean:264`
- [x] `ClosedUnderPairwiseIntersections` (`def`) - `Algebra/CollectionAlgebra.lean:271`
- [x] `ClosedUnderPairwiseDifferences` (`def`) - `Algebra/CollectionAlgebra.lean:278`
- [x] `ClosedUnderPairwiseSymmetricDifferences` (`def`) - `Algebra/CollectionAlgebra.lean:285`
- [x] `ClosedUnderCountableUnions` (`def`) - `Algebra/CollectionAlgebra.lean:292`
- [x] `ClosedUnderCountableIntersections` (`def`) - `Algebra/CollectionAlgebra.lean:299`
- [x] `SetRing` (`def`) - `Algebra/CollectionAlgebra.lean:308`
- [x] `SetAlgebra` (`def`) - `Algebra/CollectionAlgebra.lean:320`
- [x] `SigmaRing` (`def`) - `Algebra/CollectionAlgebra.lean:329`
- [x] `SigmaAlgebra` (`def`) - `Algebra/CollectionAlgebra.lean:338`
- [x] `TopologyOn` (`def`) - `Algebra/CollectionAlgebra.lean:349`
- [x] `SetAlgebraIsSetRing` (`theorem`) - `Algebra/CollectionAlgebra.lean:368`
- [x] `SetAlgebraContainsEmpty` (`theorem`) - `Algebra/CollectionAlgebra.lean:377`
- [x] `SetAlgebraContainsUniversal` (`theorem`) - `Algebra/CollectionAlgebra.lean:386`
- [x] `SetAlgebraClosedUnderComplements` (`theorem`) - `Algebra/CollectionAlgebra.lean:395`
- [x] `SetAlgebraClosedUnderPairwiseUnions` (`theorem`) - `Algebra/CollectionAlgebra.lean:404`
- [x] `SetAlgebraClosedUnderPairwiseIntersections` (`theorem`) - `Algebra/CollectionAlgebra.lean:413`
- [x] `SetAlgebraClosedUnderPairwiseDifferences` (`theorem`) - `Algebra/CollectionAlgebra.lean:422`
- [x] `SetAlgebraClosedUnderPairwiseSymmetricDifferences` (`theorem`) - `Algebra/CollectionAlgebra.lean:431`
- [x] `SigmaAlgebraIsSetAlgebra` (`theorem`) - `Algebra/CollectionAlgebra.lean:440`
- [x] `SigmaAlgebraClosedUnderCountableUnions` (`theorem`) - `Algebra/CollectionAlgebra.lean:450`
- [x] `SigmaAlgebraClosedUnderCountableIntersections` (`theorem`) - `Algebra/CollectionAlgebra.lean:460`
- [x] `TopologyContainsEmpty` (`theorem`) - `Algebra/CollectionAlgebra.lean:470`
- [x] `TopologyContainsUniversal` (`theorem`) - `Algebra/CollectionAlgebra.lean:479`
- [x] `TopologyClosedUnderCollectionUnions` (`theorem`) - `Algebra/CollectionAlgebra.lean:488`
- [x] `TopologyClosedUnderFiniteIntersections` (`theorem`) - `Algebra/CollectionAlgebra.lean:497`
- [x] `CollectionSystemOperations` (`structure`) - `Algebra/CollectionAlgebra.lean:510`
- [x] `CollectionSystemOperationLaws` (`structure`) - `Algebra/CollectionAlgebra.lean:524`
- [x] `ClosureSystem` (`def`) - `Algebra/CollectionAlgebra.lean:573`
- [x] `UnaryClosureStableUnderSystemIntersection` (`theorem`) - `Algebra/CollectionAlgebra.lean:586`
- [x] `BinaryClosureStableUnderSystemIntersection` (`theorem`) - `Algebra/CollectionAlgebra.lean:606`
- [x] `IndexedClosureStableUnderSystemIntersection` (`theorem`) - `Algebra/CollectionAlgebra.lean:627`
- [x] `ContainsGeneratingFamily` (`def`) - `Algebra/CollectionAlgebra.lean:647`
- [x] `GeneratedCollection` (`def`) - `Algebra/CollectionAlgebra.lean:655`
- [x] `GeneratedCollectionExtensive` (`theorem`) - `Algebra/CollectionAlgebra.lean:668`
- [x] `GeneratedCollectionMonotone` (`theorem`) - `Algebra/CollectionAlgebra.lean:682`
- [x] `GeneratedCollectionClosed` (`theorem`) - `Algebra/CollectionAlgebra.lean:699`
- [x] `GeneratedCollectionIdempotent` (`theorem`) - `Algebra/CollectionAlgebra.lean:714`
- [ ] `FiniteCollectionLaws` (`structure`) - `Algebra/CollectionAlgebra.lean:731`
- [ ] `NonemptySetLaws` (`structure`) - `Algebra/CollectionAlgebra.lean:759`
- [ ] `RelativeComplementCollectionLaws` (`structure`) - `Algebra/CollectionAlgebra.lean:769`
- [x] `FiniteSubcoverIff` (`theorem`) - `Algebra/CollectionAlgebra.lean:797`
- [x] `CoverFailureIffRelativeComplementIntersectionNonempty` (`theorem`) - `Algebra/CollectionAlgebra.lean:809`
- [ ] `FiniteRelativeComplementImage` (`theorem`) - `Algebra/CollectionAlgebra.lean:824`
- [ ] `FiniteRelativeComplementPreimage` (`theorem`) - `Algebra/CollectionAlgebra.lean:836`
- [x] `NoFiniteSubcoverIffRelativeComplementFIP` (`theorem`) - `Algebra/CollectionAlgebra.lean:854`
- [x] `FiniteSubcoverIffRelativeComplementNotFIP` (`theorem`) - `Algebra/CollectionAlgebra.lean:869`

### Collection Signature Bridge

- [ ] `ToSetAlgebraSignature` (`def`) - `Algebra/CollectionSignatureBridge.lean:22`
- [ ] `ToSetAlgebraLaws` (`theorem`) - `Algebra/CollectionSignatureBridge.lean:38`
- [ ] `ToSetAlgebraModel` (`def`) - `Algebra/CollectionSignatureBridge.lean:49`
- [ ] `ToSigmaAlgebraSignature` (`def`) - `Algebra/CollectionSignatureBridge.lean:60`
- [ ] `ToSigmaAlgebraLaws` (`theorem`) - `Algebra/CollectionSignatureBridge.lean:79`
- [ ] `ToSigmaAlgebraModel` (`def`) - `Algebra/CollectionSignatureBridge.lean:91`

## Theory

`Theory.lean` imports `Foundation`, `Laws`, then `Theory/Countability.lean`.
The first two are already listed above; this section lists the added
countability surface.

- [ ] `IsFiniteSet` (`def`) - `Theory/Countability.lean:21`
- [ ] `IsInfiniteSet` (`def`) - `Theory/Countability.lean:29`
- [ ] `IsCountableSet` (`def`) - `Theory/Countability.lean:36`
- [ ] `IsCountablyInfiniteSet` (`def`) - `Theory/Countability.lean:45`
- [x] `ProperSubset` (`def`) - `Theory/Countability.lean:56`
- [ ] `IsOneToOneCorrespondence` (`def`) - `Theory/Countability.lean:65`
- [ ] `EquivalentSets` (`def`) - `Theory/Countability.lean:84`
- [ ] `SubsetOfCountableSetIsCountable` (`theorem`) - `Theory/Countability.lean:91`
- [ ] `FiniteUnionOfCountableSetsIsCountable` (`theorem`) - `Theory/Countability.lean:102`
- [ ] `CountableUnionOfCountableSetsIsCountable` (`theorem`) - `Theory/Countability.lean:116`
- [ ] `InfiniteSetHasCountablyInfiniteSubset` (`theorem`) - `Theory/Countability.lean:128`
- [ ] `InfiniteSetEquivalentToProperSubset` (`theorem`) - `Theory/Countability.lean:139`

## ZFC Named-Axiom Appendix

These live under `LRA/VolumeI/Set/Implementations/ZFC` and are not part of the
generic Set API. They are included here because they are the Lean declarations
most directly corresponding to named set-theory axioms in prose notes.

### ZFC Language and Formula Constructors

- [x] `ZFCRelationSymbol` (`inductive`) - `Implementations/ZFC/Language/Signature.lean:16`
- [x] `zfcSignature` (`def`) - `Implementations/ZFC/Language/Signature.lean:20`
- [x] `zfcSignature.memberIsBinary` (`theorem`) - `Implementations/ZFC/Language/Signature.lean:25`
- [ ] `ZFCVariable` (`abbrev`) - `Implementations/ZFC/Theory.lean:24`
- [ ] `ZFCFormula` (`abbrev`) - `Implementations/ZFC/Theory.lean:27`
- [x] `ZFCFormulaTheory` (`abbrev`) - `Implementations/ZFC/Theory.lean:30`
- [ ] `variableTerm` (`def`) - `Implementations/ZFC/Theory.lean:33`
- [x] `memberFormula` (`def`) - `Implementations/ZFC/Theory.lean:37`
- [ ] `equalFormula` (`def`) - `Implementations/ZFC/Theory.lean:43`
- [ ] `notFormula` (`def`) - `Implementations/ZFC/Theory.lean:47`
- [ ] `impliesFormula` (`def`) - `Implementations/ZFC/Theory.lean:51`
- [ ] `andFormula` (`def`) - `Implementations/ZFC/Theory.lean:55`
- [ ] `orFormula` (`def`) - `Implementations/ZFC/Theory.lean:59`
- [ ] `iffFormula` (`def`) - `Implementations/ZFC/Theory.lean:63`
- [ ] `forallVariable` (`def`) - `Implementations/ZFC/Theory.lean:67`
- [ ] `existsVariable` (`def`) - `Implementations/ZFC/Theory.lean:71`
- [x] `subsetFormula` (`def`) - `Implementations/ZFC/Theory.lean:75`
- [x] `emptyFormula` (`def`) - `Implementations/ZFC/Theory.lean:80`
- [x] `pairFormula` (`def`) - `Implementations/ZFC/Theory.lean:85`
- [x] `unionFormula` (`def`) - `Implementations/ZFC/Theory.lean:92`
- [x] `powersetFormula` (`def`) - `Implementations/ZFC/Theory.lean:100`
- [x] `successorFormula` (`def`) - `Implementations/ZFC/Theory.lean:106`

### Named ZFC Axiom Formulas

- [x] `extensionalityAxiom` (`def`) - `Implementations/ZFC/Theory.lean:113`
- [x] `emptySetAxiom` (`def`) - `Implementations/ZFC/Theory.lean:124`
- [x] `pairingAxiom` (`def`) - `Implementations/ZFC/Theory.lean:130`
- [x] `unionAxiom` (`def`) - `Implementations/ZFC/Theory.lean:137`
- [x] `powerSetAxiom` (`def`) - `Implementations/ZFC/Theory.lean:143`
- [x] `foundationAxiom` (`def`) - `Implementations/ZFC/Theory.lean:149`
- [x] `infinityAxiom` (`def`) - `Implementations/ZFC/Theory.lean:164`
- [x] `separationAxiomInstance` (`def`) - `Implementations/ZFC/Theory.lean:179`
- [x] `replacementAxiomInstance` (`def`) - `Implementations/ZFC/Theory.lean:195`
- [x] `choiceAxiom` (`def`) - `Implementations/ZFC/Theory.lean:207`
- [x] `zfcNamedAxioms` (`def`) - `Implementations/ZFC/Theory.lean:253`
- [x] `zfcTheory` (`def`) - `Implementations/ZFC/Theory.lean:265`
- [x] `SatisfiesZFCTheory` (`def`) - `Implementations/ZFC/Theory.lean:272`

