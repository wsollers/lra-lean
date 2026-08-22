# LRA Rational Quotient Construction Review

## Scope

Focused review of the concrete quotient-fractions construction under
`LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions`.

Project-wide rule: `sorry` proof bodies are neutral; theorem statements whose hypotheses do not imply their conclusions are defects.

---

# Files reviewed

- `Carrier.lean`
- `Equivalence.lean`
- `Operations.lean`
- `WellDefinedness.lean`
- `Laws.lean`
- `Behavior.lean`
- `Instances.lean`
- construction directory/router

---

# Intended construction

The construction uses formal fractions

```text
numerator / denominator
```

where the numerator lies in an `IntegerModel` and the denominator comes from a separate positive-natural carrier embedded into that integer model.

Cross-multiplication equivalence is the standard relation

```text
a/b ~ c/d  iff  a*d = c*b,
```

with addition, multiplication, negation, and strict order defined by the usual positive-denominator formulas.

The construction idea is standard. The main problem is that the displayed input contract does not state enough facts about the positive-denominator carrier to justify the later field, density, Archimedean, reduction, and incompleteness theorems.

---

# What remains plausible under the current input contract

The following pieces are not obviously invalid merely because the denominator carrier is small:

- cross-multiplication equivalence;
- addition of fraction representatives;
- multiplication of fraction representatives;
- additive negation;
- preservation of the relation by the basic ring operations;
- strict-order formula based on positive mapped denominators.

The integer model already supplies integral-domain and ordered-ring facts, and every mapped denominator is assumed positive, hence nonzero. Those facts are enough for much of the standard cross-multiplication algebra.

These intermediate statements should still be proved against the exact weak interface before being declared fully sound, but the counterexamples below target later claims that definitely require stronger data.

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

Map its unique element to integer `1`, use the unique multiplication, and choose arbitrary `absolute_numerator`/`gcd` functions into `Unit`.

Then:

- every denominator maps to `1 > 0`;
- one maps to one;
- multiplication is preserved;
- every displayed field of `IntegerAndPositiveNaturalData` is satisfied.

But every formal fraction has denominator `1`. The quotient therefore has only integer-valued fractions and is essentially the integer carrier, which is not a field.

Nevertheless the construction states both

```text
reciprocal_exists_uniquely
field_structure
ordered_field_structure
```

for every `IntegerAndPositiveNaturalData`, and finally packages every such carrier as a `RationalModel`.

These claims are false for the counterexample above.

**Severity: P0 FALSE FIELD/REALIZATION THEOREMS / INPUT CONTRACT TOO WEAK.**

---

# P0 — reciprocal existence requires denominator adequacy

The theorem

```text
reciprocal_exists_uniquely
```

asserts that every nonzero quotient element has a two-sided reciprocal.

For a representative `a/b`, an ordinary fraction construction represents its reciprocal by something corresponding to `b/|a|`, with a sign adjustment when `a < 0`.

The current interface gives no theorem of the form

```text
forall a != 0,
  exists n : natural_carrier,
    to_integer n = |a|.
```

Therefore it has no reason to possess a denominator representing the magnitude of an arbitrary nonzero numerator.

The `Unit`-denominator model makes this failure explicit: the class corresponding to integer `2` has no multiplicative inverse.

Because `field_structure` includes reciprocal existence, it fails for the same reason.

---

# P0 — reduced-form theorems use completely unconstrained `gcd` and `absolute_numerator`

The predicate

```text
IsReduced representative :=
  gcd (absolute_numerator numerator) denominator = one
```

uses two functions whose names suggest standard arithmetic meanings, but the carrier structure supplies **no laws at all** for either function.

Consequently the following are not derivable from the displayed input interface:

```text
reduced_representative_exists
reduced_representative_unique
unique_lowest_term_form
```

For example, `gcd` can be any arbitrary function on `natural_carrier`; nothing says it divides both arguments, is greatest among common divisors, is normalized, or even behaves correctly at `one`.

Similarly, nothing connects `absolute_numerator` to the sign/order/multiplication structure of the integer numerator.

**Severity: P0 FALSE FOR ARBITRARY INPUT DATA.**

### Required contract

If lowest-term forms remain in this construction, specify at least:

- a positive-magnitude/absolute-value law relating `absolute_numerator z` to `z`;
- divisibility on the denominator carrier;
- gcd divides both inputs;
- every common divisor divides gcd;
- normalization/positivity sufficient for gcd uniqueness;
- compatibility of these notions with `to_integer`.

An easier architecture may be to prove the quotient field first without any gcd data, then add reduction as a separate optional Euclidean-domain/number-theory enrichment.

---

# P0 — density is not implied by the current denominator carrier

The theorem

```text
density :
  first < second -> exists middle, first < middle and middle < second
```

is false for the `Unit`-denominator countermodel.

There the quotient is essentially the integer carrier, whose standard order is discrete rather than dense.

Thus density is not a consequence of the currently stated fraction-construction interface.

A sufficient repair is to ensure the denominator system can represent arbitrarily large positive integers, or otherwise provide the standard midpoint/denominator-doubling construction required for density.

---

# P0 — displayed Archimedean theorem is not implied by the current natural carrier

Current theorem:

```text
archimedean_property value :
  exists natural : natural_carrier,
    value < integer_embedding (to_integer natural).
```

Again take `natural_carrier = Unit`, mapped to `1`. The conclusion becomes, effectively,

```text
value < 1
```

for every quotient value.

That is false already for the embedded integer `2`.

