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
- `LRA/Analysis/NormedLinearSpace/Construction/UniversalAlgebra.lean`
- `LRA/Analysis/NormedLinearSpace/Realizations/Canonical.lean`
- `LRA/Analysis/BanachSpace/Definition/BanachSpace.lean`
- `LRA/Analysis/BanachSpace/Interop/ToMathlib.lean`
- `LRA/Analysis/BanachSpace/Interop/FromMathlib.lean`
- `LRA/Analysis/InnerProductSpace/Definition/InnerProductSpace.lean`
- `LRA/Analysis/InnerProductSpace/Construction/UniversalAlgebra.lean`
- `LRA/Analysis/HilbertSpace/Definition/HilbertSpace.lean`
- `LRA/Analysis/HilbertSpace/Interop/ToMathlib.lean`
- `LRA/Analysis/HilbertSpace/Interop/FromMathlib.lean`
- `LRA/Algebra/LinearAlgebra.lean`
- `LRA/Algebra/LinearAlgebra/VectorSpace/Definition/VectorSpace.lean`
- `LRA/Algebra/LinearAlgebra/LinearMap/Definition/LinearMap.lean`
- `LRA/Algebra/ProofsToDo.md`

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

# Review 2 — construction, realization, and interop surfaces

## Normed linear spaces

The current normed-linear-space construction and canonical-realization files are placeholders only. In particular, there is no current project-facing construction proving that a norm induces a metric

```text
d(x,y) = norm(x-y),
```

nor a canonical realization such as `Real^n` with a familiar norm.

This leaves an important dependency edge implicit:

```text
vector space + norm
    -> metric space
    -> topology
    -> convergence/Cauchy notions.
```

The project already has a strong generic metric-space layer, so this should be a bridge, not a second metric theory.

**Severity: P1 ARCHITECTURAL BRIDGE.**

## Banach interop

`BanachSpace/Interop/ToMathlib.lean` and `FromMathlib.lean` are route comments only. There is no implemented conversion between the reference Banach record and Mathlib's normed-space plus `CompleteSpace` structure.

Likewise the construction/examples/realizations surfaces are still scaffold-heavy.

Therefore the current Banach layer is suitable as textbook/reference data but not yet as a strong proof-facing abstraction.

**Severity: P1.**

## Hilbert interop

The Hilbert interop tree likewise contains `ToMathlib` / `FromMathlib` placeholders rather than actual conversions. No canonical realization was located in this pass.

This means the current reference Hilbert structure has no theorem-level path to:

- a project normed-linear-space structure;
- a project Banach-space structure;
- Mathlib's `InnerProductSpace` + `CompleteSpace` APIs.

**Severity: P1.**

---

# Review 3 — underlying linear-algebra dependency

## Vector spaces

`VectorSpaceDefinition` is mathematically sound. Its primitive laws give an abelian additive group and the standard field-action/module laws. Right additive identity and right inverse are derivable from commutativity together with the supplied left laws.

**Verdict: PASS.**

## Linear maps

`LinearMapDefinition` correctly consists of a function preserving vector addition and scalar multiplication. Preservation of zero and additive inverses should be derived theorems rather than extra axioms.

**Verdict: PASS.**

## P1 — the canonical linear-algebra hierarchy is currently too thin for the planned functional-analysis layer

This is now confirmed by both the current directory tree and the generated proof inventory:

- `LRA/Algebra/LinearAlgebra.lean` imports only `LinearMap.Definition`;
- the current `LRA/Algebra/LinearAlgebra` directory contains only `VectorSpace` and `LinearMap` subjects;
- `LRA/Algebra/ProofsToDo.md` reports **0 theorem declarations across 0 modules** under the algebra proof inventory.

No canonical project-facing owners were located for:

- linear subspaces;
- span;
- linear combinations of vectors;
- linear independence;
- generating sets;
- bases;
- dimension / finite-dimensionality;
- kernel and range as linear subspaces;
- quotient vector spaces;
- linear isomorphisms.

This is not a correctness defect in the existing definitions, but it is a real dependency gap for several desired functional-analysis theorems.

In particular, the following should not be developed ad hoc inside Hilbert/Banach modules:

- finite-dimensional normed spaces are complete;
- orthonormal families and bases;
- projection onto a subspace;
- closed-subspace completeness;
- continuous linear operators and their kernels/ranges;
- quotient normed spaces later.

### Recommended ownership

Build the algebraic hierarchy first:

```text
VectorSpace
  -> LinearSubspace
  -> Span
  -> LinearIndependent
  -> Basis
  -> FiniteDimensional / Dimension
  -> LinearMap kernel/range
  -> LinearEquiv
  -> QuotientVectorSpace
```

Then functional analysis can enrich these with norms/topology rather than redeclaring the algebra.

