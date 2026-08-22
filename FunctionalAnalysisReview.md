# LRA Functional Analysis Foundations Review

## Scope

Maintained review of the initial functional-analysis structure layer:

- normed linear spaces;
- Banach spaces;
- real inner-product spaces;
- real Hilbert spaces.

This is a foundations/readiness pass, not a review of advanced functional-analysis theorems.

Project-wide rules apply: `sorry` is neutral scaffolding; missing theorem surfaces are distinguished from false definitions.

---

# Files reviewed

- `LRA/Analysis/FunctionalAnalysis.lean`
- `LRA/Analysis/NormedLinearSpace.lean`
- `LRA/Analysis/NormedLinearSpace/Definition/NormedLinearSpace.lean`
- `LRA/Analysis/BanachSpace/Definition/BanachSpace.lean`
- `LRA/Analysis/InnerProductSpace/Definition/InnerProductSpace.lean`
- `LRA/Analysis/InnerProductSpace/Construction/UniversalAlgebra.lean`
- `LRA/Analysis/HilbertSpace/Definition/HilbertSpace.lean`

---

# Normed linear spaces

`NormedLinearSpaceDefinition K V` contains:

- underlying vector-space data;
- a real-valued norm;
- nonnegativity;
- definiteness;
- triangle inequality;
- scalar compatibility `||a x|| = ||a|| ||x||`.

This is the standard normed-vector-space axiom system over a normed field.

**Verdict: PASS.**

## Useful derived theorem surface

Before serious functional analysis, expose explicitly:

- `norm 0 = 0`;
- `norm (-x) = norm x`;
- reverse triangle inequality;
- metric `d(x,y)=||x-y||` satisfies the metric axioms;
- translation invariance of the induced metric;
- vector addition and scalar multiplication are continuous;
- convergence/Cauchy formulations agree with the induced metric/Mathlib norm topology.

These are not additional axioms; they should be derived.

---

# Banach spaces

The reference Cauchy predicate uses

```text
||x_m - x_n|| < epsilon
```

eventually in both indices, and convergence uses

```text
||x_n - x|| < epsilon.
```

`BanachSpaceDefinition` then requires every Cauchy sequence to converge.

This is the standard sequential completeness definition for normed spaces.

**Verdict: PASS.**

## Architecture note

The project now has several notions called or related to completeness:

- order/LUB completeness;
- real-sequence Cauchy completeness;
- metric/uniform completeness;
- Banach completeness.

The Banach version is correctly norm-induced, but explicit bridge names should keep these concepts distinct. Avoid a generic unqualified theorem name `Completeness` across layers.

---

# Real inner-product spaces

`RealInnerProductSpaceDefinition` has:

- underlying real vector-space data;
- symmetry;
- additivity in the first argument;
- scalar homogeneity in the first argument;
- nonnegativity of `<x,x>`;
- positive definiteness.

Over `Real`, symmetry transfers first-slot linearity to the second slot, so this is a valid real inner-product-space axiom system.

**Verdict: PASS.**

The restriction to real inner-product spaces is explicit and appropriate for an introductory layer. A complex version later needs conjugate symmetry and sesquilinearity rather than copying these axioms verbatim.

---

# Hilbert spaces

The reference norm is

```text
||x|| = sqrt(<x,x>)
```

and Cauchy/convergence are defined using that norm. `RealHilbertSpaceDefinition` requires every such Cauchy sequence to converge.

This is mathematically the standard idea of a real Hilbert space.

**Verdict: CORE DEFINITION PASS.**

---

# P1 — induced-norm theorem bridge is missing

The current inner-product construction surface is essentially placeholder-only. No project-facing theorem layer was located proving that

```text
ReferenceNorm x = sqrt(<x,x>)
```

satisfies the norm axioms.

The key missing dependency is Cauchy–Schwarz:

```text
|<x,y>| <= ||x|| ||y||.
```

From it derive:

- triangle inequality for the induced norm;
- definiteness/nonnegativity;
- `||a x|| = |a| ||x||`;
- reverse triangle inequality.

Then construct an actual

