# LRA Rational-to-Real Extension Bridge Review

## Scope

Focused audit of how the concrete real constructions connect to the canonical adjacent-system interface

```text
RationalEmbeddingIntoReal
RealExtension
```

and whether their source hypotheses are strong enough to justify a construction of the real numbers.

Project rule: `sorry` proof bodies are neutral. The review concerns statement strength, semantic coupling, and missing bridge theorems.

---

# Canonical bridge interface

`RationalEmbeddingIntoReal Q R` is well shaped. It requires an injective map preserving

```text
0, 1, +, -, *, inverse
```

and preserving/reflection of order.

`RealExtension Q` then packages a `RealModel`, such an embedding, and cofinality of the rational image:

```text
forall x : R, exists q : Q, x < iota(q).
```

This is a good adjacent-number-system interface.

**Verdict: PASS.**

---

# Important source-strength fact

A `RealExtension rational_model` cannot in general exist for an arbitrary `RationalModel` as currently defined.

`RationalModel` means a densely ordered field. It may be non-Archimedean.

But if an ordered field embeds order-preservingly into a complete ordered field, then the source is Archimedean because every complete ordered field is Archimedean and ordered subfields inherit Archimedeanness.

Therefore the real-construction source should be stronger than bare `RationalModel`.

Recommended source contract:

```text
RationalModel
+ Archimedean/cofinal-integer certificate
```

or, more canonically, consume an already-built

```text
RationalExtension integer_model
```

whose `ArchimedeanProperty` records integer cofinality.

This would make the number tower genuinely compositional:

```text
IntegerModel
-> RationalExtension IntegerModel
-> RealExtension RationalModel.
```

**Severity: P0 for any theorem claiming a real extension/completion for every bare `RationalModel`; P1 architecture recommendation for the interface design itself.**

---

# Dedekind construction

The Dedekind construction defines the canonical rational lower-ray embedding

```text
rational_embedding : Q -> Cut Q
```

and proves/states:

- injectivity;
- order preservation/reflection;
- density of the embedded rationals in the cut order.

This is the closest of the reviewed constructions to a proper `RealExtension` bridge.

However, the currently reviewed embedding theorem only certifies injectivity and order behavior. A `RationalEmbeddingIntoReal` record additionally needs explicit preservation theorems for

```text
0, 1, addition, negation, multiplication, inverse.
```

These should be first-class theorems even if some are easy corollaries of the cut arithmetic definitions.

The density theorem is stronger than the cofinality requirement of `RealExtension` once the cut order is a genuine unbounded ordered field.

### P0 source generality

All of these are parameterized by arbitrary

```text
rational_model : RationalModel.
```

That is too weak for the claimed complete ordered-field construction, as already recorded in `DedekindConstructionReview.md`.

### P0 independent Archimedean theorem

The current `archimedean_property` additionally quantifies over an arbitrary `natural_carrier` and arbitrary map into the rational carrier, so it is false independently of the source-model issue.

### Missing final bridge

`Instances.lean` currently declares only

```text
DedekindRealizesRealModel : RealModel
```

and its result type does not mention `Cut rational_model`.

There is no construction-tied

```text
DedekindRealExtension : RealExtension rational_model
```

or equivalent record.

**Verdict: strongest bridge candidate, but still missing algebra-preservation surface, source Archimedean hypothesis, and actual `RealExtension` packaging.**

---

# PrimitiveIntervals construction

The construction has a canonical rational embedding into the interval quotient and an injectivity theorem.

What is not currently present in the reviewed behavior/law surface is:

- preservation of `0` and `1`;
- preservation of addition/negation/multiplication/inverse;
- preservation/reflection of order by the rational embedding;
- density or even cofinality of the embedded rationals.

Thus the current theorem surface is not sufficient to assemble `RationalEmbeddingIntoReal` or `RealExtension` even after repairing the weakened `OrderedFieldStructure` summary.

`Instances.lean` again returns only a detached `RealModel`:

```text
PrimitiveIntervalsRealizesRealModel (rational_model : RationalModel) : RealModel.
```

The formal type does not tie the returned model to `Carrier rational_model`.

### Recommended bridge theorem sequence

1. `rational_embedding_preserves_zero`;
2. `...preserves_one`;
3. `...preserves_addition`;
4. `...preserves_negation`;
5. `...preserves_multiplication`;
6. `...preserves_inverse`;
7. `...preserves_and_reflects_order`;
8. `embedded_rationals_are_dense` or at least cofinal;
9. package `RationalEmbeddingIntoReal`;
10. package `RealExtension` tied definitionally to the interval carrier.

