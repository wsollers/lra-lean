# LRA Cauchy Real Construction Review

## Scope

Focused review of `LRA/NumberSystems/RealNumbers/Constructions/Cauchy`.

Project-wide rule: `sorry` proof bodies are neutral. A declaration that does not formally express what its prose says is a specification defect even when the underlying mathematical idea is standard.

---

# Files reviewed

- `Carrier.lean`
- `Equivalence.lean`
- `Operations.lean`
- `WellDefinedness.lean`
- `Laws.lean`
- `Behavior.lean`
- `Instances.lean`

---

# Core carrier and equivalence

The intended construction is standard:

```text
rational Cauchy sequences
  modulo
null-difference equivalence.
```

`is_cauchy` uses the epsilon-tail condition, `is_null` is convergence to zero, and

```text
first ~ second iff first - second is null.
```

The quotient of Cauchy representatives by this relation is the expected completion carrier.

**Verdict: PASS IN CORE IDEA.**

---

# P0/P1 — `RationalMetricData` is too weak for a real-number completion

`RationalMetricData` supplies an arbitrary map called `absolute_value` with only:

- zero maps to zero;
- symmetry under negation;
- triangle inequality;
- nonnegativity;
- definiteness.

It does not require that this be the ordered-field absolute value, nor even any compatibility with multiplication or order beyond the codomain order used to compare distances with epsilon.

This is enough to define an additive-group metric-like completion, but it is not enough to identify the completion with the real numbers.

## Concrete conceptual counterexample

On the ordinary rationals, a p-adic absolute value satisfies the displayed metric-style axioms (with positive rational values) but its Cauchy completion is the p-adic field `Q_p`, not `R`.

Therefore a construction parameterized by arbitrary `RationalMetricData` cannot legitimately claim to be the real-number completion unless additional hypotheses force the ordinary order absolute value/topology.

### Required strengthening

For the intended real construction, use the canonical ordered-field absolute value, or require at least a certificate tying the metric to the order, for example

```text
abs x = if 0 <= x then x else -x
```

(or equivalent laws), together with the multiplication laws needed by the field-completion proof.

**Severity: P0 if used to claim arbitrary metric completions are real; P1 at carrier-only stage.**

---

# Multiplication theorem surface

The source asserts:

```text
representative_multiplication_is_cauchy
representative_multiplication_respects_equivalence
```

for arbitrary `RationalMetricData`.

The displayed metric contract contains no explicit multiplicative estimate such as

```text
abs (x*y) = abs x * abs y
```

or a suitable submultiplicative/continuity law.

For the ordinary absolute value these theorems are standard because Cauchy sequences are bounded and multiplication is continuous. But that proof uses compatibility between the metric and field multiplication that is not represented in the current input record.

**Severity: P1/P0 INPUT-CONTRACT GAP.**

Before accepting these statements generically, either add the required multiplicative absolute-value laws or prove that they follow from some stronger canonical ordered-field absolute-value certificate.

---

# Major missing construction stages

`Laws.lean` explicitly states that no algebraic/order-law theorem surface exists for this construction.

`Behavior.lean` explicitly states that no rational embedding, density, or completeness theorem surface exists.

Thus the implemented mathematical pipeline currently stops around:

```text
Cauchy quotient carrier
+ pointwise operations
+ selected well-definedness claims.
```

It has not yet established:

- rational constant-sequence embedding;
- injectivity of that embedding;
- preservation of field operations;
- an order on equivalence classes;
- compatibility of order and arithmetic;
- nonzero reciprocal construction;
- completeness of the quotient;
- equivalence of Cauchy completeness and LUB completeness in the intended ordered-field structure.

**Verdict: NOT YET PROOF-READY AS A REAL CONSTRUCTION.**

---

# P0 — `CauchyRealizesRealModel` is semantically detached from the construction

Current declaration:

```text
noncomputable def CauchyRealizesRealModel
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :
    RealModel
```

Its prose says that

```text
Carrier rational_model absolute_value_data
```

realizes the `RealModel` interface.

But the result type merely says **some `RealModel` is returned**. There is no equality requiring

```text
returned.Carrier = Carrier rational_model absolute_value_data,
```

and no condition tying the returned operations/order/completeness certificates to the Cauchy quotient operations.

Consequently this definition can formally return an unrelated pre-existing real model and still satisfy its type.

This is a specification failure, independent of `sorry`.

### Correct shape

Use either a dependent model constructor whose carrier is an explicit parameter, or a realization certificate such as

```text
structure CauchyRealization
    (rational_model : RationalModel)
    (metric : RationalMetricData rational_model) where
  model : RealModel
  carrier_eq : model.Carrier = Carrier rational_model metric
  ... operation compatibility fields ...
```

Better still, build and register the operation instances directly on `Carrier ...` and then use

```text
RealModel.ofCarrier (Carrier ...)
```

once the canonical certificates have been proved.

**Severity: P0 SEMANTIC DETACHMENT.**

---

# Cross-cutting correction to other construction registrations

The same result-type pattern appears in the already reviewed declarations:

```text
QuotientOrderedPairsRealizesIntegerModel : IntegerModel
RationalQuotientFractionsRealizesRationalModel : RationalModel
DedekindRealizesRealModel : RealModel.
```

Unless their result types or bodies explicitly fix the returned `Carrier` to the constructed carrier, they do not formally certify those carriers either.

This is more basic than the earlier observation that the input contracts are weak. Both issues matter:

1. strengthen the construction input contracts;
2. make realization declarations actually mention/certify the constructed carriers.

---

# Choice audit

No genuine family-wise AC dependency was identified.

Quotient construction and choosing uniquely characterized induced operations are ordinary quotient/witness machinery, not an additional mathematical use of AC.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Cauchy-sequence carrier | **PASS** |
| Null-difference equivalence | **PASS IN SHAPE** |
| Quotient carrier | **PASS IN SHAPE** |
| Pointwise addition/negation | **PASS** |
| Metric contract as ordinary real absolute value | **TOO WEAK** |
| Multiplication-Cauchy compatibility | **MISSING METRIC/FIELD CONTRACT** |
| Rational embedding | **NOT BUILT** |
| Order on completion | **NOT BUILT** |
| Field laws | **NOT BUILT** |
| Completeness theorem | **NOT BUILT** |
| `CauchyRealizesRealModel` | **P0 DETACHED FROM CARRIER** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Immediate implementation order

1. replace arbitrary `RationalMetricData` with or bridge it to the canonical ordered-field absolute value;
2. add multiplicative compatibility needed for pointwise product and reciprocal proofs;
3. prove constant-sequence rational embedding and its operation/order preservation;
4. define and prove the quotient order is representative-independent;
5. establish field laws on the quotient carrier;
6. prove metric/Cauchy completeness by the diagonal-sequence argument;
7. derive/order-bridge to LUB completeness under the canonical ordered-field structure;
8. use `RealModel.ofCarrier (Carrier ...)` so the realization is definitionally tied to the constructed carrier;
9. only then compare the Cauchy completion to the Dedekind construction by an explicit ordered-field isomorphism.
