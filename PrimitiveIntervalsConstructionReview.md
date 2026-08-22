# LRA Primitive-Interval Real Construction Review

## Scope

Focused mathematical review of `LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals`.

This construction is especially important because it is intended to be a genuine construction of the real numbers from nested shrinking **rational intervals**, rather than interval arithmetic over an already-existing real field.

Project-wide rule: `sorry` proof bodies are neutral. False or under-specified theorem statements are not.

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

# Carrier: genuine rational-interval construction

The carrier is built from rational closed intervals `[a_n,b_n]` with ordered endpoints, nestedness, and widths converging to zero.

No already-completed real carrier appears in the carrier definition.

**Verdict: PASS / genuinely primitive interval-based.**

This satisfies the intended distinction between constructing `R` from rational intervals and merely performing interval arithmetic over an existing `R`.

---

# Equivalence: persistent cross-level overlap

Two representatives are equivalent when every level of the first sequence overlaps every level of the second:

```text
forall m n, I_m overlaps J_n.
```

For nested nonempty intervals whose widths tend to zero, this is a mathematically natural same-point relation.

- reflexivity follows from nestedness;
- symmetry is immediate from overlap symmetry;
- transitivity is supported by shrinking widths: if fixed intervals from the first and third sequences were separated by a positive rational gap, sufficiently narrow intervals from the middle sequence could not overlap both.

This is substantially cleaner than the one-sided endpoint relation currently used in the Cantor construction.

**Verdict: PASS IN SHAPE.**

The rational embedding by constant degenerate intervals is also the correct construction and should be injective.

---

# Arithmetic

## Addition and negation

Minkowski addition `[a,b]+[c,d]=[a+c,b+d]` and negation `-[a,b]=[-b,-a]` are standard and correctly specified.

## Multiplication

The product interval is specified by taking the minimum and maximum of the four corner products. This is the correct closed-interval product over a linearly ordered field.

A particularly good feature of this development is that it **does not falsely assume ordinary interval distributivity**. It explicitly records raw interval subdistributivity and a strict-failure theorem, then attempts to prove that the interval overestimation defect vanishes after quotienting shrinking representatives.

That is exactly the right mathematical issue to address in an interval construction.

**Verdict: arithmetic design is strong.**

---

# P0 — `OrderedFieldStructure` does not state ordered-field structure

Current definition contains essentially:

```text
StrictTotalOrder rational_model
∧ OrderCompatibility rational_model
∧ quotient_distributivity rational_model = quotient_distributivity rational_model
∧ every nonzero value has an inverse.
```

The third conjunct is a tautological equality of a theorem with itself.

More importantly, the definition omits the actual field laws, including additive associativity/commutativity, additive identity/inverses, multiplication associativity/commutativity, multiplicative identity, and nontriviality `0 != 1`.

Its comment additionally calls this an **Archimedean ordered field**, but the predicate contains no Archimedean/cofinality clause.

Therefore `ordered_field_structure : OrderedFieldStructure rational_model` does not establish what its name/documentation claim.

### Repair

Prefer the canonical certificate layer directly. Prove the constructed carrier has the relevant operation instances and then prove

```text
LRA.AlgebraicStructures.OrderedFieldLaws (Carrier rational_model)
```

plus a separate Archimedean/cofinality theorem if desired.

**Severity: P0 STRUCTURE-SUMMARY UNDER-SPECIFICATION.**

---

# Least-upper-bound predicate

The local `LeastUpperBoundProperty` is expressed through strict-order negation for upper-boundhood and leastness. Once strict totality is available, these are equivalent to the usual non-strict inequalities.

**Verdict: mathematically acceptable, though canonical `LRA.Order` completeness should be reused instead of duplicated.**

---

# P0 — source model is too broad for the advertised real-model result

The whole construction is parameterized by arbitrary

```text
rational_model : RationalModel
```

where `RationalModel` means merely a densely ordered field. This includes non-Archimedean dense ordered fields.

The final construction is advertised as a complete/Archimedean ordered field retaining an embedding of the source field. Such a result cannot hold for an arbitrary non-Archimedean ordered source field: every ordered subfield of an Archimedean ordered field is itself Archimedean.

Therefore the final real-number characterization must require the intended rational source, or at least an Archimedean dense ordered field with the needed cofinal structure.

**Severity: P0 INPUT CONTRACT TOO BROAD FOR FINAL REAL CLAIM.**

The carrier/equivalence construction itself can still be studied over a broader source field; the problem is the universal claim that it always produces the intended reals.

---

