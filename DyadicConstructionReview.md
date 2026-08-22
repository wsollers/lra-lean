# LRA Dyadic / Binary Expansion Real Construction Review

## Scope

Focused review of `LRA/NumberSystems/RealNumbers/Constructions/Dyadic`.

This layer is not a from-scratch construction of the real numbers. It explicitly transports structure across a claimed bijection with the previously constructed Cauchy-real carrier. The review therefore focuses on whether the binary-expansion syntax, evaluation data, representation theorem, and transported structure are mathematically sufficient.

Project-wide rule: `sorry` bodies are neutral; theorem statements unsupported by their hypotheses are defects.

---

# Files reviewed

- `Carrier.lean`
- `Equivalence.lean`
- `WellDefinedness.lean`
- `Laws.lean`
- `Behavior.lean`

---

# Construction status

The module comment correctly says the construction transports a complete ordered-field structure from `Cauchy.Carrier` through a bijection with binary signed expansions.

Therefore this is best viewed as:

```text
canonical binary representation of an already-constructed real carrier
```

rather than an independent construction of `R`.

That is mathematically useful, but it should be categorized separately from Dedekind/Cauchy/primitive-interval constructions.

---

# P0 — nonzero expansion syntax cannot represent magnitudes below one

`FiniteNumeral` requires a highest binary digit and requires that digit to be `1`:

```text
leading_digit_is_one
```

`UnsignedExpansion` always contains a `FiniteNumeral` as its integer part, and every nonzero signed `Expansion` contains an `UnsignedExpansion` magnitude.

Thus the intended syntax has no representation of integer part zero for a nonzero expansion.

Consequently ordinary binary real values such as

```text
0.1_2 = 1/2
0.01_2 = 1/4
```

cannot be represented in the intended numeral interpretation.

### Repair

Permit an explicit zero integer part, e.g. by

- making the integer part `Option FiniteNumeral`;
- adding a `zero` constructor to the finite numeral type; or
- representing the integer part as a finite digit list with a canonical zero case.

Then distinguish the overall zero expansion from nonzero values whose integer part happens to be zero.

**Severity: P0 REPRESENTATION-SYNTAX DEFECT.**

---

# P0 — `RationalDyadicApproximationData` is mostly unconstrained data

The record contains named fields such as

```text
integer_to_rational
power_of_two
digit_to_rational
finite_sum
finite_numeral_value
rational_to_cauchy
cauchy_addition
cauchy_multiplication
cauchy_inverse
cauchy_strict_order
```

but supplies almost no laws saying these functions have their intended meanings.

In particular there are no visible requirements in the carrier record that:

- `digit_to_rational zero = 0` and `digit_to_rational one = 1`;
- `power_of_two n` is actually `2^n` and is nonzero/positive;
- `integer_to_rational` is an injective ring/order embedding;
- `finite_sum` is actual finite summation;
- `finite_numeral_value` evaluates binary numerals correctly;
- `rational_to_cauchy` is the canonical rational embedding;
- the supplied Cauchy operations satisfy any field/order laws.

The single field

```text
cauchy_complete_archimedean_ordered_field : Prop
```

is merely an arbitrary proposition field, not a certificate tying those operations to complete ordered-field laws.

Names are not mathematical contracts.

**Severity: P0 INPUT CONTRACT TOO WEAK.**

---

# P0 — `dyadic_subring` and density are false for arbitrary input data

`IsDyadicRational value` begins with

```text
exists numerator : integer_carrier, ...
```

but `integer_carrier` is unconstrained.

Take

```text
integer_carrier = Empty.
```

Then no value is dyadic, yet `dyadic_subring` asserts in particular that rational zero and one are dyadic.

Therefore `dyadic_subring` is false under the current `RationalDyadicApproximationData` contract.

The density theorem is likewise unsupported; no law says powers of two provide arbitrarily fine positive scales.

**Severity: P0 FALSE GENERIC THEOREMS.**

---

# P0 — binary partial sums need arithmetic/metric compatibility not present in the contract

`fractional_partial_sums_are_cauchy` claims every binary fractional digit sequence has Cauchy partial sums.

That requires substantive facts such as:

```text
2^n -> infinity
1/2^n -> 0
```

