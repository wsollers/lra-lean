# Omnibus Gap List

Source document:
`FoundationsOfArithmeticAndAlgebraAnOmnibusOfOperationsLawsAndAxiomsInTheAxiomaticStyleOfLandau.txt`

This list compares the omnibus outline against the current Lean modules under
`LRA/VolumeI`, `LRA/VolumeII`, and the early `LRA/VolumeIII` analysis layer.

## Status Key

- `Present`: definitions or theorem statements exist in the current tree.
- `Partial`: some core definitions exist, but named laws/theorems or important
  vocabulary are missing.
- `Missing`: no clear formal home exists yet.
- `Proof gap`: the statement exists, but the proof is still `sorry` or not yet
  attempted.

## Cross-Cutting Omnibus Requirements

These are not single theorem gaps, but they shape how the formalization should
be organized.

| Omnibus requirement | Current state | Gap |
| --- | --- | --- |
| Landau-style discipline: definitions are stipulations, theorems are proved from prior material only | Partial | Governance says not to complete proofs unless requested and to use explicit placeholders. We do not yet have a dependency discipline that enforces "from what precedes it and nothing else" inside Lean modules. |
| Continuous numbering within chapters | Missing | Lean modules do not currently encode omnibus numbering such as `Definition 0.1` or `Satz 1.6`. If wanted, add stable comments near declarations, not declaration-name numbering. |
| One-line orientation note per chapter, then formal content | Partial | Some modules have orientation comments, but not in an omnibus-aligned chapter system. |
| Abstract laws first, number systems as instances later | Partial | `VolumeI/Operations`, `Relations`, `Structures`, and `Algebra/Models` start this. The gap is a clean route from generic law bundles to `N`, `Z`, `Q`, `R`, `C` instantiation theorems. |
| Avoid repeating laws separately for each number system | Partial | Generic law bundles exist, but number-system files still carry their own construction-specific law statements. Need canonical generic theorem files and system-specific instance files. |
| Distinguish relation, operation, and function as primitive themes | Partial | Relations and operations now have homes. Functions do not yet have a first-class Volume I home. |
| Treat operations as functions `S^n -> S` | Partial | Nullary/unary/binary operation abbreviations exist, but the connection to an eventual function layer and general `n`-ary functions is not formalized. |
| Keep proof status honest | Present as practice | Many files use `sorry` and metadata comments. A uniform status convention for the omnibus-specific files would help. |
| Reference table as a catalogue, not new mathematics | Partial | Chapter 9 is summarized in this gap list, but there is not yet a Lean module collecting `L0`-`L34` as named catalogue declarations. |
| Instantiation chapter as final ledger | Partial | Model/switch files exist. Missing a readable `Instantiation` layer that says exactly where `N`, `Z`, `Q`, `R`, and `C` sit in the hierarchy. |

## Chapter 0: Sets, Relations, Operations, and Functions

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Primitive set, membership, subset, extensionality | Present in `LRA/VolumeI/Set/Set.lean` | The predicate-set layer has extensionality; model-internal ZFC set objects are present but not yet connected to the predicate-set theorem catalogue. |
| Union, intersection, complement, difference, empty, universal, singleton | Present in `LRA/VolumeI/Set/Set.lean` | Need named theorem catalogue: De Morgan, union/intersection identities, subset laws, complement laws, difference laws. |
| Indexed unions/intersections | Present in `LRA/VolumeI/Set/Set.lean` | Need theorem catalogue for arbitrary-family identities. |
| Ordered pair and Cartesian product | Present in `LRA/VolumeI/Set/Products.lean` | Need product extensionality theorem and stronger set-level product laws. |
| n-tuples and powers `S^n` | Partial via `Tuple` in `LRA/VolumeI/Set/Products.lean` | Need explicit `S^0`, `S^n`, and relation to product conventions if the omnibus numbering is formalized directly. |
| n-ary relations | Partial in `LRA/VolumeI/Relations/Relations.lean` | Unary and binary relations exist; general `n`-ary relations are not yet exposed as a reusable abstraction. |
| n-ary operations | Partial in `LRA/VolumeI/Operations/Operations.lean` | Nullary, unary, binary, external binary, and partial operations exist; general `n`-ary operations are missing. |
| Named binary relation properties | Partial in `LRA/VolumeI/Relations/NamedRelations.lean` | Reflexive, irreflexive, symmetric, antisymmetric, transitive, connex, trichotomous, equivalence exist. Missing asymmetric, left-Euclidean, right-Euclidean, dense, well-founded as named primitive relation properties. Trichotomy currently states inclusive alternatives, not exactly-one exclusivity. |
| Interrelations among relation properties, Satz 0.8 | Missing | Need statements/proofs for asymmetry equivalences, irreflexive+transitive implies asymmetric, reflexive+transitive+right-Euclidean implies symmetric, trichotomy consequences. |
| Composite relation types | Partial in `LRA/VolumeI/Relations/Order/Laws.lean` and `NamedRelations.lean` | Preorder, partial order, strict order, total order, well-order, equivalence exist. Missing strict total order and theorem-level correspondence between strict/non-strict orders. |
| Equivalence relations and partitions | Partial | Equivalence law bundle exists; equivalence classes, partitions, and the fundamental theorem of equivalence relations are missing. |

