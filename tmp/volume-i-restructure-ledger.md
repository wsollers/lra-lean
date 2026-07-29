# Volume I Restructure Ledger

Status: first-pass migration ledger.

Checkpoint commit before migration: `c5f241b Checkpoint before Volume I restructure`.

Working branch: `codex/volume-i-restructure`.

## Module Moves

| Old module | New module | Status | Notes |
| --- | --- | --- | --- |
| `LRA.VolumeI.Order` | `LRA.VolumeI.Relations.Order` | moved | Old top-level order router removed. |
| `LRA.VolumeI.Order.Relations` | `LRA.VolumeI.Relations.Order.Relations` | moved | Order-specific relation constructions. |
| `LRA.VolumeI.Order.Posets` | `LRA.VolumeI.Relations.Order.OrderStructures` | split | Declarations split into explicit `OrderStructures/*` leaves. |
| `LRA.VolumeI.Order.Total` | `LRA.VolumeI.Relations.Order.OrderStructures.{TotalOrder,LinearOrder,StrictLinearOrder,StrictTotalOrder}` | split | Old `Total.lean` removed. |
| `LRA.VolumeI.Order.Dense` | `LRA.VolumeI.Relations.Order.Density` | moved | File renamed to match contract. |
| `LRA.VolumeI.Order.Bounds` | `LRA.VolumeI.Relations.Order.Bounds` | moved | Import targets updated. |
| `LRA.VolumeI.Order.Lattices` | `LRA.VolumeI.Relations.Order.Lattices` | moved | Import targets updated. |
| `LRA.VolumeI.Order.Completeness` | `LRA.VolumeI.Relations.Order.Completeness` | moved | `WellOrder` moved out to its explicit leaf. |
| `LRA.VolumeI.Order.Directed` | `LRA.VolumeI.Relations.Order.Directed` | moved | Import targets updated. |
| `LRA.VolumeI.Order.Examples` | `LRA.VolumeI.Relations.Order.Examples` | moved | Existing `sorry`s preserved. |
| `LRA.VolumeI.Relations.Relations` | `LRA.VolumeI.Relations.Basic.Relations` | moved | Basic relation type aliases. |
| `LRA.VolumeI.Relations.NamedRelations` | `LRA.VolumeI.Relations.Basic.Properties` | moved | Existing `Equivalence` kept for downstream compatibility pending TeX/Volume II pass. |
| `LRA.VolumeI.Structures` | `LRA.VolumeI.Algebra.Structures` | moved | Old top-level structures router removed. |
| `LRA.VolumeI.Structures.Structures` | `LRA.VolumeI.Algebra.Structures.{Elementary,RingLike,Ordered}` | split | Existing structures preserved and organized by algebraic weight. |
| `LRA.VolumeI.Operations.Operations` | `LRA.VolumeI.Operations.Operations` | namespace corrected | Public declarations now live under `LRA.VolumeI.Operations`, not `LRA.VolumeI.Algebra.Operations`. |
| `LRA.VolumeI.Operations.Laws` | `LRA.VolumeI.Operations.Laws` | namespace corrected | Operation laws now live under `LRA.VolumeI.Operations`. |

## New Contract Routers

| Module | Status | Notes |
| --- | --- | --- |
| `LRA.VolumeI.Functions` and children | added | First-pass compile-safe function vocabulary homes. |
| `LRA.VolumeI.Set.Families` | added and filled | Public indexed-family wrappers, membership criteria, and monotonicity statements. |
| `LRA.VolumeI.Set.PowerSets` | added and filled | Public absolute and relative power-set vocabulary. |
| `LRA.VolumeI.Identity.{Equality,Substitution,Extensionality,EqualityCongruence}` | added and filled | Contract homes now expose named equality, substitution, extensionality, and equality-congruence bridge statements. |
| `LRA.VolumeI.Relations.Equivalence` and children | added | Canonical homes for equivalence vocabulary. |
| `LRA.VolumeI.Algebra.Signatures` and children | added | First-pass signature/notation tree; number-system-heavy implementation remains deferred. |
| `LRA.VolumeI.Algebra.Models.{Interpretations,Satisfaction,Homomorphism,Embedding,Isomorphism,Substructure,ProductStructure,QuotientStructure,KernelRelation,KernelCongruence}` | added | Contract homes; existing number-system model implementation remains build-preserving carry-forward. |
| `LRA.VolumeI.Algebra.UniversalProperties.Basic` and children | added | Number-system universal properties remain deferred. |

