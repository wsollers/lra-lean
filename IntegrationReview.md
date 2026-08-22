# LRA Integration Review

## Scope

Maintained mathematical review of the active Volume III integration layer, focusing first on the common partition machinery, Cauchy/Riemann/Darboux integration, measure-zero diagnostics, and Henstock–Kurzweil statements.

Project-wide rule: `sorry` proof bodies are neutral. Concrete placeholder **definitions** are not neutral when substantive theorem statements depend on their intended semantics.

This is a first integration chunk, not yet an exhaustive audit of McShane or Riemann–Stieltjes material.

---

# Files reviewed

- `LRA/Analysis.lean`
- `LRA/Analysis/Integration.lean`
- `LRA/Analysis/Integration/Partitions.lean`
- `LRA/Analysis/Integration/CauchyIntegral/Basic.lean`
- `LRA/Analysis/Integration/RiemannIntegral/Basic.lean`
- `LRA/Analysis/Integration/DarbouxIntegral/Basic.lean`
- `LRA/Analysis/Integration/MeasureZero.lean`
- `LRA/Analysis/Integration/HenstockKurzweil/Basic.lean`

---

# Active status

`LRA.Analysis.lean` imports `LRA.Analysis.Integration`, and the integration aggregate imports the reviewed Cauchy, Riemann, Darboux, measure-zero, Henstock–Kurzweil, McShane, and Riemann–Stieltjes subjects.

Therefore these definitions are part of the active repository-wide analysis surface.

---

# Partition machinery

`IntegrationPartition` correctly represents a finite ordered partition of `[a,b]`, and

```text
SubintervalWidth P i = x_{i+1} - x_i
```

is correct.

Tagged partitions and refinement are standard and correctly shaped.

## P0 — `PartitionMesh` is definitionally zero

Current:

```text
PartitionMesh P := 0
```

The intended mesh is the maximum subinterval width.

This zero stub is not harmless because the Cauchy and Riemann integral definitions use the condition

```text
PartitionMesh P < delta.
```

For every positive `delta`, every partition automatically satisfies that condition.

Thus the definitions no longer express convergence as partitions become fine.

### Required correction

Define

```text
mesh(P) = max_i (x_{i+1} - x_i)
```

with an explicit convention for the degenerate `n = 0` / `a = b` partition, typically mesh `0`.

**Severity: P0 FOUNDATIONAL SEMANTIC STUB.**

---

# Cauchy integral

The left-endpoint sum

```text
CauchySum f P = sum_i f(x_i) (x_{i+1}-x_i)
```

is mathematically meaningful.

The intended definition

```text
HasCauchyIntegral f a b L
```

is also a legitimate left-endpoint Riemann-type convergence notion **provided `PartitionMesh` is genuine**.

Because mesh is currently zero, however, it requires all partition sums, regardless of coarseness, to approach the same `L` arbitrarily closely. Equivalently, the family of all Cauchy sums is forced to collapse to one value.

Consequences:

- the constant-function theorem survives accidentally because constant partition sums telescope to `c(b-a)`;
- `continuous_cauchy_integrable` is false for ordinary nonconstant continuous functions under the current definition;
- tag-independence and later comparisons inherit the poisoned mesh semantics.

## `IntervalOscillation` is also a zero stub

```text
IntervalOscillation ... := 0
```

No major theorem in the reviewed excerpt directly uses it to create a separate contradiction, but it must be replaced before any oscillation-based integral criterion is meaningful.

**Severity: P1 semantic stub; P0 wherever used substantively.**

---

# Riemann integral

`RiemannSum` is the standard tagged Riemann sum.

The intended definition

```text
HasRiemannIntegral f a b L :=
  forall epsilon > 0,
    exists delta > 0,
      forall tagged P,
        mesh(P) < delta -> |sum(f,P)-L| < epsilon
```

is standard.

## P0 inherited from zero mesh

With `PartitionMesh = 0`, every tagged partition is `delta`-fine in the mesh sense for every positive `delta`. Thus `HasRiemannIntegral` demands **all tagged Riemann sums** be arbitrarily close to one `L`, not merely sufficiently fine sums.

