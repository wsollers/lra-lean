# Volume I Restructure Contract

Status: review draft before any file moves or declaration renames.

Purpose: define the target `LRA/VolumeI` layout and the concept inventory it
must preserve. Folder/file names are the physical Lean plan; concept lists are
the mathematical contract so important notions do not disappear into vague
catch-all files.

## Ground Rules

- Take a checkpoint commit before the migration begins.
- Public LRA declarations use PascalCase.
- Public namespaces use one dotted namespace declaration, for example:
  `namespace LRA.VolumeI.Algebra.Structures.Elementary`.
- Snake case is reserved only for genuinely private/local helpers, if needed.
- No compatibility aliases by default; this migration may be breaking.
- Keep a migration ledger mapping old module/declaration names to new ones.
- First make Lean compile, then update TeX `\LeanFormalizes` references.
- Do not expand theorem scope or improve proofs unless needed to compile.
- Do not complete proofs during the restructure. Preserve existing proof status;
  when a moved or newly split declaration needs an unfinished proof, use
  `sorry`.
- Prefer mathematical role names over vague placeholders. Short names such as
  `S`, `A`, `x`, `y` are fine in small textbook scopes, but named objects with
  specific roles should use descriptive names.

## Governing Chain

```text
logic -> sets/products -> identity/equality -> relations -> functions
      -> operations -> algebraic structures -> models/number systems
      -> universal properties
```

Equality is not treated as merely another relation in the exposition. It is the
substitution principle relied on downstream.

## Physical File Tree

First-pass note: existing number-system-heavy files under
`LRA/VolumeI/Algebra/Models` may remain as deferred implementation modules for
now. They are build-preserving carry-forward files, not the final intended
home for number-system construction material.

```text
LRA
  VolumeI.lean

  VolumeI
    Logic.lean
    Logic
      Language.lean
      Model.lean
      Proof.lean
      Semantics.lean
      Syntax.lean
      Language
        ...
      Model
        ...
      Proof
        ...
      Semantics
        ...
      Syntax
        ...

    Set.lean
    Set
      Set.lean
      Products.lean
      Families.lean
      PowerSets.lean
      ZFC.lean
      ZFC
        Language.lean
        Model.lean
        Semantics.lean
        Syntax.lean
        Theory.lean
        Language
          ...
        Model
          ...
        Semantics
          ...
        Syntax
          ...
        Theory
          ...

    Identity.lean
    Identity
      Equality.lean
      Substitution.lean
      Extensionality.lean
      EqualityCongruence.lean

    Relations.lean
    Relations
      Basic.lean
      Basic
        Relations.lean
        Properties.lean
        Theorems.lean

      Equivalence.lean
      Equivalence
        EquivalenceRelation.lean
        EquivalenceClass.lean
        Partition.lean
        QuotientSet.lean
        FundamentalTheorem.lean

      Order.lean
      Order
        Relations.lean
        OrderStructures.lean
        OrderStructures
          Preorder.lean
          PartialOrder.lean
          Poset.lean
          StrictPartialOrder.lean
          TotalOrder.lean
          LinearOrder.lean
          StrictTotalOrder.lean
          StrictLinearOrder.lean
          WellOrder.lean
        Correspondence.lean
        Bounds.lean
        Lattices.lean
        Completeness.lean
        Density.lean
        Directed.lean
        WellFounded.lean

    Functions.lean
    Functions
      Functions.lean
      Images.lean
      Preimages.lean
      Fibers.lean
      Composition.lean
      IdentityFunction.lean
      Injective.lean
      Surjective.lean
      Bijective.lean
      Inverses.lean
      SectionsRetractions.lean

    Operations.lean
    Operations
      Arity.lean
      Laws.lean
      IdentityElements.lean
      Inverses.lean
      Distributivity.lean
      Compatibility.lean

    Algebra.lean
    Algebra
      Structures.lean
      Structures
        Elementary.lean
        Elementary
          Magma.lean
          Semigroup.lean
          Monoid.lean
          Group.lean
          AbelianGroup.lean

        RingLike.lean
        RingLike
          Semiring.lean
          Ring.lean
          IntegralDomain.lean
          Field.lean

        Ordered.lean
        Ordered
          OrderedMagma.lean
          OrderedMonoid.lean
          OrderedGroup.lean
          OrderedRing.lean
          OrderedField.lean
          LatticeOrdered.lean

      Signatures.lean
      Signatures
        FormalVocabulary.lean
        FormalVocabulary
          OperationSymbols.lean
          RelationSymbols.lean
          ConstantSymbols.lean
          Arity.lean
          Notation.lean

        BasicArithmeticLanguage.lean
        BasicArithmeticLanguage
          PrimitiveOperationSymbols.lean
          PrimitiveRelationSymbols.lean
          DerivedOperationNotation.lean
          DerivedRelationNotation.lean

        Algebraic.lean
        Algebraic
          MagmaSignature.lean
          MonoidSignature.lean
          GroupSignature.lean
          RingSignature.lean
          FieldSignature.lean

        Ordered.lean
        Ordered
          OrderedMagmaSignature.lean
          OrderedGroupSignature.lean
          OrderedRingSignature.lean
          OrderedFieldSignature.lean

        NumberSystem.lean
        NumberSystem
          NaturalNumberSignature.lean
          IntegerSignature.lean
          RationalSignature.lean
          RealSignature.lean

      Models.lean
      Models
        Interpretations.lean
        Satisfaction.lean
        Homomorphism.lean
        Embedding.lean
        Isomorphism.lean
        Substructure.lean
        ProductStructure.lean
        QuotientStructure.lean
        KernelRelation.lean
        KernelCongruence.lean

      UniversalProperties.lean
      UniversalProperties
        Basic.lean
        Basic
          InitialObjects.lean
          FreeObjects.lean
          ProductUniversalProperty.lean
          QuotientUniversalProperty.lean
```