The positive-natural carrier needs a cofinality/unboundedness law in the integer model.

**Severity: P0.**

---

# P0 — the square-root-two statements do not actually specify the number two

Several statements accept

```text
two : Carrier rational_data
```

as an arbitrary argument, but impose no hypothesis that

```text
two = one + one.
```

In particular:

```text
no_rational_square_root_two
    (two : Carrier rational_data) :
    not exists value, value * value = two
```

is immediately false when `two = zero`, since `zero * zero = zero`.

Therefore the subsequent square-root cut and incompleteness chain are not correctly tied to the rational number `2`.

### Repair

Do not pass `two` as unconstrained data. Define it canonically, for example

```text
def two := addition one one
```

or add an explicit hypothesis identifying the argument with `1 + 1`.

Then the irrationality proof still requires the expected arithmetic prerequisites for the actual rational construction.

**Severity: P0 DIRECT COUNTEREXAMPLE.**

---

# P0 — final non-completeness summary inherits the broken square-root-two chain

The intended result that the rationals are not order complete is correct, but in this implementation the proof surface runs through an unconstrained `two` and through a construction interface that may not even produce a field or dense order.

Therefore

```text
not_order_complete
structure_of_the_rationals
```

cannot be justified for arbitrary `IntegerAndPositiveNaturalData` as currently stated.

These should target a strengthened/actual rational construction rather than the weak raw-data record.

---

# Order and equivalence

The representative strict order

```text
a/b < c/d  iff  a*d < c*b
```

is the standard formula when denominators are positive.

Unlike the integer quotient-order defect found in `QuotientOrderedPairs`, this construction explicitly assumes every mapped denominator is positive. That gives the sign information needed for cross-multiplication order comparisons.

So there is no immediate analogous counterexample from arbitrary denominator sign.

Still, the proof of `representative_strict_order_respects_equivalence` should be checked once the upstream `IntegerModel` semantics are repaired, because the current model class itself is broader than the actual integers.

---

# Classical choice audit

The quotient operations use `Classical.choose` to name induced operations after existence has been proved.

Likewise the inverse definition selects the unique reciprocal from a single existential.

These are ordinary witness extraction steps, not family-wise mathematical Axiom of Choice.

No new genuine AC dependency was identified here.

---

# Required strengthening

The cleanest repair is to avoid an ad hoc weak carrier and instead specify the denominator source through canonical algebraic/order certificates plus adequacy laws.

At minimum the construction needs enough to guarantee that every nonzero numerator whose inverse is required has an admissible positive denominator representative.

A useful core condition is approximately

```text
forall z != 0,
  exists n : natural_carrier,
    to_integer n = abs z.
```

where `abs` is itself correctly characterized.

For density/Archimedean behavior, add cofinality/unboundedness of the positive-natural image.

For lowest-term representatives, add genuine gcd/divisibility laws—or move that material to a later number-theory enrichment.

The construction should then prove, in dependency order:

1. denominator images are positive and nonzero;
2. fraction equivalence is an equivalence relation;
3. operations respect equivalence;
4. order respects equivalence;
5. ring laws;
6. denominator adequacy / reciprocal existence;
7. field laws;
8. density;
9. Archimedean/cofinality properties;
10. optional gcd/reduction theory;
11. irrationality of `sqrt 2` with canonical `2 := 1+1`;
12. failure of order completeness;
13. only then package the selected construction as the intended rational-number model.

---

# Architectural relation to the model review

This confirms the broader finding in `NumberSystemsReview.md`:

- `RationalModel` is a broad structural class (dense ordered fields);
- a concrete quotient construction needs substantially stronger construction-specific hypotheses than merely naming numerator/denominator carriers;
- countability and fraction-field universal properties should be proved for the actual adequate quotient construction, not for every `RationalModel`.

The weak `IntegerAndPositiveNaturalData` record should not itself be treated as a certificate that its quotient is `Q`.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Cross-multiplication construction idea | **PASS** |
| Positive-denominator idea | **PASS IN PRINCIPLE** |
| Basic quotient ring operations | **PLAUSIBLE UNDER CURRENT CONTRACT; PROOFS STILL PENDING** |
| Strict cross-multiplication order formula | **STANDARD / POSITIVE DENOMINATORS PRESENT** |
| Denominator carrier adequacy | **MISSING / P0** |
| Reciprocal existence | **P0 FALSE FOR ARBITRARY INPUT** |
| Field / ordered-field summary | **P0 FALSE FOR ARBITRARY INPUT** |
| `absolute_numerator` contract | **UNSPECIFIED / P0 FOR REDUCTION CLAIMS** |
| `gcd` contract | **UNSPECIFIED / P0 FOR REDUCTION CLAIMS** |
| Density | **P0 FALSE FOR ARBITRARY INPUT** |
| Archimedean/cofinality theorem | **P0 FALSE FOR ARBITRARY INPUT** |
| Canonical number `2` in sqrt-2 section | **MISSING / P0** |
| Rational incompleteness chain | **NOT VALID AT CURRENT GENERICITY** |
| Arbitrary-input realization as `RationalModel` | **P0 FALSE** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Next review steps

1. move to the concrete real-number constructions;
2. distinguish actual construction prerequisites from the broad `RealModel` façade;
3. audit Dedekind, Cauchy, Cantor/nested-interval, interval-quotient, and dyadic constructions in small chunks;
4. check whether each selected real construction is actually tied to the configuration enum;
5. verify completeness theorems use the canonical `OrderCompletenessLaws` rather than independent parallel predicates.