For a nonconstant continuous function on a nondegenerate interval, coarse tagged sums can differ, so the active theorem

```text
continuous_riemann_integrable
```

is false under the current definitions.

The Riemann Cauchy criterion is likewise not the intended criterion until mesh is repaired.

**Severity: P0 inherited semantic failure.**

---

# Darboux integral

The intended Darboux framework is standard, but both key sums are currently semantic zero stubs:

```text
LowerDarbouxSum ... := 0
UpperDarbouxSum ... := 0
```

Therefore

```text
UpperDarbouxSum f P - LowerDarbouxSum f P < epsilon
```

is automatically true for every positive `epsilon` and every existing partition.

On a nondegenerate interval, `IsDarbouxIntegrable` consequently becomes essentially universal rather than characterizing bounded Riemann-integrable functions.

## P0 — Riemann/Darboux equivalence is corrupted

Because the Riemann side is over-restrictive from zero mesh while the Darboux side is over-permissive from zero sums, the stated equivalence cannot represent the classical theorem.

## P0 — `dirichlet_not_darboux_integrable` states the wrong function

The theorem is literally

```text
not IsDarbouxIntegrable (fun _ => 0) 0 1.
```

The constant-zero function is classically Darboux integrable. Under the current zero-sum definitions it is also definitionally forced to satisfy the Darboux epsilon criterion.

The intended counterexample was presumably the Dirichlet function (e.g. indicator of rationals), not the constant-zero function.

**Severity: P0 FALSE THEOREM INDEPENDENTLY OF PROOF STATUS.**

### Required Darboux definitions

For each subinterval `I_i`, define

```text
m_i = inf { f(x) | x in I_i }
M_i = sup { f(x) | x in I_i }
L(f,P) = sum_i m_i Delta x_i
U(f,P) = sum_i M_i Delta x_i.
```

Because real `sInf`/`sSup` are totalized, the boundedness domain must be explicit, or the definition should be packaged only for bounded functions on the relevant interval.

This is the same totalized-extrema issue already identified in diameter and limsup/liminf reviews.

---

# Measure-zero diagnostic and Lebesgue criterion

`IsMeasureZero E` is conceptually the standard elementary outer-cover definition using countably many open intervals whose total length is at most `epsilon`.

The positivity of every interval is stronger than necessary but harmless: even the empty set can be covered by an explicit summable sequence of arbitrarily small positive intervals.

**Verdict: CORE IDEA PASS.**

## P0 — `PointOscillation` is zero

Current:

```text
PointOscillation ... := 0.
```

Hence

```text
{x in [a,b] | PointOscillation f a b x > 0}
```

is always empty.

The stated Lebesgue criterion

```text
IsRiemannIntegrable f a b
  iff
IsMeasureZero {x | PointOscillation ... > 0}
```

therefore says every bounded function is Riemann integrable on the right-hand side, since the empty set has measure zero.

This is false and additionally conflicts with the over-restrictive zero-mesh Riemann definition.

**Severity: P0 FALSE SEMANTIC STUB.**

A correct point oscillation should be shared with or bridged to the continuity chapter's genuine oscillation definition once that P0 is repaired, rather than introducing a third independent oscillation object.

---

# Henstock–Kurzweil integral

The core definitions are mathematically sound in shape:

- positive gauge on `[a,b]`;
- tagged partition with tag lying in its own interval;
- HK delta-fineness by containment in the gauge interval;
- integral defined by all gauge-fine tagged sums being epsilon-close to `L`;
- Cousin lemma;
- Riemann-integrable implies HK-integrable;
- derivative/Fundamental-Theorem style HK statement.

The explicit distinction between HK and McShane delta-fineness is good architecture.

**Core HK definition verdict: PASS IN SHAPE.**

It still depends on the common partition/tagged-sum infrastructure, but it does not use the broken uniform mesh in its own integral definition.

## P0 — `hk_strictly_wider_than_lebesgue_witness` is universally false

Current theorem says, for arbitrary `F FD`:

```text
(if FD is the derivative of F everywhere)
->
IsHKIntegrable FD (-1) 1
and not IsRiemannIntegrable |FD| (-1) 1.
```

Take

