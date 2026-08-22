# LRA Number Systems Review

## Scope

Maintained review of the number-system model/configuration layer and its relationship to the canonical algebraic-structure certificates.

This review distinguishes:

- broad structural model classes (`IntegerModel`, `RationalModel`, `RealModel`);
- actual concrete constructions of `Z`, `Q`, and `R`;
- universal properties that are supposed to pin those concrete systems down up to the appropriate notion of unique map/isomorphism.

Project-wide rule: `sorry` proof bodies are neutral. Under-specified theorem statements and selectors whose result type is detached from their configuration are not neutral.

---

# Files reviewed

- `LRA/AlgebraicStructures/IntegralDomain/Laws/Definition.lean`
- `LRA/AlgebraicStructures/OrderedSemiring/Laws/Definition.lean`
- `LRA/AlgebraicStructures/OrderedRing/Laws/Definition.lean`
- `LRA/AlgebraicStructures/LinearlyOrderedRing/Laws/Definition.lean`
- `LRA/AlgebraicStructures/OrderedField/Laws/Definition.lean`
- `LRA/AlgebraicStructures/CompleteOrderedField/Laws/Definition.lean`
- `LRA/AlgebraicStructures/DiscreteInteger/Laws/Definition.lean`
- `LRA/Order/DiscreteOrder/Definition.lean`
- `LRA/VolumeII/NumberSystems/Models.lean`
- `LRA/VolumeII/NumberSystems/CanonicalEmbeddings.lean`
- `LRA/VolumeII/NumberSystems/UniversalProperties.lean`
- `LRA/VolumeII/NumberSystems/CharacteristicCardinality.lean`
- `LRA/VolumeII/NumberSystems/ComparisonMatrix.lean`
- `LRA/VolumeII/NumberSystems/Construction.lean`

---

# Canonical algebraic transition certificates

The canonical structure chain is mathematically sound in the reviewed portion.

## Integral domains

`IntegralDomainLaws` is

```text
CommutativeRingLaws
+ NontrivialityLaw
+ NoZeroDivisorsLaw.
```

This is the standard integral-domain requirement.

**Verdict: PASS.**

## Ordered semirings and rings

The ordered structures reuse `LRA.Order` rather than defining a parallel order theory.

`OrderedSemiringLaws` uses a linear order plus addition/multiplication compatibility.

`OrderedRingLaws` deliberately uses a partial order; `LinearlyOrderedRingLaws` is the separate stronger certificate.

This distinction is mathematically legitimate. Downstream code should not infer linearity merely from the name `OrderedRingLaws`.

**Verdict: PASS, naming convention should be documented.**

## Ordered and complete ordered fields

`OrderedFieldLaws` correctly combines field/nontriviality/inverse laws with a linear order and operation compatibility.

`CompleteOrderedFieldLaws` is simply

```text
OrderedFieldLaws R ∧ OrderCompletenessLaws R SetObject.
```

This is excellent ownership: completeness remains order-theoretic, and Archimedeanness is not inserted as an independent axiom.

**Verdict: PASS.**

---

# Two notions of integer discreteness

The repository has two distinct ideas:

1. `OrderDiscretenessLaw`: there is no element strictly between `a` and `a+1`;
2. successor/predecessor `DiscretenessLaw`: successor is aperiodic from zero and two-sided induction reaches every element.

These are not the same certificate and no reviewed bridge currently ties them together.

`IntegerModel` uses the first, not the second.

This is legitimate for a broad class of discretely ordered integral domains, but it means `IntegerModel` is broader than “the integers.”

**Severity: P1 conceptual/ownership gap.**

Recommended: define a clearly named combined `DiscreteIntegerLaws`/`IntegerSystemLaws` if the project wants a single requirements bundle for concrete integer systems, and prove relationships between order-discreteness and successor-based discreteness under the relevant ring/order hypotheses.

---

# Structural model classes

## `IntegerModel`

Packages a linearly ordered, order-compatible integral domain with discrete order.

This is a useful structural class, but it is not by itself a categorical definition of `Z`.

## `RationalModel`

Packages a densely ordered field.

This is **far broader** than `Q`. In particular, `Real` itself satisfies the structural requirements and can be packaged as a `RationalModel` through the Mathlib bridge.

## `RealModel`

Extends `RationalModel` with LUB/order completeness over `Set Carrier`.

This is the standard structural characterization of a complete ordered field and is appropriately much more rigid.

### Naming recommendation

If these are intentionally broad model classes, names such as

```text
DiscreteOrderedIntegralDomainModel
DenseOrderedFieldModel
CompleteOrderedFieldModel
```

would communicate the semantics more directly.

Alternatively keep the shorter names but make the universal-property layer mandatory for calling a selected model “the integers/rationals/reals.”

---

# P0 — `RationalsAreCountable` is false for arbitrary `RationalModel`

Current theorem:

```text
∀ SelectedRationalModel : RationalModel,
  Countable SelectedRationalModel.Carrier.
```

But `RationalModel` means only “densely ordered field.” `Real` is a densely ordered field, and `RationalModel.ofCarrier Real` is available through the Mathlib certificates.

`Real` is uncountable, so this theorem is false.

### Repair

State countability for the actual selected rational construction satisfying the rational/fraction-field universal property, or for the concrete `Rat` realization.

Do not infer countability from dense ordered-field laws alone.

**Severity: P0 FALSE THEOREM.**

The file also locally defines `Countable` by a surjection `Nat -> α`, duplicating the canonical carrier/cardinality vocabulary reviewed earlier. Migrate to the canonical countability predicates and bridge conventions.

---

# Universal properties are missing uniqueness

## Integer universal property

Current `InitialForDiscreteOrderedRings` requires