## Concept Inventory

### Logic

Logic is not targeted for major refactor unless a compile or import issue forces
minimal adjustment. Its current subsystem layout remains conceptually accepted:

```text
Logic
  Language
  Syntax
  Semantics
  Model
  Proof
```

Public conceptual coverage:

```text
Propositions
Predicates
Quantifiers
Connectives
Implication
Equivalence
ProofRules
SubstitutionPrinciples
```

### Set

`Set/ZFC` is the internal foundational subtree. Public set vocabulary lives
beside it; no explicit `Internal` or `Public` folders are needed.

Concepts:

```text
Membership
Inclusion
Extensionality
EmptySet
Singleton
Union
Intersection
Difference
Complement
CartesianProducts
IndexedFamilies
PowerSets
ZFC.Language
ZFC.Syntax
ZFC.Semantics
ZFC.Model
ZFC.Theory
```

### Identity

Identity means equality and substitution, not identity elements for operations.

Concepts:

```text
Equality
EqualityReflexivity
EqualitySymmetry
EqualityTransitivity
LeibnizSubstitution
SubstitutionPreservesPredicates
SubstitutionPreservesRelationsLeft
SubstitutionPreservesRelationsRight
SubstitutionPreservesRelations
SubstitutionPreservesFunctions
SubstitutionPreservesOperationsLeft
SubstitutionPreservesOperationsRight
SubstitutionPreservesOperations
EqualityCongruence
ExtensionalEquality
```

Naming note: keep `EqualityCongruence`; do not revert to bare `Congruence`,
because `Operations.Compatibility.RespectsEquivalence` and
`Algebra.Models.KernelCongruence` are different senses.

### Relations.Basic

Concepts:

```text
UnaryRelation
BinaryRelation
NaryRelation
Reflexive
Irreflexive
Symmetric
Antisymmetric
Asymmetric
Transitive
Total
Connex
Trichotomous
ExactlyTrichotomous
Dense
LeftEuclidean
RightEuclidean
WellFounded
```

Theorem concepts:

```text
AsymmetricIffIrreflexiveAndAntisymmetric
IrreflexiveAndTransitiveImpliesAsymmetric
ReflexiveTransitiveRightEuclideanImpliesSymmetric
TrichotomousImpliesIrreflexive
TrichotomousImpliesAsymmetric
```

### Relations.Equivalence

Concepts:

```text
EquivalenceRelation
EquivalenceClass
EquivalenceClasses
Partition
PartitionFromEquivalence
EquivalenceFromPartition
QuotientSet
FundamentalTheoremOfEquivalenceRelations
```

Placement note: `KernelRelation` does not live here. It is an equivalence
relation induced by a homomorphism/map and belongs under `Algebra.Models`.

### Relations.Order

Concepts:

```text
LessThan
LessThanOrEqual
GreaterThan
GreaterThanOrEqual
StrictPart
NonStrictPart
Comparable
Preorder
PartialOrder
Poset
StrictPartialOrder
TotalOrder
LinearOrder
StrictTotalOrder
StrictLinearOrder
WellOrder
StrictFromNonStrict
NonStrictFromStrict
StrictNonStrictInverseCorrespondence
UpperBound
LowerBound
LeastElement
GreatestElement
MinimalElement
MaximalElement
Supremum
Infimum
LeastUpperBound
GreatestLowerBound
LeastUpperBoundProperty
GreatestLowerBoundProperty
Join
Meet
Lattice
CompleteLattice
OrderCompleteness
DenseOrder
DenseLinearOrder
DirectedSet
UpwardDirected
DownwardDirected
Chain
WellFoundedRelation
MinimalElementPrinciple
WellOrderingPrinciple
```

Well-ordering is explicit because it will support induction, recursion,
minimal-counterexample arguments, and the natural-number interface.

### Functions

Concepts:

