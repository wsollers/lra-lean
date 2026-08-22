# LRA Cantor Nested-Interval Real Construction Review

## Scope

Focused review of `LRA/NumberSystems/RealNumbers/Constructions/Cantor`.

This construction is intended to build reals from nested rational intervals whose widths converge to zero.

---

# Files reviewed

- `Carrier.lean`
- `Equivalence.lean`
- `Operations.lean`
- `Behavior.lean`
- `Instances.lean`

The foundational defect in `Equivalence.lean` already prevents the quotient carrier from being mathematically valid, so deeper operation-law review is blocked until that is repaired.

---

# Nested interval carrier

`EndpointInterval` consists of rational endpoints with `lower <= upper`.

`NestedIntervalSequence` requires:

- lower endpoints are nondecreasing;
- upper endpoints are nonincreasing;
- widths become arbitrarily small.

The width condition is phrased as

```text
for every epsilon > 0,
  exists n, width(n) < epsilon.
```

Because nesting makes widths nonincreasing, this is sufficient to express convergence of the widths to zero.

The carrier definition does not use an already-existing real ambient.

**Verdict: PASS.**

---

# P0 — `endpoint_equivalent` is not an equivalence relation

Current relation:

```text
first ~ second iff
  for every tolerance > 0,
    exists n,
      first.lower(n) - second.upper(n) < tolerance.
```

This is one-sided.

## Concrete counterexample

Use two constant zero-width nested interval sequences:

```text
A_n = [0,0]
B_n = [1,1].
```

Both satisfy all `NestedIntervalSequence` requirements.

For `A ~ B`, the required inequality is

```text
0 - 1 < epsilon,
```

i.e. `-1 < epsilon`, which holds for every positive epsilon. Thus `A ~ B`.

For `B ~ A`, the condition is

```text
1 - 0 < epsilon,
```

which fails for any `0 < epsilon <= 1`.

Hence

```text
endpoint_equivalent A B
```

holds while

```text
endpoint_equivalent B A
```

does not.

Therefore the relation is not symmetric, so

```text
endpoint_equivalent_is_equivalence
```

is false and the declared `Setoid`/quotient carrier is mathematically invalid.

**Severity: P0 FOUNDATIONAL CARRIER DEFECT.**

---

# Correct equivalence shape

Two shrinking nested interval sequences should represent the same real when their limiting locations coincide.

A formulation using only rational endpoint data can require mutual cross-gap convergence, for example:

```text
forall epsilon > 0, exists n,
  first.lower n - second.upper n < epsilon
  and
  second.lower n - first.upper n < epsilon.
```

Equivalently one can require the endpoint sequences to become mutually arbitrarily close, or use an appropriate absolute-value/Hausdorff-distance formulation.

The essential point is **symmetry**.

If the pedagogical goal is to define equivalence through interval overlap, another clean approach is to formulate an explicitly symmetric overlap/arbitrarily-close condition and prove equivalence from nesting plus vanishing width.

---

# Arithmetic layer is absent

`Operations.lean` explicitly states that the source defines no addition, negation, multiplication, or other arithmetic on the Cantor carrier.

Thus even after repairing equivalence, this subtree currently provides only a candidate set of real values, not a constructed ordered field.

Before calling this a full construction of `R`, add:

1. rational embedding by constant/controlled shrinking intervals;
2. addition of interval sequences;
3. negation;
4. multiplication with sign control;
5. order;
6. proof all operations/order respect equivalence;
7. field laws;
8. completeness.

**Severity: P1 MAJOR CONSTRUCTION-SURFACE GAP.**

---

# P0/P1 — theorem named `isomorphic` only states injectivity

Current theorem:

```text
cantor_reals_are_isomorphic_to_cauchy_reals
```

concludes only

```text
exists comparison : CantorCarrier -> CauchyCarrier,
  Injective comparison.
```

There is no:

- surjectivity;
- inverse map;
- bijectivity;
- preservation of addition/multiplication;
- preservation/reflection of order.

Therefore it does not state an isomorphism in any standard sense.

At most the current statement says that the Cantor carrier embeds injectively into the Cauchy carrier.

**Severity: P0 NAME/STATEMENT MISMATCH if relied on as an isomorphism; P1 if documentary placeholder.**

The theorem is additionally downstream of the broken Cantor equivalence relation and the under-specified Cauchy metric contract, so it should be revisited only after both constructions are repaired.

---

# P0 — `CantorRealizesRealModel` is detached from the Cantor carrier

As with the other construction-registration declarations, the type is merely

```text
CantorRealizesRealModel (rational_model : RationalModel) : RealModel.
```

It does not require the returned model carrier to equal

```text
Carrier rational_model
```

and no arithmetic operations are even defined on the Cantor carrier in the current subtree.

Therefore this declaration does not formally certify the Cantor construction as a real model.

See `ConstructionRealizationReview.md` for the repository-wide issue.

**Severity: P0 SEMANTIC DETACHMENT.**

---

# Source-model generality

Like the Dedekind construction, Cantor is parameterized by arbitrary `RationalModel`, which is a broad dense ordered-field class rather than specifically the Archimedean rational field.

For a construction intended to recover the ordinary real numbers, eventually require or derive the appropriate Archimedean/cofinal source conditions.

This issue is secondary here because the equivalence relation fails before the final structure stage.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency was identified.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Rational endpoint intervals | **PASS** |
| Nestedness condition | **PASS** |
| Widths -> 0 condition | **PASS** |
| Endpoint equivalence | **P0 NOT SYMMETRIC** |
| Setoid / quotient carrier | **BLOCKED BY P0** |
| Arithmetic operations | **NOT BUILT** |
| Ordered-field structure | **NOT BUILT** |
| Cauchy comparison called isomorphism | **ONLY INJECTIVE MAP** |
| RealModel realization | **P0 DETACHED** |
| Choice usage | **NONE** |

---

# Immediate repair order

1. replace `endpoint_equivalent` by a genuinely symmetric same-limit relation;
2. prove reflexivity/symmetry/transitivity before constructing the quotient;
3. add the rational embedding and order;
4. add arithmetic and representative-independence proofs;
5. establish field and completeness certificates;
6. replace the Cauchy comparison with an actual bijective structure-preserving map;
7. construct `RealModel` definitionally from the repaired Cantor carrier.