in the source ordered metric field, plus compatibility of the supplied `digit_to_rational`, `power_of_two`, finite summation, and absolute value.

None of those relationships are captured by the current carrier record.

Thus the theorem is not implied by the displayed data.

**Severity: P0.**

---

# P0 — universal binary representation theorem is unsupported

`representation_exists` states:

```text
forall real_value : CauchyCarrier dyadic_data,
  exists expansion : Expansion,
    value dyadic_data expansion = real_value.
```

This fails for at least two independent reasons under the current contract:

1. the expansion grammar lacks nonzero values with integer part zero;
2. the evaluation maps and Cauchy structure are arbitrary/unrelated.

Consequently `value_is_bijective` and `binary_real_bijection_exists` are also unsupported at the current generality.

**Severity: P0 CORE REPRESENTATION DEFECT.**

---

# Canonical fractional uniqueness

The choice of convention

```text
not eventually constantly one
```

is a legitimate way to remove the binary ambiguity

```text
0.011111... = 0.100000...
```

provided the binary evaluation has first been defined correctly.

The intended `binary_tail_ambiguity` and `canonical_fractional_uniqueness` theorem shapes are therefore mathematically reasonable **after** the evaluation contract is repaired.

**Verdict: CONVENTION PASS; CURRENT GENERIC THEOREMS DEPEND ON MISSING CONTRACT.**

---

# Transported field structure

Once a genuine bijection

```text
Expansion ≃ CauchyCarrier
```

has been established and the Cauchy carrier has actual field/order operations, transporting zero, one, addition, negation, multiplication, inverse, and order through that bijection is mathematically valid.

The definitions in `Laws.lean` use exactly that transport pattern.

However `OrderedFieldIsomorphism` mostly records that the transported operations map back to the source operations. Those identities are close to definitional consequences of how the operations were defined; they do not independently certify that the source Cauchy operations themselves satisfy ordered-field laws.

Likewise

```text
CompleteArchimedeanOrderedField :=
  OrderedFieldIsomorphism dyadic_data ∧
  dyadic_data.cauchy_complete_archimedean_ordered_field
```

uses an arbitrary Prop field instead of the canonical `OrderedFieldLaws` / `OrderCompletenessLaws` certificates.

### Repair

Require the source carrier to carry canonical project certificates, then transport those certificates through the proved equivalence.

**Severity: P1/P0 STRUCTURE-CERTIFICATION GAP.**

---

# Choice audit

`Classical.choose` used to select the inverse of an already-proved bijection or a witness from an individual existential is ordinary witness extraction, not family-wise AC.

No new genuine Axiom-of-Choice dependency was identified.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Construction independence | **NOT INDEPENDENT — TRANSPORT FROM CAUCHY** |
| Binary fractional canonical convention | **PASS IN PRINCIPLE** |
| Nonzero values with integer part zero | **P0 MISSING FROM SYNTAX** |
| Approximation-data contract | **P0 FAR TOO WEAK** |
| Dyadic subring theorem | **P0 FALSE GENERICALLY** |
| Dyadic density theorem | **P0 UNSUPPORTED GENERICALLY** |
| Partial sums Cauchy | **P0 MISSING COMPATIBILITY HYPOTHESES** |
| Universal representation theorem | **P0 UNSUPPORTED** |
| Claimed bijection | **DEPENDS ON FALSE/UNDER-SPECIFIED REPRESENTATION** |
| Transported operations | **CORRECT METHOD ONCE BIJECTION/SOURCE LAWS EXIST** |
| Complete ordered-field certification | **USES UNCONSTRAINED PROP INSTEAD OF CANONICAL LAWS** |
| Choice usage | **NO NEW GENUINE AC** |

---

# Immediate repair order

1. repair the expansion syntax to allow nonzero values in `(0,1)`;
2. replace `RationalDyadicApproximationData` with genuine canonical arithmetic/embedding certificates;
3. specify powers of two, digit values, finite sums, and numeral evaluation by laws;
4. require/use the canonical ordered absolute value and prove `2^{-n} -> 0`;
5. prove dyadic subring and density from those actual laws;
6. prove existence and uniqueness of binary expansions;
7. only then construct the bijection with the already-established Cauchy reals;
8. transport canonical ordered-field/completeness certificates rather than storing an arbitrary proposition asserting them.