```text
Function
FunctionAsRelation
Domain
Codomain
Graph
Image
DirectImage
Preimage
InverseImage
Fiber
Restriction
Extension
Composition
CompositionAssociative
IdentityFunction
LeftIdentityForComposition
RightIdentityForComposition
Injective
Surjective
Bijective
InverseFunction
LeftInverse
RightInverse
Section
Retraction
```

Preimage, Injective, Surjective, and Bijective stay explicit because they are
load-bearing for cardinality, embeddings, kernels, and quotient reasoning.

### Operations

Operations are properties of bare operations before they are bundled into named
algebraic structures.

Concepts:

```text
NullaryOperation
UnaryOperation
BinaryOperation
NaryOperation
ClosureAsCodomain
Associative
Commutative
Idempotent
Cancellative
LeftIdentityElement
RightIdentityElement
TwoSidedIdentityElement
UniquenessOfIdentityElement
AbsorbingElement
ZeroElement
OneElement
LeftInverse
RightInverse
TwoSidedInverse
UniquenessOfInverse
Involution
LeftDistributive
RightDistributive
TwoSidedDistributive
AbsorptionLaw
RespectsRelation
RespectsEquivalence
RespectsOrder
Monotone
StrictMonotone
TranslationInvariant
PositiveMultiplicationCompatible
```

### Algebra.Structures

Structures are algebra because they bundle carriers, operations, relations, and
laws into named systems. Their namespace placement under `Algebra` does not
force imports from later algebra modules.

Elementary one-operation structures:

```text
Magma
Semigroup
Monoid
CommutativeMonoid
Group
AbelianGroup
```

Ring-like two-operation structures:

```text
Semiring
Ring
IntegralDomain
Field
```

Ordered structures:

```text
OrderedMagma
OrderedMonoid
OrderedGroup
OrderedRing
OrderedField
LatticeOrderedStructure
```

### Algebra.Signatures

Rule:

```text
Signature = what primitive symbols exist.
Notation = how symbols are printed/read.
Model = what symbols mean.
Laws = what interpreted symbols satisfy.
```

Formal vocabulary:

```text
OperationSymbol
RelationSymbol
ConstantSymbol
Arity
InfixNotation
PrefixNotation
SuperscriptNotation
```

Basic arithmetic token pool:

```text
PrimitiveOperationSymbols
  ZeroSymbol
  OneSymbol
  AdditionSymbol
  NegationSymbol
  MultiplicationSymbol

PrimitiveRelationSymbols
  OrderSymbols

DerivedOperationNotation
  SubtractionSymbol
  DivisionSymbol
  PowerSymbol
  ModulusSymbol

DerivedRelationNotation
  DivisibilitySymbol
```

Divisibility is not generally primitive: usually `a | b` means
`exists c, b = a * c`. It may be primitive only in selected arithmetic
languages.

Algebraic signatures:

```text
MagmaSignature
MonoidSignature
GroupSignature
RingSignature
FieldSignature
```

Ordered signatures:

```text
OrderedMagmaSignature
OrderedGroupSignature
OrderedRingSignature
OrderedFieldSignature
```

Number-system signatures:

```text
NaturalNumberSignature
IntegerSignature
RationalSignature
RealSignature
```

Fine/universal-algebra note: taking unary negation as primitive in
`GroupSignature` is a deliberate Lean/universal-algebra choice. Fine-style
development may derive `-x` by solving an equation first; this does not
contradict the signature choice.

### Algebra.Models

Concepts:

```text
StructureAsInterpretation
ModelOfSignature
SatisfactionOfLaws
Homomorphism
Embedding
Isomorphism
Substructure
ProductStructure
QuotientStructure
KernelRelation
KernelCongruence
```

Kernel concepts belong here because they require maps/homomorphisms.

### Algebra.UniversalProperties

Basic concepts:

```text
InitialObject
FreeObject
ProductUniversalProperty
QuotientUniversalProperty
```

Number-system universal properties are deferred to a second pass with the
number-system material.

Deferred concepts:

```text
NumberSystemTower
NaturalNumberInterface
IntegerModel
RationalModel
RealModel
CanonicalEmbeddings
IntegerEmbeddingIntoRational
RationalEmbeddingIntoReal
PreservationOfOperations
PreservationOfOrder
Characteristic
CardinalityComparison
LocalizationProperty
FieldOfFractions
CompletionProperty
RealNumberCharacterization
```

Deferral note: number-system material should be saved for a later pass oriented
around Volume II, where the number systems sit and where the Peano/natural
number development can be enhanced coherently.

## Migration Ledger Shape

During implementation, maintain a temporary ledger:

```text
Old module | Old declaration | New module | New declaration | TeX impact | Status
```

Example:

```text
LRA.VolumeI.Operations.Laws | associative | LRA.VolumeI.Operations.Laws | Associative | yes | renamed
```
