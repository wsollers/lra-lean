# LRA Rational Quotient Construction Review

## Scope

Focused review of the concrete quotient-fractions construction under
`LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions`.

Project-wide rule: `sorry` proof bodies are neutral; theorem statements whose hypotheses do not imply their conclusions are defects.

---

# Files reviewed

- `Carrier.lean`
- construction directory/router
- `Instances.lean`

The remaining operation/law/well-definedness files are the next continuation point.

---

# Intended construction

The construction uses formal fractions

```text
numerator / denominator
```

where the numerator lies in an `IntegerModel` and the denominator comes from a separate positive-natural carrier embedded into that integer model.

This is the standard shape for constructing a fraction field when the denominator carrier adequately represents the positive nonzero elements needed by the construction.

---

# P0 — `IntegerAndPositiveNaturalData` is too weak to imply a rational field

Current data includes:

- an `IntegerModel`;
- a type `natural_carrier`;
- `one` and multiplication on that carrier;
- a map into the integer model;
- positivity of every mapped denominator;
- preservation of one and multiplication;
- arbitrary functions named `absolute_numerator` and `gcd`.

What is missing is any adequacy law saying the denominator carrier actually contains representatives for the positive magnitudes/nonzero integers needed to build reciprocals.

There are also no displayed laws connecting `absolute_numerator` or `gcd` to the integer operations.

## Concrete counterexample

Let the integer model be the ordinary integers, and take

```text
natural_carrier = Unit.
```

Map its unique element to integer `1`, use the unique multiplication, and choose the arbitrary `absolute_numerator`/`gcd` functions into `Unit`.

Then:

- every denominator maps to `1 > 0`;
- one maps to one;
- multiplication is preserved;
- every displayed field of `IntegerAndPositiveNaturalData` is satisfied.

But every formal fraction has denominator `1`. The quotient therefore has only integer-valued fractions and is essentially the integer carrier, which is not a field.

Nevertheless the file states

```text
RationalQuotientFractionsRealizesRationalModel
    (rational_data : IntegerAndPositiveNaturalData) : RationalModel.
```

This is false for the counterexample above.

**Severity: P0 FALSE REALIZATION THEOREM / INPUT CONTRACT TOO WEAK.**

---

# Required strengthening

The cleanest repair is to avoid an ad hoc weak carrier and instead specify the denominator source through canonical algebraic/order certificates plus adequacy laws.

At minimum the construction needs enough to guarantee that every nonzero numerator whose inverse is required has an admissible positive denominator representative.

Possible formulations include:

```text
forall z != 0,
  exists n : natural_carrier,
    to_integer n = |z|
```

with a correctly defined absolute value/magnitude, or a suitable positive-cone equivalence between the denominator carrier and positive integers.

If reduction to lowest terms is part of the public construction, additionally specify the laws of `gcd` and `absolute_numerator`; names alone are not mathematical contracts.

The construction should then prove, in dependency order:

1. denominator images are nonzero;
2. fraction equivalence is an equivalence relation;
3. operations respect equivalence;
4. every nonzero fraction has an inverse represented by an admissible positive denominator;
5. ordered-field laws;
6. density of the resulting order;
7. only then package `RationalModel`.

---

# Architectural relation to the model review

This confirms the broader finding in `NumberSystemsReview.md`:

- `RationalModel` is a broad structural class (dense ordered fields);
- a concrete quotient construction needs substantially stronger construction-specific hypotheses than merely naming numerator/denominator carriers;
- countability and fraction-field universal properties should be proved for the actual adequate quotient construction, not for every `RationalModel`.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency is inherent in this quotient construction or in the issue identified here.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Formal-fraction construction idea | **PASS** |
| Positive-denominator idea | **PASS IN PRINCIPLE** |
| Denominator carrier adequacy | **MISSING / P0** |
| `absolute_numerator` contract | **UNSPECIFIED** |
| `gcd` contract | **UNSPECIFIED** |
| Arbitrary-input realization as `RationalModel` | **P0 FALSE** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Next review steps

1. inspect fraction equivalence and operation definitions;
2. audit multiplication/inversion well-definedness;
3. inspect the field-law and density statements for missing positivity/nonzero hypotheses;
4. check whether reduction/gcd behavior is mathematically connected to the quotient;
5. then move to the concrete real-number constructions.