## Declaration Renames

| Old declaration | New declaration | Status |
| --- | --- | --- |
| `LRA.VolumeI.Algebra.Operations.BinaryOperation` | `LRA.VolumeI.Operations.BinaryOperation` | moved by namespace |
| `LRA.VolumeI.Algebra.Operations.UnaryOperation` | `LRA.VolumeI.Operations.UnaryOperation` | moved by namespace |
| `LRA.VolumeI.Algebra.Identity` | `LRA.VolumeI.Operations.Identity` | moved by namespace |
| `LRA.VolumeI.Algebra.Inverse` | `LRA.VolumeI.Operations.Inverse` | moved by namespace |
| `LRA.VolumeI.Algebra.Distributive` | `LRA.VolumeI.Operations.Distributive` | moved by namespace |
| `LRA.VolumeI.Algebra.LeftIdentity` | `LRA.VolumeI.Operations.LeftIdentity` | moved by namespace |
| `LRA.VolumeI.Algebra.RightIdentity` | `LRA.VolumeI.Operations.RightIdentity` | moved by namespace |
| `LRA.VolumeI.Algebra.LeftInverse` | `LRA.VolumeI.Operations.LeftInverse` | moved by namespace |
| `LRA.VolumeI.Algebra.RightInverse` | `LRA.VolumeI.Operations.RightInverse` | moved by namespace |
| `LRA.VolumeI.Algebra.LeftDistributive` | `LRA.VolumeI.Operations.LeftDistributive` | moved by namespace |
| `LRA.VolumeI.Algebra.RightDistributive` | `LRA.VolumeI.Operations.RightDistributive` | moved by namespace |
| `LRA.VolumeI.Algebra.LeftAbsorbing` | `LRA.VolumeI.Operations.LeftAbsorbing` | moved by namespace |
| `LRA.VolumeI.Algebra.RightAbsorbing` | `LRA.VolumeI.Operations.RightAbsorbing` | moved by namespace |
| `StrictOrder` | `StrictPartialOrder` | renamed | Contract name. |
| `characteristic_zero` | `CharacteristicZero` | PascalCase |
| `integer_rational_real_have_characteristic_zero` | `IntegerRationalRealHaveCharacteristicZero` | PascalCase |
| `rationals_are_countable` | `RationalsAreCountable` | PascalCase |
| `reals_are_uncountable` | `RealsAreUncountable` | PascalCase |
| `canonical_construction` | `CanonicalConstruction` | PascalCase |
| `number_system_tower_exists` | `NumberSystemTowerExists` | PascalCase |
| `default_real_construction_is_dedekind` | `DefaultRealConstructionIsDedekind` | PascalCase |
| `default_rational_construction_is_canonical` | `DefaultRationalConstructionIsCanonical` | PascalCase |
| `composite_integer_to_real` | `CompositeIntegerToReal` | PascalCase |
| `composite_integer_to_real_is_embedding` | `CompositeIntegerToRealIsEmbedding` | PascalCase |
| `comparison_matrix_for_z_q_r` | `ComparisonMatrixForZQR` | PascalCase |
| `integer_zero_is_absorbing` | `IntegerZeroIsAbsorbing` | PascalCase |
| `integer_multiplicative_cancellation` | `IntegerMultiplicativeCancellation` | PascalCase |
| `inverse_domain` | `InverseDomain` | PascalCase |
| `partial_inverse` | `PartialInverse` | PascalCase |
| `partial_division` | `PartialDivision` | PascalCase |
| `LRA.VolumeI.Set.first` | `LRA.VolumeI.Set.FirstProjection` | PascalCase |
| `LRA.VolumeI.Set.second` | `LRA.VolumeI.Set.SecondProjection` | PascalCase |
| `LRA.VolumeI.Set.cartesianProduct` | `LRA.VolumeI.Set.CartesianProduct` | PascalCase |
| `peanoSignature` | `PeanoFirstOrderSignature` | PascalCase; first-order language object |
| `additiveOrderedSignature` | `AdditiveOrderedFirstOrderSignature` | PascalCase; first-order language object |
| `arithmeticRingSignature` | `ArithmeticRingFirstOrderSignature` | PascalCase; first-order language object |
| `orderedSemiringSignature` | `OrderedSemiringFirstOrderSignature` | PascalCase; first-order language object |
| `orderedRingSignature` | `OrderedRingFirstOrderSignature` | PascalCase; first-order language object |
| `fieldSignature` | `FieldFirstOrderSignature` | PascalCase; first-order language object |
| `orderedFieldSignature` | `OrderedFieldFirstOrderSignature` | PascalCase; first-order language object |
| `peanoModel` | `BuildPeanoModel` | PascalCase model builder |
| `additiveOrderedModel` | `BuildAdditiveOrderedModel` | PascalCase model builder |
| `arithmeticRingModel` | `BuildArithmeticRingModel` | PascalCase model builder |
| `orderedSemiringModel` | `BuildOrderedSemiringModel` | PascalCase model builder |
| `orderedRingModel` | `BuildOrderedRingModel` | PascalCase model builder |
| `fieldModel` | `BuildFieldModel` | PascalCase model builder |
| `orderedFieldModel` | `BuildOrderedFieldModel` | PascalCase model builder |
| `OrderedRingSignature.subtraction` | `OrderedRingSignature.Subtraction` | PascalCase derived operation |
| `countable` | `Countable` | PascalCase cardinality predicate |
| `uncountable` | `Uncountable` | PascalCase cardinality predicate |
| `OrderedRingSignature.strict_order` | `OrderedRingSignature.StrictOrder` | PascalCase operation-bundle field |
| `OrderedRingSignature.nonstrict_order` | `OrderedRingSignature.NonstrictOrder` | PascalCase operation-bundle field |
| `OrderedSemiringSignature.strict_order` | `OrderedSemiringSignature.StrictOrder` | PascalCase operation-bundle field |
| `OrderedSemiringSignature.nonstrict_order` | `OrderedSemiringSignature.NonstrictOrder` | PascalCase operation-bundle field |
| `AdditiveOrderedSignature.strict_order` | `AdditiveOrderedSignature.StrictOrder` | PascalCase operation-bundle field |
| `AdditiveOrderedSignature.nonstrict_order` | `AdditiveOrderedSignature.NonstrictOrder` | PascalCase operation-bundle field |
| `Algebra.Models.RingLaws.addition_is_associative` | `Algebra.Models.RingLaws.AdditionIsAssociative` | PascalCase public field |
| `Algebra.Models.RingLaws.zero_is_additive_identity` | `Algebra.Models.RingLaws.ZeroIsAdditiveIdentity` | PascalCase public field |
| `Algebra.Models.RingLaws.negation_is_additive_inverse` | `Algebra.Models.RingLaws.NegationIsAdditiveInverse` | PascalCase public field |
| `Algebra.Models.RingLaws.multiplication_left_distributes_over_addition` | `Algebra.Models.RingLaws.MultiplicationLeftDistributesOverAddition` | PascalCase public field |
| `Algebra.Models.OrderLaws.nonstrict_order_agrees_with_strict_order` | `Algebra.Models.OrderLaws.NonstrictOrderAgreesWithStrictOrder` | PascalCase public field |
| `Algebra.Models.OrderedRingCompatibilityLaws.addition_preserves_strict_order` | `Algebra.Models.OrderedRingCompatibilityLaws.AdditionPreservesStrictOrder` | PascalCase public field |
| `Algebra.Models.IntegralDomainLaws.zero_is_not_one` | `Algebra.Models.IntegralDomainLaws.ZeroIsNotOne` | PascalCase public field |
| `Algebra.Models.IntegralDomainLaws.has_no_zero_divisors` | `Algebra.Models.IntegralDomainLaws.HasNoZeroDivisors` | PascalCase public field |
| `Algebra.Models.IntegerLaws.order_is_discrete` | `Algebra.Models.IntegerLaws.OrderIsDiscrete` | PascalCase public field |
| `Algebra.Models.RationalLaws.ordered_integral_domain_laws` | `Algebra.Models.RationalLaws.OrderedIntegralDomainLaws` | PascalCase public field |
| `Algebra.Models.RationalLaws.inverse_is_multiplicative_inverse` | `Algebra.Models.RationalLaws.InverseIsMultiplicativeInverse` | PascalCase public field |
| `Algebra.Models.RationalLaws.order_is_dense` | `Algebra.Models.RationalLaws.OrderIsDense` | PascalCase public field |
| `Algebra.Models.RealLaws.rational_like_laws` | `Algebra.Models.RealLaws.RationalLikeLaws` | PascalCase public field |
| `Algebra.Models.RealLaws.least_upper_bound_property` | `Algebra.Models.RealLaws.LeastUpperBoundProperty` | PascalCase public field |
| `Algebra.Models.IntegerEmbeddingIntoRational.to_rational` | `Algebra.Models.IntegerEmbeddingIntoRational.ToRational` | PascalCase public field |
| `Algebra.Models.RationalExtension.rational_model` | `Algebra.Models.RationalExtension.RationalModel` | PascalCase public field |
| `Algebra.Models.RationalExtension.integer_embedding` | `Algebra.Models.RationalExtension.IntegerEmbedding` | PascalCase public field |
| `Algebra.Models.RationalExtension.archimedean_property` | `Algebra.Models.RationalExtension.ArchimedeanProperty` | PascalCase public field |
| `Algebra.Models.RationalEmbeddingIntoReal.to_real` | `Algebra.Models.RationalEmbeddingIntoReal.ToReal` | PascalCase public field |
| `Algebra.Models.RealExtension.real_model` | `Algebra.Models.RealExtension.RealModel` | PascalCase public field |
| `Algebra.Models.RealExtension.rational_embedding` | `Algebra.Models.RealExtension.RationalEmbedding` | PascalCase public field |
| `Algebra.Models.RealExtension.rational_embedding_is_cofinal` | `Algebra.Models.RealExtension.RationalEmbeddingIsCofinal` | PascalCase public field |
| `Algebra.Models.CanonicalEmbeddings.*.preserves_*` | `Algebra.Models.CanonicalEmbeddings.*.Preserves*` | PascalCase public fields |
| `Algebra.Models.ComparisonMatrix.*_structure` | `Algebra.Models.ComparisonMatrix.*Structure` | PascalCase public fields |
| `Algebra.Models.UniversalProperties.*_property` | `Algebra.Models.UniversalProperties.*Property` | PascalCase public fields |
| `lefts_are_equal` / `rights_are_equal` | `LeftsAreEqual` / `RightsAreEqual` | PascalCase local hypotheses |
| `left_identity_law` / `right_identity_law` | `LeftIdentityLaw` / `RightIdentityLaw` | PascalCase local hypotheses |
| `first_identity_law` / `second_identity_law` | `FirstIdentityLaw` / `SecondIdentityLaw` | PascalCase local hypotheses |
| `integer_model` / `rational_model` / `real_model` | `SelectedIntegerModel` / `SelectedRationalModel` / `SelectedRealModel` | PascalCase local binders |
| `rational_extension` / `real_extension` | `SelectedRationalExtension` / `SelectedRealExtension` | PascalCase local binders |
| `upper_bound` | `UpperBound` | PascalCase local mathematical object |
| `source_*` / `target_*` | `Source*` / `Target*` | PascalCase local structure parameters |
| `*_map`, `*_value`, `*_ledger` | `*Map`, `*Value`, `*Ledger` | PascalCase local mathematical objects |
| `namespace ModelSet` | `namespace LRA.VolumeI.Set.ModelSet` | Horizontal dotted namespace |
| `namespace LRASet` | `namespace LRA.VolumeI.Set.LRASet` | Horizontal dotted namespace |
| `namespace OrderedRingSignature` | `namespace LRA.VolumeI.Algebra.Models.OrderedRingSignature` | Horizontal dotted namespace |
| `namespace OrderedFieldSignature` | `namespace LRA.VolumeI.Algebra.Models.OrderedFieldSignature` | Horizontal dotted namespace |
| `ModelSet.member` | `ModelSet.Member` | PascalCase public field |
| `LRASet.member` | `LRASet.Member` | PascalCase public field |
| `LRASet.empty` | `LRASet.Empty` | PascalCase public operation |
| `LRASet.universal` | `LRASet.Universal` | PascalCase public operation |
| `LRASet.singleton` | `LRASet.Singleton` | PascalCase public operation |
| `LRASet.union` | `LRASet.Union` | PascalCase public operation |
| `LRASet.intersection` | `LRASet.Intersection` | PascalCase public operation |
| `LRASet.complement` | `LRASet.Complement` | PascalCase public operation |
| `LRASet.difference` | `LRASet.Difference` | PascalCase public operation |
| `LRASet.subset` | `LRASet.Subset` | PascalCase public relation |
| `LRASet.nonempty` | `LRASet.Nonempty` | PascalCase public predicate |
| `LRASet.indexedUnion` | `LRASet.IndexedUnion` | PascalCase public operation |
| `LRASet.indexedIntersection` | `LRASet.IndexedIntersection` | PascalCase public operation |
| `LRASet.extensionality` | `LRASet.Extensionality` | PascalCase public principle |
| `PartialUnaryOperation.domain` / `.value` | `PartialUnaryOperation.Domain` / `.Value` | PascalCase public fields |
| `PartialBinaryOperation.domain` / `.value` | `PartialBinaryOperation.Domain` / `.Value` | PascalCase public fields |
| `Partition.block` / `.covers` / `.nonemptyBlocks` / `.disjointOrEqual` | `Partition.Block` / `.Covers` / `.NonemptyBlocks` / `.DisjointOrEqual` | PascalCase public fields |
| `Poset.carrier` / `.order` / `.orderIsPartial` | `Poset.Carrier` / `.Relation` / `.RelationIsPartialOrder` | PascalCase public fields; avoids duplicated `Order` namespace |
| `Algebra.Structures.*` lowerCamel fields | PascalCase semantic fields | Examples: `Carrier`, `Operation`, `IdentityElement`, `Addition`, `Multiplication`, `Negation`, `Inverse`, `Order`. |
| `Algebra.Signatures.Algebraic.*` lowerCamel symbol fields | PascalCase symbol fields | Examples: `OperationSymbol`, `IdentitySymbol`, `ZeroSymbol`, `MultiplicationSymbol`, `InverseSymbol`. |
| `Algebra.Signatures.Ordered.*.orderSymbol` | `OrderSymbol` | PascalCase public field |
| `FormalVocabulary.OperationSymbols.arity` | `FormalVocabulary.OperationSymbols.ArityOf` | PascalCase public field |
| `FormalVocabulary.RelationSymbols.arity` | `FormalVocabulary.RelationSymbols.ArityOf` | PascalCase public field |
| `NotationAssignment.symbol` / `.token` / `.role` | `NotationAssignment.SymbolValue` / `.Token` / `.Role` | PascalCase public fields |
| Universal-property record fields | PascalCase fields | `ExistsArrow`, `UniqueArrow`, `LeftProjection`, `RightProjection`, `ExistsMediator`, `UniqueMediator`, `ExistsFactor`, `UniqueFactor`, `ExistsExtension`, `UniqueExtension`. |
| `Algebra.Models.AbstractLaws` lowerCamel law fields | PascalCase law fields | Generic law records only; number-system model records remain deferred. |

## Deferred

- TeX `\LeanFormalizes` updates.
- Full number-system tower relocation/enhancement with Volume II.
- Full split of existing number-system-heavy `Algebra.Models.*` implementation
  into final homes.
- Replacing downstream short `Equivalence` references with
  `EquivalenceRelation`, if desired, during the TeX/Volume II pass.
- Internal ZFC `SchemaFacts` namespace normalization, if/when the ZFC internals
  are included in a naming pass.