**Severity: P1 bridge incompleteness plus existing P0 law-summary defects.**

---

# Cauchy construction

The Cauchy construction is currently farthest from the adjacent-system interface.

The reviewed files contain:

- Cauchy-sequence representatives;
- null-difference quotient;
- pointwise addition/negation/multiplication statements.

But the current `Behavior.lean` and `Laws.lean` are placeholders. There is no project-facing theorem surface for:

- constant-sequence rational embedding;
- injectivity of that embedding;
- preservation of field operations/order;
- order construction on the quotient;
- density/cofinality of the rational image;
- least-upper-bound completeness.

Nevertheless `Instances.lean` states

```text
CauchyRealizesRealModel ... : RealModel
```

with a result type detached from `Cauchy.Carrier`.

Further, `RationalMetricData` is too weak and can represent non-order-compatible metrics, so a real ordered-field completion cannot be obtained from it without strengthening the metric contract.

### Required first bridge

Before any `RealExtension` packaging, define the constant-sequence map

```text
q |-> [n |-> q]
```

and prove it is an ordered-field embedding for the canonical order-compatible absolute value.

**Severity: P1 major bridge gap plus P0 source-metric under-specification.**

---

# Mathlib interop does not currently supply the missing bridge

The current real-number Mathlib interop directory contains only

```text
Interop/Mathlib/Extended.lean
Interop/Mathlib/NonNegative.lean.
```

There is no reviewed construction interop for

```text
Dedekind
Cauchy
PrimitiveIntervals
```

that identifies the construction carrier with Mathlib `Real`, proves an ordered-field equivalence, or builds `RealExtension`.

Therefore the missing carrier-tied realization/extension layer is not merely located elsewhere under interop; it is genuinely absent from the current real-construction theorem surface.

**Severity: P1 interop/readiness gap.**

---

# Detached realization declarations

The following declarations all have the same specification weakness:

```text
DedekindRealizesRealModel
CauchyRealizesRealModel
PrimitiveIntervalsRealizesRealModel
```

Their return type is just `RealModel`; it does not constrain the returned model's carrier or operations to be those of the construction.

This is weaker than an actual realization theorem.

Preferred pattern:

```text
-- after installing/providing the relevant operation/certificate instances
RealModel.ofCarrier (Cut rational_model)
```

or a dependent bridge record proving that the returned model has exactly the constructed carrier and operations.

For the number tower, the stronger endpoint should usually be:

```text
RealExtension rational_model
```

not just `RealModel`.

---

# Recommended canonical pipeline

```text
IntegerModel
  |
  | certified fraction-field construction
  v
RationalExtension integer_model
  |
  | supplies RationalModel + integer cofinality / Archimedeanness
  v
Real construction (Dedekind / Cauchy / PrimitiveIntervals)
  |
  | prove carrier operations + OrderedFieldLaws + completeness
  | prove canonical rational embedding
  | prove cofinality/density
  v
RealExtension rational_extension.RationalModel
```

This avoids treating arbitrary dense ordered fields as though they were the rationals.

---

# Construction ranking for bridge readiness

| Construction | Rational embedding | Algebra preservation | Cofinality/density | Carrier-tied RealModel | RealExtension |
|---|---|---|---|---|---|
| Dedekind | **YES** | **INCOMPLETE SURFACE** | **DENSITY STATED** | **NO** | **NO** |
| PrimitiveIntervals | **YES** | **MISSING SURFACE** | **MISSING** | **NO** | **NO** |
| Cauchy | **MISSING PUBLIC SURFACE** | **MISSING** | **MISSING** | **NO** | **NO** |

---

# Choice audit

No new genuine family-wise Axiom-of-Choice dependency appears in this bridge design.

Using `Classical.choose` to select a single constructed model from a proven existential is witness extraction, not AC. The present problem is semantic coupling and source strength, not Choice.

---

# Immediate repair order

1. make Archimedean source data explicit for real constructions, preferably by consuming `RationalExtension`;
2. repair construction-local field/completeness defects first;
3. add explicit rational-embedding algebra/order preservation theorems;
4. add rational cofinality/density;
5. build `RationalEmbeddingIntoReal` records;
6. build construction-tied `RealModel.ofCarrier` values;
7. finally package true `RealExtension` values for Dedekind, PrimitiveIntervals, and Cauchy;
8. add Mathlib equivalence/round-trip interop only after the construction-local bridge is mathematically explicit.