## Chapter 0A: Functions

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Function as graph, domain, codomain | Missing as a set-theoretic layer | Lean functions and first-order model interpretations exist, but there is no `VolumeI/Functions` layer for graph-based functions. |
| Image, preimage, fibers | Missing | Need definitions over the project set layer. |
| Injective, surjective, bijective via fibers | Partial elsewhere | Embedding/injectivity fields exist in model files, but no general function theorem catalogue. |
| Restriction, extension, inverse function | Missing | Need definitions and theorem statements. |
| Composition, identity, inverse laws | Missing as general functions | Model embeddings/isomorphisms use maps, but no general composition algebra for functions. |
| Monoid of self-maps and group of bijections | Missing | Depends on the general function layer and the algebra structure layer. |
| Pointwise operations on function spaces | Missing | Operations exist, but no function-space transfer theorem. |
| Image/preimage set-operation laws | Missing | These are a major gap: image union/intersection/difference, preimage union/intersection/difference/complement, monotonicity, round-trip laws. |

## Chapter 1: Laws of a Single Binary Operation

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Associative, commutative | Present in `LRA/VolumeI/Operations/Laws.lean` | Need named theorem catalogue: generalized associativity and commuting factors. |
| Left/right/two-sided identity | Present | Need uniqueness of identity theorem. |
| Left/right/two-sided absorbing element | Present | Need uniqueness theorem and incompatibility with identity in nontrivial carrier. |
| Idempotence | Present as operation-wide idempotence | Omnibus also needs idempotent element. Current definition says every element is idempotent for the operation. |
| Left/right/two-sided inverses | Partial | Current inverse laws use a unary inverse operation. Need elementwise inverse relation and uniqueness theorems. |
| Cancellation laws | Missing in core `Operations/Laws.lean` | Some model-specific cancellation statements exist, but generic left/right cancellative laws are not present. |
| Commutativity collapses left/right laws | Missing | Needs theorem statements and proofs. |
| Divisibility preorder induced by a monoid | Missing | Need induced relation definition and preorder/compatibility theorem. |

## Chapter 2: Two Operations and Ring Skeleton

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Left/right/two-sided distributivity | Present in `LRA/VolumeI/Operations/Laws.lean` | Need theorem: commutative multiplication makes left/right distributivity equivalent. |
| Zero absorption from distributivity/cancellation | Partial | `integer_zero_is_absorbing` exists in `Models.lean` as a proof-pending model theorem; generic theorem is missing. |
| Abstract law of signs | Missing as generic theorem | Some sign/order obligations appear in model laws, but not the omnibus theorem. |
| Zero has no multiplicative inverse in nontrivial case | Missing generic theorem | Field laws have inverse requirements; no generic theorem. |

## Chapter 3: Algebraic Structure Hierarchy

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Magma, semigroup, monoid, group, abelian variants | Partial in `LRA/VolumeI/Structures/Structures.lean` and `Algebra/Models/AbstractLaws.lean` | Magma, semigroup, monoid, group, commutative monoid exist. Need commutative semigroup, abelian group structure, and clearer alignment between `Structures` and `AbstractLaws`. |
| Semiring, ring | Present but thin in `Structures.lean` | Need variants: commutative ring, ring with unity, nontrivial ring, integral domain, field as plain structures, not only model-law bundles. |
| Integral domain and field laws | Present in `LRA/VolumeI/Algebra/Models/Models.lean` and `AbstractLaws.lean` | Proof catalogue is missing: every field is an integral domain; cross-multiplication in a field. |

## Chapter 4: Order

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Strict linear order | Partial | Strict order and trichotomy fields exist, but trichotomy needs exact-one formulation for the omnibus. |
| Derived `>`, `≤`, `≥` from `<` | Partial in model signatures | `strict_order` and `nonstrict_order` are stored together; derived relation definitions are not centralized. |
| Basic properties of `≤` | Missing generic theorem | Need reflexive, antisymmetric, transitive, total proofs from strict linear order. |
| Ordered abelian group compatibility | Partial | Translation preservation exists as `strictlyPreservesRightTranslation`; ordered abelian group structure is not explicit. |
| Adding inequalities | Missing | Needs generic theorem. |
| Sign of element vs negative | Missing | Needs ordered group theorem. |
| Ordered ring/field compatibility | Present as law bundles | Need generic theorem catalogue: sign rules, multiply inequality by positive/negative, no ordered field structure on `C`. |

## Chapter 5: Absolute Value

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Abstract absolute value in ordered group/ring | Missing in Volume I | `RationalMetricData` contains an absolute-value operation and laws for Cauchy reals, but there is no general absolute-value layer. |
| Basic absolute-value properties | Partial only as assumptions | Need definitions and theorem statements/proofs for nonnegativity, zero iff zero, negation invariance, multiplicativity, triangle inequality, reverse triangle inequality. |