### High-value algebraic laws to expose

For the project's Landau-style law/certificate architecture, include named theorem surfaces such as:

- zero subspace and whole-space subspace;
- intersection of subspaces;
- span is the least subspace containing a set;
- span monotonicity;
- linear-map kernel and range are subspaces;
- injective linear map iff kernel is zero;
- linear independence iff only the trivial finite linear combination vanishes;
- basis = linearly independent + spanning;
- coordinates with respect to a basis are unique;
- finite-dimensional dimension invariance under linear equivalence;
- rank-nullity once finite-dimensionality exists.

These are particularly useful because they state both the object and the requirements that characterize it, matching the project's intended theorem/law style.

**Severity: P1 FOUNDATION/CURRICULUM GAP.**

---

# Recommended bridge ladder

A coherent implementation order is:

```text
NormedLinearSpaceDefinition
  -> induced MetricDefinition
  -> induced TopologyDefinition / Mathlib topology
  -> norm convergence iff metric convergence
  -> norm Cauchy iff metric Cauchy

RealInnerProductSpaceDefinition
  -> Cauchy-Schwarz
  -> induced NormedLinearSpaceDefinition

BanachSpaceDefinition
  -> complete induced metric
  -> Mathlib CompleteSpace bridge

RealHilbertSpaceDefinition
  -> induced BanachSpaceDefinition
  -> Mathlib complete inner-product-space bridge.
```

Every step should have compatibility theorems, not merely instances.

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

That is a reasonable architecture, but unlike the metric/topology layer, the current round-trip/compatibility theorem surface is not implemented.

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

For learning, include canonical examples in this order:

1. `Real^n` with the Euclidean norm;
2. `Real^n` with standard inner product;
3. finite-dimensional spaces are Banach;
4. `C([a,b])` with the sup norm as an important Banach example;
5. finite-support sequences as an incomplete normed subspace under an `l^2`-type norm;
6. `l^2` / square-summable sequences as the first infinite-dimensional Hilbert example;
7. a Banach space whose norm is not induced by an inner product, such as `l^1` or `C([a,b])` with sup norm.

For the pre-measure-theory learning path, items 1–4 are enough. `L^p` spaces should wait until measure and Lebesgue integration are established.

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

No genuine family-wise Axiom-of-Choice dependency was identified in the reviewed definitions, construction placeholders, interop placeholders, vector-space definition, or linear-map definition.

Later statements involving existence of Hamel bases are strongly Choice-sensitive and should be audited separately. Orthonormal-basis existence in arbitrary Hilbert spaces also invokes substantial choice/Zorn-style reasoning; finite orthonormal families, Gram-Schmidt on an explicitly finite/listed family, and the canonical standard basis of `l^2` do not.

A theorem asserting that every vector space has a basis should be explicitly marked Choice/Zorn-sensitive rather than treated as routine linear algebra.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Vector-space axioms | **PASS** |
| Linear-map definition | **PASS** |
| Algebra theorem surface | **EMPTY — 0 DECLARATIONS IN CURRENT PROOF INVENTORY** |
| Subspace/span/independence/basis hierarchy | **NOT BUILT / P1** |
| Normed linear-space axioms | **PASS** |
| Norm -> metric bridge | **MISSING / P1** |
| Normed-space canonical realizations | **SCAFFOLD ONLY** |
| Banach completeness definition | **PASS** |
| Banach interop | **PLACEHOLDER / P1** |
| Real inner-product axioms | **PASS** |
| Real Hilbert definition | **PASS IN CORE IDEA** |
| Cauchy–Schwarz | **NOT LOCATED / P1** |
| Inner product -> norm construction | **NOT LOCATED / P1** |
| Hilbert -> Banach bridge | **NOT LOCATED / P1** |
| Hilbert interop | **PLACEHOLDER / P1** |
| Canonical examples | **NEEDS BUILDOUT** |
| Choice usage | **NO CURRENT AC; FUTURE BASIS EXISTENCE IS CHOICE-SENSITIVE** |

---

# Immediate implementation order

1. build canonical linear-subspace/span/independence/basis vocabulary;
2. add kernel/range/linear-equivalence and finite-dimensional dimension theory;
3. derive norm elementary laws and the induced metric;
4. bridge norm convergence/Cauchy to the metric-space layer;
5. prove Cauchy–Schwarz from `RealInnerProductSpaceDefinition`;
6. construct/prove the induced norm axioms;
7. bridge inner-product spaces to normed linear spaces;
8. bridge Hilbert spaces to Banach spaces;
9. add Mathlib compatibility conversions;
10. add `Real^n`, `C([a,b])`, and a simple incomplete normed-space example;
11. add `l^2` after the sequence/function-space prerequisites are ready;
12. only then build projection/Riesz/operator theory.