# P0 — arbitrary metric comparison theorem

`persistent_overlap_iff_endpoint_null` takes an arbitrary

```text
absolute_value_data : Cauchy.RationalMetricData rational_model
```

and claims persistent interval overlap is equivalent to the left-endpoint difference being null in that metric.

Persistent overlap is an **order** notion. `RationalMetricData` does not require its absolute value to be the order absolute value or even order-compatible. A non-Archimedean / p-adic-style absolute value therefore need not have the same null sequences as the ordinary order absolute value.

### Repair

Require the canonical order absolute value / induced metric, or an explicit theorem identifying the supplied absolute value with it.

**Severity: P0 FALSE GENERALITY.**

---

# P0/P1 — the claimed Cantor comparison is self-comparison

The theorem named/commented as a canonical comparison with the Cantor endpoint construction has type

```text
exists comparison : Carrier rational_model -> Carrier rational_model,
  (forall value, comparison value = value) ∧ ...
```

It compares the primitive-interval carrier to **itself**, and simply asks for the identity map. It does not mention `Cantor.Carrier`.

Thus it is not an isomorphism between constructions.

**Severity: P0 name/statement mismatch if used as mathematical comparison; P1 if retained only as temporary scaffold.**

---

# P0/P1 — final construction theorem contains a tautology

`PrimitiveIntervalConstructionOfReals` ends with

```text
forall first second,
  equivalent first second <-> equivalent first second.
```

This is tautological and certifies no cross-construction or representation property.

Combined with the under-specified `OrderedFieldStructure`, the final theorem currently overstates what its formal proposition actually records.

### Recommended final summary

The eventual final theorem should combine canonical properties such as:

```text
OrderedFieldLaws Carrier
OrderCompletenessLaws Carrier (Set Carrier)
rational_embedding is an ordered-field embedding
embedded rationals are dense/cofinal
```

and, separately, actual isomorphism/equivalence theorems with the Dedekind and Cauchy constructions.

---

# Realization packaging defect

`PrimitiveIntervalsRealizesRealModel` has type simply `RealModel` and does not constrain the returned model's carrier to be `Carrier rational_model`.

So, as documented in `ConstructionRealizationReview.md`, this declaration does not formally certify the primitive-interval construction at all.

The correct route is to prove canonical laws on the carrier and then construct

```text
RealModel.ofCarrier (Carrier rational_model).
```

---

# Choice audit

The `Classical.choose` uses in interval addition/multiplication/negation and representative operations select witnesses from individual existence/uniqueness theorems.

These are ordinary witness extractions, not genuine family-wise Axiom of Choice.

No new mathematical AC dependency was found in this construction.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Rational-interval carrier | **PASS** |
| Independence from pre-existing real carrier | **PASS** |
| Persistent-overlap equivalence | **PASS IN SHAPE** |
| Rational embedding | **PASS IN SHAPE** |
| Interval addition/negation | **PASS** |
| Corner-product multiplication | **PASS** |
| Recognition of interval subdistributivity | **STRONG / CORRECT DESIGN** |
| Quotient distributivity goal | **MATHEMATICALLY APPROPRIATE** |
| `OrderedFieldStructure` predicate | **P0 UNDER-SPECIFIED / TAUTOLOGICAL CONJUNCT** |
| Source `RationalModel` generality | **P0 TOO BROAD FOR REAL CLAIM** |
| LUB predicate | **VALID BUT DUPLICATES CANONICAL ORDER LAYER** |
| persistent-overlap ↔ arbitrary-metric-null | **P0 FALSE GENERALITY** |
| Cantor comparison theorem | **SELF-MAP, NOT AN ISOMORPHISM** |
| Final construction summary | **P0/P1 TAUTOLOGICAL / UNDER-SPECIFIED** |
| Real-model realization declaration | **DETACHED FROM CONSTRUCTED CARRIER** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Immediate repair order

1. replace local `OrderedFieldStructure` with canonical `OrderedFieldLaws` on the constructed carrier;
2. add actual additive/multiplicative/nontriviality certificates before claiming a field;
3. restrict the source model to the intended Archimedean rational field or add the needed source hypotheses explicitly;
4. keep the strong persistent-overlap equivalence and quotient arithmetic design;
5. repair the metric comparison so it uses the canonical order absolute value;
6. replace the self-comparison theorem with a genuine map to `Cantor.Carrier` or `Cauchy.Carrier`, with bijectivity and structure preservation;
7. replace the final tautology by meaningful construction properties;
8. tie the realization package definitionally to `Carrier rational_model`.