## Chapter 6: Subtraction and Division

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| General partial inverse operation from cancellation | Partial | `PartialUnaryOperation` and `PartialBinaryOperation` exist; no generic construction from cancellativity. |
| Subtraction as inverse to addition | Partial | `OrderedRingSignature.subtraction` exists; theorem catalogue is missing. |
| Division as inverse to multiplication | Partial | `OrderedFieldSignature.partial_division` exists; theorem catalogue is missing. |
| Fraction arithmetic and cross-ordering | Partial in rational-number construction | Specific rational quotient construction has many statements; generic field-level division laws are missing. |
| Division by zero impossible | Missing generic theorem | Needs statement in field/integral-domain layer. |

## Chapter 7: Exponentiation

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Natural-number powers in a monoid | Missing generic layer | Some place-value and dyadic files mention powers, but no reusable monoid exponentiation layer. |
| Natural exponent laws | Missing | Need induction-based theorem statements/proofs. |
| Negative integer exponents | Missing | Needs invertible-element/group layer first. |
| Integer exponent laws | Missing | Depends on negative exponent layer. |

## Chapter 8: Floor and Ceiling

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| Archimedean ordered field | Partial | Archimedean/cofinal clauses exist in model extension structures, but no standalone floor-facing abstraction. |
| Existence/uniqueness of floor | Missing | Needs ordered field with embedded integers and Archimedean/well-order ingredients. |
| Floor and ceiling definitions | Missing | No current general floor/ceiling layer. |
| Floor/ceiling laws | Missing | Ceiling duality, idempotence, monotonicity, integer shifts, floor sum bounds, fractional part all missing. |

## Chapter 9: Law Catalogue

Most L0-L34 laws are not yet collected in one reference module.

Present or partial:

- L0-L0″ relation basics: partial.
- L1-L9 operation laws: partial.
- L12-L13 distributivity: present as definitions.
- L14 no zero divisors: present as a field in integral-domain law bundles.
- L15-L19 order laws/compatibility: partial as definitions/law bundles.
- L29-L34 function image/preimage/composition laws: missing.

Major missing catalogue groups:

- L10-L11 cancellation definitions.
- L11′ induced divisibility preorder.
- L20-L21 sign and triangle inequality theorem layer.
- L22-L24 exponent laws.
- L25-L28 floor/ceiling laws.
- L29-L34 function/set-operation theorem layer.

## Chapter 10: N, Z, Q, R, C Instantiation

| Omnibus item | Current state | Gap |
| --- | --- | --- |
| `N` as semigroup/monoid and not group | Partial | Peano, natural-number, and active switch files exist. Need explicit omnibus instantiation theorem for `N` against the Volume I structure/law hierarchy. |
| `Z` as commutative ring with unity, integral domain, not field | Partial | Integer models and active `Int` switch exist; law bundle has `sorry`. Need explicit theorem statements and proof status. |
| `Q` as Archimedean ordered field, not complete | Partial | Rational construction/model files contain ordered-field and Archimedean/not-complete statements, mostly proof-pending. Need connect to Volume I model hierarchy and active switch. |
| `R` as complete Archimedean ordered field, uniqueness | Partial | Real construction files contain Dedekind/Cauchy/etc. statements and complete ordered field law bundles, mostly proof-pending. Need active switch law proofs and isomorphism bridge to Mathlib `Real`. |
| `C` as algebraically closed field, no compatible order | Partial | Complex construction/model files exist with field-model scaffolding. Algebraic closure and no-ordered-field theorem remain proof-pending/missing as final hierarchy statements. |

## Suggested Implementation Order

1. Finish the foundational theorem catalogue for `LRASet`: subset laws,
   Boolean set laws, De Morgan, and product extensionality.
2. Add `VolumeI/Functions` as a separate layer over sets/relations:
   graph-based functions, image, preimage, fiber, injective/surjective/bijective,
   restriction, extension, inverse, composition, identity.
3. Complete relation vocabulary: asymmetric, Euclidean, dense, well-founded,
   exact trichotomy, strict total order, strict/non-strict correspondence,
   equivalence classes and partitions.
4. Fill the generic operation law catalogue: cancellation, elementwise
   idempotence, elementwise inverse, uniqueness of identities/inverses,
   absorbing uniqueness, induced divisibility preorder.
5. Normalize `Structures` versus `Algebra/Models/AbstractLaws`: decide whether
   the main hierarchy lives as structures, law bundles, or both with clearly
   different roles.
6. Add ordered algebra theorem files: ordered group, ordered ring, sign laws,
   inequality multiplication.
7. Add absolute value, exponentiation, division/subtraction, and floor/ceiling
   as later algebra/analysis support layers.
8. Add explicit Chapter 10 instantiation theorem files for `N`, `Z`, `Q`, `R`,
   and `C`, first against active Mathlib switches and later against the custom
   constructed carriers.
