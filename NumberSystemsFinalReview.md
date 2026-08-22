# LRA Number Systems Final Review Addendum

## Scope

Final pass over the remaining number-system construction families and interop/model wrappers, after the earlier dedicated reviews of Peano/naturals, integers, rationals, reals, complex numbers, construction bridges, and real-extension comparisons.

This pass intentionally does **not** expand into topology, measure theory, functional analysis, abstract algebra enrichment, or other research-phase material except where those are imported by a number-system file.

Project rule: `sorry` proof bodies are neutral. The review concerns definition/theorem statements, semantic coupling, and construction contracts.

---

# Remaining integer construction family: Pfefer

`LRA/NumberSystems/Integers/Constructions/Pfefer.lean` is explicitly a planning placeholder. It contains only a `ConstructionPlan` with status `pending formalization` and makes no mathematical construction claims.

**Verdict: NOT YET MATHEMATICAL CONTENT; no correctness defect to audit.**

This should remain clearly excluded from any statement such as “all five integer constructions are realized/proved.”

---

# Gaussian integers

The Gaussian-integer construction is a positive architectural example.

The carrier is the standard ordered pair

```text
GaussianInteger R = R × R
```

with distinguished `0`, `1`, and `i = (0,1)`.

Under `[CommutativeRingLaws R]`, the construction states the standard coordinatewise additive laws and complex-style multiplication laws, including

```text
i * i = -1.
```

`Instances.lean` then registers those facts directly into the canonical project law certificates:

```text
AdditiveSemigroupLaws
AdditiveCommutativeLaws
AdditiveIdentityLaws
AdditiveInverseLaws
MultiplicativeSemigroupLaws
MultiplicativeCommutativeLaws
MultiplicativeIdentityLaws
ZeroAbsorbingLaws
DistributiveLaws
SubtractionCompatibilityLaw.
```

The active wrapper is also semantically coupled correctly:

```text
ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Z
GaussianArithmeticRingModel := gaussianArithmeticRingModel LRA.NumberSystems.Integers.Z.
```

Unlike the detached real-construction `...RealizesRealModel` declarations, this wrapper actually names the carrier it exposes.

**Verdict: PASS for current commutative-ring scope.**

Possible later enrichment (norm, units, Euclidean-domain behavior, primes) is not required for the current construction claim.

---

# Rational / Real / Complex first-order model wrappers

The top-level wrappers

```text
rationalNumbersModel
realNumbersModel
complexNumbersModel
```

are thin translations of already-selected algebraic carriers into the corresponding first-order signatures.

They do not claim to construct the carrier and do not introduce detached existential witnesses.

Therefore they are conceptually sound wrappers:

```text
selected algebraic carrier/signature -> first-order Model.
```

**Verdict: PASS.**

For rationals/reals, correctness still depends on the selected `RationalModel` / `RealModel` being a genuine construction-tied model, which is the separate realization defect documented in the earlier reviews.

---

# P0 cluster — ContinuedFractions.lean is semantic scaffold, not a valid continued-fraction theory yet

`LRA/NumberSystems/RationalNumbers/ContinuedFractions.lean` contains several theorem/definition statements whose current formal content does not encode the mathematics named by the declarations.

## P0 — `FiniteValue` does not define evaluation by continued fractions

Current content requires only a list `partial_values` such that

```text
partial_values.length = fraction.tail.length + 1
partial_values.head? = some value.
```

There is no relation between successive partial values and:

- `fraction.head`;
- any tail coefficient;
- reciprocal;
- addition;
- the supplied integer embedding.

Thus essentially any rational value can be made a `FiniteValue` of essentially any continued-fraction record by choosing an arbitrary list of the required length with that value at the head.

Consequently the theorem named

```text
rational_has_unique_canonical_finite_expansion
```

cannot express the intended uniqueness theorem at present.

**Severity: P0 DEFINITION DOES NOT ENCODE THE NAMED CONCEPT.**

### Repair

Define finite evaluation recursively, e.g. from the last coefficient upward, or define convergents and require the final convergent to equal `value`.

---

## P0 — `canonical` does not identify the final coefficient

Current finite canonicality says either the tail is empty or

```text
exists last, last ∈ fraction.tail and 1 < last.
```

This merely says **some** tail entry is greater than one. It does not say that the final coefficient is greater than one, nor does it impose the usual positivity conditions on intermediate coefficients.

For a simple continued fraction, the standard uniqueness convention is about the actual last coefficient (and the coefficient domain/sign conditions), not arbitrary list membership.

**Severity: P0/P1 depending on intended exact convention; current predicate is not the standard canonical finite-expansion condition.**

---

## P0 — `Convergents` is under-specified

The structure contains numerator and denominator sequences but only states a recurrence for the numerator.

It lacks:

- denominator recurrence;
- initial values for numerator;
- initial values for denominator;
- nonzero/positive denominator facts;
- a definition tying a convergent value to numerator/denominator.

