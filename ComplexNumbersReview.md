# LRA Complex Numbers Review

## Scope

Review of the ordered-pair complex-number construction under
`LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs`.

Project-wide rule: `sorry` proof bodies are neutral; false or under-specified definitions/theorem statements are not.

---

# Carrier and operations

The carrier

```text
ComplexNumber R = R × R
```

with `(a,b)` interpreted as `a + b i` is standard.

The implemented operations are the usual formulas:

```text
(a,b) + (c,d) = (a+c, b+d)
-(a,b) = (-a,-b)
(a,b)(c,d) = (ac-bd, ad+bc)
conj(a,b) = (a,-b)
normSquared(a,b) = a^2+b^2.
```

The totalized inverse

```text
(a,b)^(-1) = (a/(a^2+b^2), -b/(a^2+b^2))
```

is also correct under the base field's totalized inversion convention.

**Verdict: PASS.**

---

# Excellent capability discipline

The construction correctly distinguishes ring-level and field-level assumptions.

For `ComplexNumber R` to be a commutative ring, only `CommutativeRingLaws R` are required.

For the inverse theorem, the base is required to satisfy `OrderedFieldLaws R`.

That extra hypothesis matters: over an arbitrary field, `a^2+b^2` can vanish for a nonzero pair. An ordered field rules this out because squares are nonnegative and their sum vanishes only when both components vanish.

This is a strong example of the project's desired capability-honest architecture.

**Verdict: PASS / EXEMPLARY.**

---

# Canonical algebraic-structure integration

`Instances.lean` registers the component law theorems directly as the canonical certificates:

- additive semigroup/commutative/identity/inverse laws;
- multiplicative semigroup/commutative/identity laws;
- zero absorption;
- distributivity;
- subtraction compatibility;
- nontriviality and multiplicative inverse laws under ordered-field hypotheses.

Consequently the canonical `FieldLaws (ComplexNumber R)` bundle resolves for ordered-field bases such as `Rat` and `Real`.

This is exactly the pattern desired for concrete number systems proving they obey named generic laws.

**Verdict: PASS.**

---

# Real-axis embedding

`of_real r = (r,0)` and its preservation theorems for zero, one, addition, negation, multiplication, and injectivity are correctly shaped.

The complex-number layer appropriately does not attempt to inherit a linear order from `R`.

**Verdict: PASS.**

---

# P1/P0 — polynomial representation does not certify its degree

The local polynomial record is

```text
structure Polynomial (R) where
  degree : Nat
  coefficient : Fin (degree + 1) -> ComplexNumber R
```

and

```text
Polynomial.nonconstant p := p.degree != 0.
```

But no invariant requires the coefficient at `degree` to be nonzero.

Therefore `degree` is only an array-size/tag field, not necessarily the mathematical degree of the represented polynomial.

For example a record may have `degree = 1` while its degree-one coefficient is zero and its constant coefficient is nonzero. The represented polynomial is then constant and has no root, but `Polynomial.nonconstant` holds.

Thus the Fundamental Theorem of Algebra wrapper

```text
polynomial.nonconstant -> exists root, polynomial.evaluate root = 0
```

is not justified by the current `nonconstant` definition.

### Repair options

Prefer one of:

1. use Mathlib's canonical polynomial type;
2. add an invariant
   ```text
   coefficient(top_index) != 0
   ```
   for positive stored degree;
3. redefine nonconstant semantically, e.g. existence of a genuinely nonzero positive-degree coefficient.

The FTA theorem's base hypothesis itself is appropriate: a complete ordered field is (up to ordered-field isomorphism) the real field, and adjoining `i` gives its complexification.

**Severity: P1/P0 depending whether this local polynomial record is proof-facing.**

---

# Theorems worth adding

Before deeper complex analysis, expose explicitly:

- conjugation involutive;
- conjugation preserves addition and multiplication;
- `z * conjugate z = of_real (normSquared z)`;
- `normSquared z = 0 iff z = 0` under ordered-field hypotheses;
- inverse formula theorem;
- real-axis embedding preserves inversion on nonzero values;
- every complex number decomposes uniquely as `of_real a + of_real b * i`;
- `i^2 = -1` (already present);
- no compatible linear order makes the complex field an ordered field.

For analysis later, define modulus using the nonnegative square root in the real base and prove triangle inequality before building the complex metric/norm.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency was identified in this construction.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Pair carrier | **PASS** |
| Addition/negation/multiplication | **PASS** |
| Conjugation / squared modulus | **PASS** |
| Inverse formula | **PASS under ordered-field base** |
| Capability hypotheses | **EXCELLENT** |
| Canonical law certificates | **PASS / EXEMPLARY** |
| Real-axis embedding | **PASS** |
| Imaginary-unit law | **PASS** |
| Polynomial degree representation | **UNDER-SPECIFIED** |
| FTA wrapper | **NEEDS POLYNOMIAL INVARIANT FIX** |
| Choice usage | **NONE** |

---

# Immediate recommendation

Use this complex construction as the model for how concrete number systems should integrate with `LRA.AlgebraicStructures`: define operations once, prove individual named laws, then register canonical certificates. Repair the local polynomial representation before treating the FTA statement as proof-ready.
