# LRA Derived Real-Number Layers Review

## Scope

Review of top-level theory built over an already-selected real model, plus the legacy alternate-construction comparison file:

- `LRA/NumberSystems/RealNumbers/Extended.lean`
- `LRA/NumberSystems/RealNumbers/NonNegative.lean`
- `LRA/NumberSystems/RealNumbers/Extensions.lean`
- `LRA/NumberSystems/RealNumbers/Irrationals.lean`
- `LRA/NumberSystems/RealNumbers/ConstructionModels.lean`

These are distinguished from the dedicated §1.6.1 construction pipelines.

---

# Extended real line

`ExtendedReal real_model` correctly adjoins `negativeInfinity` and `positiveInfinity` to the finite carrier of an existing `RealModel`.

The order

```text
-infinity <= x <= +infinity
```

with the original real order on finite values is mathematically standard.

The theorem that every subset has a supremum is the expected complete-lattice property of the extended real line over a complete real model.

**Verdict: CORE CARRIER/ORDER PASS.**

## P1 — `PartialOperation` does not identify an operation

Current `PartialOperation real_model operation` has a domain predicate and requires that, on finite values, `operation` equal either finite addition or finite multiplication.

This does not define a partial addition or partial multiplication: the choice between the two may vary from pair to pair.

For measure theory, create separate notions/definitions for extended-real addition and multiplication, with their own domains/conventions. In particular:

- full `EReal` addition should leave `(+∞)+(-∞)` and `(-∞)+(+∞)` undefined or explicitly modeled;
- `ENNReal` addition is total;
- `ENNReal` multiplication needs an explicit convention, normally `0 * ∞ = 0` as in measure theory/Mathlib.

**Severity: P1 MODELING ISSUE.**

---

# Nonnegative and nonnegative-extended reals

This file correctly states that these are subtypes/enrichments of an existing real model, not competing constructions of the reals.

`NonNegativeReal` is the nonnegative subtype.

`NonNegativeExtendedReal` consists of finite nonnegative values plus `+∞`.

The total addition on the nonnegative extended subtype is mathematically appropriate and avoids the `+∞ + (-∞)` conflict present on full extended reals.

The deliberate decision to postpone multiplication until its `0 * ∞` convention is chosen is good architectural discipline.

**Verdict: PASS.**

This is an important bridge for metric/norm/measure theory and should eventually interoperate directly with the project metric and measure codomains.

---

# Derived real operations

`integer_power` and `is_nth_root` are standard.

`nth_root_exists_for_nonnegative_reals` is correctly stated over a complete real model with positive natural degree and nonnegative radicand.

`archimedean_integer_part` is also structurally plausible because it works through a `RationalExtension` and `RealExtension`, whose cofinality fields supply the needed Archimedean tower data.

**Verdict: PASS in reviewed statements.**

## P0/P1 — categoricity theorem again states only embedding existence

`complete_archimedean_ordered_field_unique` is named as a uniqueness/categoricity result but concludes only

```text
exists comparison,
  EmbeddingPreservesOrderedField first.signature second.signature comparison.
```

That is an injective ordered-field embedding, not an isomorphism and not uniqueness of the comparison.

Repair by stating an actual bijective ordered-field isomorphism, then a uniqueness theorem for that isomorphism when the intended canonical characterization warrants it.

This repeats the defect already found in `VolumeII/NumberSystems/UniversalProperties.lean`.

---

# Irrational numbers

The irrational layer correctly makes rationality relative to a selected embedding

```text
RationalModel -> RealExtension -> RealCarrier.
```

`IsRational` is membership in the image of that embedding and `IsIrrational` is its negation. This is the correct construction-independent definition.

The file's own documentation correctly notes the important failure modes for mixed arithmetic: zero times an irrational and zero divided by an irrational are rational, so nonzero hypotheses are required in the corresponding preservation theorems.

The initial rational-closure theorems sampled in this pass are correctly shaped.

**Verdict: PASS in reviewed portion.**

Architecturally, this is exactly the right place for irrationality: over a selected rational-to-real embedding, not attached to one concrete real construction.

---

# Legacy `ConstructionModels.lean`

This file is not mathematically equivalent in quality to the dedicated construction pipelines and should be classified as historical/comparison scaffold.

## P0 semantic simplification — Cauchy means constant

The legacy namespace defines

```text
is_cauchy sequence :=
  forall i j, sequence i = sequence j.
```

This characterizes constant sequences, not Cauchy sequences.

Its `equivalent` is pointwise equality rather than null-difference equivalence.

Therefore this namespace is not a genuine Cauchy completion model.

## Detached model existence

The file repeatedly states

```text
real_model_exists (rational_model : RationalModel) : Nonempty RealModel
```

without tying the returned model carrier to the construction data in the surrounding namespace. This is the same realization-detachment issue documented in `ConstructionRealizationReview.md`.

## Cantor comparison placeholders

The legacy `IntervalSequence` stores

```text
is_nested : Prop
widths_converge_to_zero : Prop
```

as bare propositions rather than predicates of the endpoints.

Its theorem `endpoint_sequences_determine_cauchy_class` concludes only that the left endpoint sequence is equivalent to itself.

So it certifies no relationship between interval endpoints and a Cauchy class.

## Primitive interval legacy equivalence

The legacy primitive-interval namespace defines its equivalence simply as

```text
first = second.
```

This is not the persistent-overlap quotient used by the dedicated `PrimitiveIntervals` construction.

### Recommendation

Mark `ConstructionModels.lean` as one of:

1. deprecated historical scaffold;
2. comparison-note-only material excluded from proof-facing imports; or
3. replace its contents with aliases/bridges to the dedicated construction modules.

Do not maintain a second simplified mathematical definition of the same named constructions.

**Severity: P1 ARCHITECTURAL, with P0 semantic stubs if treated as authoritative mathematics.**

---

# Choice audit

No new genuine family-wise Axiom-of-Choice use was identified.

`Classical.choice` used to select one model from a single existential remains witness extraction rather than an additional AC principle.

---

# Verdict

| Layer | Verdict |
|---|---|
| Extended-real carrier/order | **PASS** |
| Every extended-real subset has supremum | **CORRECT TARGET** |
| Full extended-real `PartialOperation` | **P1 MIS-MODELED** |
| Nonnegative real subtype | **PASS** |
| Nonnegative extended real subtype/addition | **PASS** |
| ENNReal multiplication convention | **DELIBERATELY DEFERRED / GOOD** |
| Integer powers / nth roots | **PASS** |
| Complete-field categoricity statement | **UNDER-SPECIFIED: EMBEDDING ONLY** |
| Irrationality relative to embedding | **PASS** |
| Legacy Cauchy comparison model | **P0 SEMANTIC STUB** |
| Legacy Cantor comparison model | **PLACEHOLDER / DETACHED** |
| Legacy primitive-interval equivalence | **NOT THE REAL CONSTRUCTION** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Immediate recommendations

1. preserve `Extended` and `NonNegative` as derived theory over `RealModel`;
2. split full extended-real addition/multiplication into separately specified partial operations;
3. add ENNReal multiplication with an explicit `0 * infinity` convention before serious measure theory;
4. repair real-model categoricity to actual isomorphism + intended uniqueness;
5. keep irrationality construction-independent as currently designed;
6. deprecate or alias `ConstructionModels.lean` so the dedicated construction pipelines are the sole mathematical owners.