So the record does not determine the actual convergents of the continued fraction.

**Severity: P0 if used as the definition of convergents; otherwise major scaffold gap.**

---

## P0 — `infinite_continued_fraction_converges` is vacuous

Current conclusion is

```text
exists value,
  forall neighborhood,
    neighborhood value ->
      exists index, neighborhood value.
```

The `fraction` does not occur in the conclusion. Neither do convergents.

Given any chosen `value`, the conclusion follows immediately from `neighborhood value` by choosing any natural-number index.

It therefore does not express convergence at all.

**Severity: P0 VACUOUS THEOREM STATEMENT.**

A correct version must define the convergent sequence and state ordinary convergence of that sequence to `value`.

---

## P0 — Lagrange theorem statement is disconnected from both the fraction and nontrivial quadraticity

`quadratic_irrational_iff_eventually_periodic` currently states

```text
eventually_periodic fraction <->
exists a b c,
  a*value^2 + b*value + c = 0.
```

Problems:

1. there is no hypothesis connecting `value` to the continued fraction `fraction`;
2. `a`, `b`, `c` are arbitrary real-model values rather than the intended integer/rational coefficients;
3. there is no nontriviality condition such as `a ≠ 0` (or at least not all coefficients zero);
4. choosing `a=b=c=0` makes the right-hand side true for every value.

Hence the theorem reduces toward `eventually_periodic fraction <-> True`, which is false for arbitrary infinite coefficient sequences.

**Severity: P0 FALSE / DISCONNECTED THEOREM STATEMENT.**

### Repair

First define an actual value relation between a continued fraction and a real number. Then state Lagrange's theorem using a genuine quadratic irrational predicate, e.g. a real irrational root of a nonzero quadratic polynomial with integer coefficients.

---

# Interval arithmetic over an existing real model

The basic interval definitions (`valid`, `contains`, `width`, addition enclosure) are standard.

However the theorem

```text
dependency_can_make_enclosures_strict
```

only asserts existence of two unequal intervals with one containing the other. No expression, repeated variable, interval evaluation, or dependency mechanism occurs in the statement.

Thus it does not formalize the interval-arithmetic dependency phenomenon named by the theorem.

**Severity: P1/P0 NAME/STATEMENT SEMANTIC MISMATCH.**

It should be replaced by an explicit example such as evaluating `x - x` or another repeated-variable expression by interval operations and comparing with the exact range.

---

# Remaining construction status summary

| Area | Final status |
|---|---|
| Landau naturals | strong concrete/full-predicate backend; generic Peano API too weak |
| Presburger naturals | strong concrete inductive realization |
| Von Neumann naturals | sound construction idea; explicit subset-adequacy bridge still needed |
| WholeNumbers | good carrier/certificate destination; source order contract too weak |
| Quotient ordered-pair integers | formal-difference idea correct; source/order contract too weak |
| Tao/Mendelson integer variants | inherit shared weak quotient input contract |
| Polish integers | strongest integer realization; good canonical certificates/full `PredicateSet` induction |
| Pfefer integers | plan only; no math yet |
| Rational quotient fractions | standard fraction quotient idea; denominator/gcd/Archimedean contracts too weak |
| Continued fractions | **P0 semantic scaffold; statements need redesign before proving** |
| Dedekind reals | strongest reference construction; source `RationalModel` too broad, realization bridge detached |
| Cauchy reals | quotient idea sound; metric contract/law/embedding layer incomplete |
| Cantor intervals | blocked by nonsymmetric equivalence |
| Primitive intervals | strongest independent nested-interval design; summary/certificate defects remain |
| Dyadic/binary | representation layer, not independent R construction; syntax/data contract defects |
| Computable reals | should be an incomplete countable subfield, not a `RealModel`; current effective definitions broken |
| Extended/nonnegative reals | generally good derived layers; extended partial-operation abstraction needs separation |
| Irrationals | good embedding-relative definition |
| Complex ordered pairs | strong canonical-law architecture; local FTA polynomial representation defect |
| Gaussian integers | **PASS for current commutative-ring scope** |

---

# Number-system architectural conclusion

The most reliable construction pattern in the current repo is:

```text
concrete carrier
-> concrete operations
-> explicit named laws
-> canonical AlgebraicStructures certificates
-> model wrapper tied definitionally to the carrier.
```

Complex numbers, Polish integers, and Gaussian integers are the best current examples.

The recurring anti-pattern is:

```text
broad weak input record
-> theorem asserting rich target behavior
-> detached Model witness whose type does not mention the constructed carrier.
```

That anti-pattern accounts for most of the serious number-system defects found in this audit.

---

# Choice audit

No new genuine family-wise Axiom-of-Choice dependency was found in this final number-system pass.

Single-witness `Classical.choice` / inverse extraction remains ordinary witness selection and is not being counted as AC.