```text
for every target, exists map, preserves ordered-ring structure.
```

An initial-object universal property requires a **unique** morphism.

The existence portion is useful but does not express initiality.

**Severity: P0/P1 statement under-specification.**

## Rational fraction-field property

Current statement says every integer embedding into a target rational model **extends to some** rational embedding.

The fraction-field universal property requires the extension to be unique (with the usual target hypotheses).

Again, existence alone is not the universal property named by the structure.

**Severity: P0/P1 statement under-specification.**

## Real uniqueness up to isomorphism

`UniqueUpToOrderedFieldIsomorphism` currently concludes only that there exists an `EmbeddingPreservesOrderedField` into every other real model.

`EmbeddingPreservesOrderedField` is injective but has no surjectivity field.

Therefore the record does not state an isomorphism, much less uniqueness of the isomorphism.

A separate theorem might later prove any such embedding between complete ordered fields is surjective, but that fact is not part of the current declaration.

### Repair

Use an explicit ordered-field isomorphism structure, or require:

```text
bijective comparison
+ field/order preservation
```

and then separately prove uniqueness if the intended theorem is canonical uniqueness.

**Severity: P0 CHARACTERIZATION NAME/STATEMENT MISMATCH.**

---

# P0 — configurable construction selector is detached from configuration

Current:

```text
NumberSystemTowerExists
  (construction : NumberSystemConstruction) :
  Nonempty NumberSystemTower
```

The result type does not mention `construction`.

Hence one fixed arbitrary tower proves the theorem for every configuration. There is no formal requirement that the `.dedekind` branch actually contains a Dedekind-cut real construction, that `.cauchy` contains a Cauchy construction, etc.

`BuildNumberSystemTower construction` therefore selects an arbitrary tower, not a tower certified to realize the chosen construction.

Similarly:

```text
DefaultRealConstructionIsDedekind
```

only proves that the enum field of `CanonicalConstruction` is `.dedekind`; it says nothing about the carrier inside `DefaultTower`.

### Repair

Index or relate the tower to the construction, for example:

```text
structure RealizesConstruction
    (configuration : NumberSystemConstruction)
    (tower : NumberSystemTower) : Prop := ...

NumberSystemTowerExists configuration :
  ∃ tower, RealizesConstruction configuration tower
```

or use dependent constructors whose result stores the chosen construction witness.

**Severity: P0 CONFIGURATION/SEMANTIC DETACHMENT.**

`Classical.choice` used after this existential is ordinary single-witness extraction; it is not a new mathematical AC dependency.

---

# P1/P0 — comparison matrix is not tied to the supplied systems

`SystemLedger` stores a carrier and several bare `Prop` fields such as

```text
HasRingOrFieldStructure : Prop
HasOrder : Prop
HasCompletenessProperty : Prop
```

but those propositions do not mention the ledger carrier.

`ComparisonMatrixForZQR` then merely asserts existence of ledgers whose selected proposition fields hold. It does not require their carriers to equal the supplied model carriers or the propositions to be the actual structure certificates of those carriers.

Thus arbitrary ledgers with fields set to `True` can satisfy the statement.

### Repair

Make the ledger fields derived predicates of the carrier/certificates, or construct concrete ledgers definitionally from each supplied model and prove their entries.

**Severity: P1 if documentation-only; P0 if treated as a formal certification theorem.**

---

# Canonical embeddings

The embedding records themselves are well shaped:

- injective;
- preserve zero/one/addition/negation/multiplication;
- preserve and reflect order;
- field embeddings preserve inversion on nonzero elements.

Composite integer-to-real embedding is a natural derived theorem.

**Verdict: PASS.**

What is missing is a canonical-map uniqueness theorem where universal properties require it.

---

# Choice audit

No new genuine family-wise AC dependency was identified in this chunk.

- selecting a tower with `Classical.choice` from a single existential is witness extraction, not AC;
- universal-property existence statements do not themselves create an AC dependency;
- no arbitrary family of nonempty sets is being simultaneously selected here.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Integral-domain laws | **PASS** |
| Ordered semiring/ring hierarchy | **PASS** |
| Ordered field laws | **PASS** |
| Complete ordered field composition | **PASS / EXCELLENT OWNERSHIP** |
| Two discreteness notions | **P1 BRIDGE NEEDED** |
| `IntegerModel` as broad structural class | **VALID BUT BROADER THAN Z** |
| `RationalModel` as broad structural class | **VALID BUT FAR BROADER THAN Q** |
| `RealModel` | **PASS STRUCTURAL CHARACTERIZATION** |
| `RationalsAreCountable` for arbitrary `RationalModel` | **P0 FALSE** |
| Integer initiality property | **MISSING UNIQUENESS** |
| Rational fraction-field property | **MISSING UNIQUENESS** |
| Real unique-up-to-isomorphism property | **P0 ONLY STATES EMBEDDING** |
| Canonical embedding records | **PASS** |
| Construction selector | **P0 DETACHED FROM CONFIGURATION** |
| Comparison matrix | **SEMANTICALLY DETACHED / P1-P0** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Immediate repair order

1. repair `RationalsAreCountable` so it targets the actual rational construction, not arbitrary dense ordered fields;
2. add uniqueness to the integer and rational universal properties;
3. replace the real “isomorphism” claim with an actual ordered-field isomorphism/bijection plus uniqueness theorem as intended;
4. index/certify `NumberSystemTower` by its selected construction configuration;
5. tie comparison ledgers definitionally to their supplied carriers/certificates;
6. unify or bridge the two integer-discreteness notions;
7. migrate local countability vocabulary to the canonical Carrier/Cardinality layer;
8. then audit each concrete integer/rational/real construction and its certificate registrations.