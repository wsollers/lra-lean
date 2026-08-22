# LRA Integer-to-Rational Tower Bridge Review

## Scope

Focused review of the transition from certified integer systems into rational systems and the relationship among:

- `IntegerModel`;
- `RationalModel`;
- `IntegerEmbeddingIntoRational`;
- `RationalExtension`;
- `RationalQuotientFractions`;
- `RationalNumbers/ComparisonModels.lean`.

Project rule: `sorry` proof bodies are neutral. Generic statements whose hypotheses do not imply their conclusions are defects.

---

# Canonical tower interfaces

The canonical model packages in `VolumeII/NumberSystems/Models.lean` are strong and appropriately thin.

`IntegerModel` is a carrier with canonical project certificates for:

- integral-domain structure;
- linear order;
- strict/nonstrict order compatibility;
- addition/multiplication order compatibility;
- discrete order.

`RationalModel` is a carrier with:

- ordered-field laws;
- strict-order compatibility;
- dense order.

These packages correctly reuse `LRA.AlgebraicStructures` rather than introducing another law vocabulary.

**Verdict: PASS.**

---

# Integer embedding into rationals

`IntegerEmbeddingIntoRational` is well shaped. It requires:

```text
injective
preserves 0, 1, +, -, *
preserves and reflects order
```

This is a genuine ordered-ring embedding certificate.

`RationalExtension` then adds:

```text
forall q, exists z, q < iota(z)
```

so the integer image is cofinal in the selected rational model.

This is a useful Archimedean/cofinality relation between adjacent number systems.

**Verdict: PASS.**

Important distinction: this is not by itself the fraction-field universal property. It describes how a selected integer model sits inside a selected rational-style model; uniqueness of extension into arbitrary fields belongs in a separate universal-property theorem.

---

# Missing concrete adapter

No reviewed adapter was found that starts from the concrete integer construction/certificates and constructs the required `IntegerAndPositiveNaturalData` for `RationalQuotientFractions`.

The quotient-fraction constructor therefore remains disconnected from the canonical tower:

```text
certified IntegerModel
    ?
    v
IntegerAndPositiveNaturalData
    -> RationalQuotientFractions
```

The missing bridge should derive the denominator source from a canonical positive-natural / positive-integer representation rather than requiring callers to supply arbitrary fields named:

```text
natural_carrier
absolute_numerator
gcd
power/multiplication-like data
```

without corresponding laws.

Recommended design:

```text
PositiveIntegerMagnitudeData integer_model
```

or a subtype of positive elements of a certified integer model, together with the exact facts needed by fraction construction and optional reduction.

For the core fraction field, gcd should not be required at all.

---

# Separate core fraction field from lowest-term normalization

The current rational construction mixes two concerns:

1. construct the fraction field;
2. prove every rational has a unique reduced numerator/denominator form.

Only (1) is needed to construct Q as a field.

The core construction needs:

- nonzero denominator representation;
- cross-multiplication equivalence;
- arithmetic well-definedness;
- reciprocals;
- ordered-field laws;
- density / Archimedean placement.

The reduced-form layer additionally needs genuine laws for:

- integer absolute value;
- divisibility;
- gcd;
- gcd normalization/sign conventions.

Recommendation: move reduced-form/gcd theory into a later number-theory enrichment module.

---

# P0 — `RationalNumbers/ComparisonModels.lean` is not a valid bridge

The comparison file contains generic theorem statements that are mathematically too weak.

## Cross-multiplication equivalence

It states `equivalent_is_equivalence_relation` for arbitrary:

```text
integer_multiplication : IntegerCarrier -> IntegerCarrier -> IntegerCarrier
natural_to_integer : NaturalCarrier -> IntegerCarrier
```

with no semiring/domain laws and no nonzero-denominator condition.

Cross-multiplication transitivity requires algebraic hypotheses; it is not an equivalence relation for arbitrary multiplication/map data.

**Severity: P0 FALSE GENERIC THEOREM.**

## Arbitrary operation respects arbitrary setoid

The file states forms equivalent to:

```text
forall setoid representative_addition,
  binary_operation_respects setoid representative_addition
```

and similarly for multiplication.

An arbitrary binary operation does not respect an arbitrary equivalence relation.

These declarations are plainly false at their advertised generality.

**Severity: P0 FALSE GENERIC THEOREMS.**

## Classification

Treat `RationalNumbers/ComparisonModels.lean` as legacy/orientation scaffold until these statements are replaced by bridges to the dedicated `RationalQuotientFractions` construction and canonical certificates.

---

# Correct adjacent-system ladder

Recommended formal path:

```text
Concrete certified integer carrier
    |
    v
IntegerModel.ofCarrier
    |
    +--> canonical positive-element / denominator data
    |
    v
Fraction quotient carrier
    |
    v
OrderedFieldLaws + DenseOrderLaw
    |
    v
RationalModel.ofCarrier
    |
    v
IntegerEmbeddingIntoRational
    |
    v
RationalExtension
```

Then separately prove the actual fraction-field universal property:

```text
for every field K and injective ring map Z -> K,
there exists a unique field map Q -> K extending it.
```

That theorem is what categorically pins the construction down as the fraction field.

---

# Choice audit

No new genuine family-wise AC dependency appears in this transition.

- choosing quotient operations or one extension witness from a proved existential is ordinary witness extraction;
- the fraction-field universal property itself does not require AC.

---

# Verdict

| Area | Verdict |
|---|---|
| `IntegerModel` canonical package | **PASS** |
| `RationalModel` canonical package | **PASS** |
| `IntegerEmbeddingIntoRational` | **PASS** |
| `RationalExtension` cofinality package | **PASS** |
| concrete integer -> denominator adapter | **MISSING** |
| core fraction-field / gcd separation | **NEEDS REFACTOR** |
| `ComparisonModels` cross-multiplication theorem | **P0 FALSE GENERICITY** |
| arbitrary operation/setoid compatibility theorems | **P0 FALSE** |
| fraction-field universal-property uniqueness | **MISSING (previously identified)** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Immediate repair order

1. quarantine/deprecate the false generic claims in `RationalNumbers/ComparisonModels.lean`;
2. derive denominator data from a certified integer/positive-natural layer;
3. remove gcd/lowest-term normalization from the core fraction-field construction;
4. prove the quotient carrier's canonical field/order certificates;
5. package with `RationalModel.ofCarrier`;
6. build the actual `IntegerEmbeddingIntoRational` for the quotient;
7. package `RationalExtension` and prove cofinality;
8. prove the fraction-field universal property with **unique** extension.