```text
F(x) = 0,
FD(x) = 0.
```

Then the derivative hypothesis holds, but `|FD| = 0` is Riemann integrable.

So the theorem is false independently of the mesh-stub problem.

There is also a naming/content mismatch: the theorem name says **strictly wider than Lebesgue**, while the displayed conclusion compares HK integrability with **Riemann integrability of the absolute derivative**.

### Likely intended theorem shape

A valid pedagogical separation theorem should be existential, e.g. there exists an everywhere derivative which is HK integrable but not Lebesgue integrable, or a carefully selected HK-integrable function outside a narrower class. The exact witness and comparison notion should be stated explicitly.

Do not universalize this to every derivative.

**Severity: P0 FALSE THEOREM + LABEL MISMATCH.**

---

# Architecture — avoid duplicate partitions/oscillation

There are currently parallel notions in continuity and integration:

- `IntervalPartition` vs `IntegrationPartition`;
- `TaggedPartition` vs `TaggedPartitionIntegration`;
- `MeshOf` vs `PartitionMesh`;
- `OscillationOnSet` / `OscillationAtPoint` vs `IntervalOscillation` / `PointOscillation`.

Some separation can be pedagogically justified, but the current duplicate zero stubs are evidence that these concepts should have a canonical owner.

Recommended ownership:

```text
finite interval partition / tagged partition / mesh
    -> one shared interval-partition module

function oscillation
    -> continuity/topology owner
    -> integration imports it for Riemann criterion
```

Then Cauchy/Riemann/Darboux/HK are different integral structures built on shared partition and oscillation vocabulary.

**Severity: P1 API/OWNERSHIP CONSOLIDATION.**

---

# Relationship to measure theory

This integration chapter is primarily classical real integration plus gauge integrals; it is **not** a substitute for the missing abstract measure/Lebesgue integration layer reviewed in `MeasureTheoryReview.md` and `MeasureConstructionReview.md`.

The order for the learning project can legitimately be:

```text
Riemann/Darboux/gauge integration
        then
measure theory + Lebesgue integration
```

or the two can be developed in parallel, but terminology such as “Lebesgue criterion” and “wider than Lebesgue” should not imply that the abstract Lebesgue theory is already formalized when it is not.

---

# Choice audit

No new genuine family-wise Choice dependency was identified from the statements reviewed in this integration chunk.

Cousin-type existence arguments and finite partition refinements do not inherently require AC.

---

# Final verdict for this chunk

| Dimension | Verdict |
|---|---|
| Partition structure/width | **PASS** |
| Partition mesh | **P0 ZERO STUB** |
| Cauchy sum | **PASS** |
| Cauchy integral definition | **INTENDED FORM PASS; CURRENTLY POISONED BY MESH P0** |
| Riemann sum | **PASS** |
| Riemann integral definition | **INTENDED FORM PASS; CURRENTLY POISONED BY MESH P0** |
| Darboux sums | **P0 ZERO STUBS** |
| Darboux integrability | **CURRENTLY DEGENERATE** |
| Dirichlet counterexample theorem | **P0 WRONG FUNCTION/FALSE** |
| Elementary measure-zero definition | **PASS** |
| Point oscillation | **P0 ZERO STUB** |
| Lebesgue criterion for Riemann integrability | **P0 CURRENTLY FALSE** |
| HK core definition | **PASS IN SHAPE** |
| HK strictness witness theorem | **P0 FALSE UNIVERSAL CLAIM** |
| Shared partition/oscillation ownership | **P1 CONSOLIDATION NEEDED** |

---

# Immediate priority fixes

1. implement genuine `PartitionMesh`;
2. implement genuine lower/upper Darboux sums with explicit boundedness semantics;
3. replace the constant-zero “Dirichlet” counterexample with the actual intended function;
4. unify/repair oscillation definitions and reuse them in the Lebesgue criterion;
5. repair the HK strictness theorem to an actual existential separation statement and correct the Lebesgue/Riemann labeling;
6. consolidate duplicate partition/tag/mesh concepts;
7. only then rely on the Cauchy/Riemann/Darboux equivalence and continuity-implies-integrability theorem surface.