```text
RealInnerProductSpaceDefinition V
    -> NormedLinearSpaceDefinition Real V
```

and prove the Hilbert Cauchy/convergence predicates agree with the Banach predicates for that induced norm.

**Severity: P1 LEARNING/PROOF-READINESS GAP, not a false definition.**

---

# High-value inner-product theorems before Hilbert theory

Add at least:

1. Cauchy–Schwarz;
2. induced norm is a norm;
3. Pythagorean theorem for orthogonal vectors;
4. parallelogram identity;
5. polarization identity over `Real`;
6. orthogonality symmetry;
7. projection onto a one-dimensional span;
8. Bessel inequality for finite orthonormal families.

Before a deeper Hilbert-space chapter, then add:

- orthogonal projection onto closed subspaces;
- best approximation theorem;
- orthogonal complements;
- Parseval for complete orthonormal systems later.

Riesz representation can wait until continuous linear functionals have a canonical owner.

---

# Interop/readiness

The source comments explicitly say these are reference definitions and later formal proofs should use Mathlib's normed/inner-product/complete-space APIs.

That is a reasonable architecture, but unlike the metric/topology layer, no strong round-trip/compatibility theorem surface was located in this pass.

Recommended bridges:

```text
NormedLinearSpaceDefinition -> Mathlib NormedAddCommGroup + NormedSpace
RealInnerProductSpaceDefinition -> Mathlib InnerProductSpace
BanachSpaceDefinition -> Mathlib CompleteSpace
RealHilbertSpaceDefinition -> Mathlib complete inner-product space
```

with pointwise norm/inner-product equality theorems.

**Priority: P1 before serious theorem development.**

---

# Examples needed early

For learning, include canonical examples:

- `Real^n` with Euclidean norm;
- `Real^n` with standard inner product;
- finite-dimensional spaces are Banach;
- `l^2` / square-summable sequences as the first infinite-dimensional Hilbert example later;
- a normed space that is not complete, e.g. a dense proper subspace such as polynomials under a suitable norm or finite-support sequences under an `l^2` norm;
- a Banach space whose norm is not induced by an inner product, to separate Banach from Hilbert.

The last distinction is especially valuable: not every Banach space is Hilbert.

---

# Failure modes / conceptual separators

Useful explicit separators:

- inner product => norm, but not every norm comes from an inner product;
- parallelogram law characterizes inner-product norms (Jordan–von Neumann, optional but illuminating);
- complete metric/normed space does not imply an inner product exists;
- finite-dimensional normed spaces are complete, but infinite-dimensional normed spaces need not be;
- closed subspaces of Banach spaces are Banach;
- nonclosed subspaces of Banach spaces need not be complete.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency was identified in the reviewed definitions.

Later statements involving existence of Hamel bases would be strongly Choice-sensitive and should be audited separately. Orthonormal-basis existence in arbitrary Hilbert spaces also invokes substantial choice/Zorn-style reasoning; finite orthonormal families and explicit `l^2` bases do not.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Normed linear-space axioms | **PASS** |
| Banach completeness definition | **PASS** |
| Real inner-product axioms | **PASS** |
| Real Hilbert definition | **PASS IN CORE IDEA** |
| Cauchy–Schwarz | **NOT LOCATED / P1** |
| Inner product -> norm construction | **NOT LOCATED / P1** |
| Hilbert -> Banach bridge | **NOT LOCATED / P1** |
| Mathlib interop | **NEEDS BUILDOUT** |
| Canonical examples | **NEEDS BUILDOUT** |
| Choice usage | **NO CURRENT AC; FUTURE BASIS EXISTENCE IS CHOICE-SENSITIVE** |

---

# Immediate implementation order

1. prove Cauchy–Schwarz from `RealInnerProductSpaceDefinition`;
2. construct/prove the induced norm axioms;
3. bridge inner-product spaces to normed linear spaces;
4. bridge Hilbert spaces to Banach spaces;
5. add Mathlib compatibility conversions;
6. add `Real^n` examples;
7. add closed-subspace completeness;
8. add first infinite-dimensional examples and Banach-vs-Hilbert separator;
9. only then build projection/Riesz/operator theory.
