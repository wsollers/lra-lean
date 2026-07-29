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

## Deferred

- TeX `\LeanFormalizes` updates.
- Full number-system tower relocation/enhancement with Volume II.
- Full split of existing number-system-heavy `Algebra.Models.*` implementation
  into final homes.
- Replacing downstream short `Equivalence` references with
  `EquivalenceRelation`, if desired, during the TeX/Volume II pass.
