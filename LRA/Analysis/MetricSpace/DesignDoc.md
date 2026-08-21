# MetricSpace Design

## Purpose

This note records the concrete target structure for
`LRA.Analysis.MetricSpace`.

Repository-wide rules for when a subject gets `Interface`, `Model`,
`UniversalAlgebra`, and `Construction/Realization` live in
`ExternalInterfaces.md`. This file applies that standard specifically to metric
space.

## Decision

`LRA.Analysis.MetricSpace` should be organized as an interface-first subject
with:

- a generic interface,
- a model layer whose fields carry the primitive metric assumptions,
- laws derived from those model fields,
- concrete realizations separated from the core theory,
- explicit Mathlib interop,
- standard examples in a quarantined examples layer.

Metric space should not be defined as a Euclidean extension, even though
Euclidean space is one of its most important realizations in this repository.

## Target Shape

```text
LRA/Analysis/MetricSpace/
  Interface.lean
  Model.lean
  Laws.lean
  Realizations.lean
  Interop.lean
  Examples.lean

  Interface/
    Metric.lean
    MetricSpace.lean

  Model/
    Metric.lean
    MetricSpace.lean

  Laws/
    Metric.lean
    MetricSpace.lean
    Balls.lean
    Convergence.lean
    Continuity.lean

  Realizations/
    Euclidean.lean
    Set.lean
    Mathlib.lean

  Interop/
    ToMathlib.lean
    FromMathlib.lean
    Switch.lean

  Examples/
    Discrete.lean
    Taxicab.lean
    EuclideanRn.lean
```

This is the target architecture. It does not require all files to exist
immediately, but future refactors should move toward it.

## Ownership

### `Interface`

`Interface` is the public abstract surface for metric-space mathematics.

It should own:

- the generic notion of metric,
- the generic notion of metric space,
- any backend-neutral declarations used throughout the subject.

This is the layer where book-style theorems should be stated whenever they
depend only on metric-space abstraction.

### `Model`

`Model` owns the primitive assumptions.

For metric space, this means the model fields carry:

- a carrier,
- a distance function,
- nonnegativity and separation,
- symmetry,
- triangle inequality.

The axioms live in the model. They are not restated as separate assumptions in
downstream theorem files.

### `Laws`

`Laws` owns theorems proved from the model fields.

Typical early laws include:

- `dist_self`,
- equality from zero distance,
- zero distance from equality,
- symmetry rewrites,
- basic ball facts,
- first convergence and continuity lemmas that depend only on the metric
  axioms.

This gives the clean split:

- `Model` = assumptions,
- `Laws` = consequences of every model.

### `Realizations`

`Realizations` contains concrete backends satisfying the interface.

We currently want three:

1. `Euclidean`
   The realization built from `RealModel -> Rn -> distance`.

2. `Set`
   A realization that keeps carrier-level abstraction honest and prevents
   accidental Euclidean dependencies from leaking into generic theorems.

3. `Mathlib`
   A slim realization showing that Mathlib metric spaces satisfy the LRA
   interface.

These files should package realizations. They should not own generic
metric-space theorems.

### `Interop`

`Interop` contains bidirectional bridges to Mathlib.

This is separate from `Realizations/Mathlib`:

- `Realizations/Mathlib` says Mathlib metric spaces realize the LRA interface;
- `Interop/ToMathlib` and `Interop/FromMathlib` provide conversions and
  compatibility lemmas.

### `Examples`

`Examples` contains standard metric examples and pedagogical specializations.

This should include:

- discrete metric,
- taxicab metric,
- concrete Euclidean examples,
- section-local specializations of carrier and metric assumptions.

Examples should remain opt-in and should not become dependencies of the core
interface/model/laws layers.

## Relationship To EuclideanSpace

`LRA.EuclideanSpace` owns coordinate geometry:

- `RealModel`-based coordinate carriers,
- `Rn`, `R1`, `R2`, `R3`, `R4`,
- points, lines, planes, surfaces, regions,
- Euclidean geometric vocabulary and coordinate formulas.

`LRA.Analysis.MetricSpace` consumes Euclidean space; it does not define itself
through Euclidean space.

The Euclidean realization therefore has the form:

```text
RealModel
  -> Rn real_model n
  -> distance on Rn
  -> MetricSpace realization
```

That is one realization of metric space, not the definition of metric space.

## Naming Direction

The existing file
`LRA/Analysis/MetricSpace/Construction/ModelTheory/EuclideanRn.lean`
should eventually move into the realization layer.

Its current name makes it sound like the canonical model-theoretic construction
of the subject. The intended reading is narrower: it is one concrete Euclidean
realization.

So the long-term naming target is something like:

- `LRA/Analysis/MetricSpace/Realizations/Euclidean.lean`

Likewise, future files should avoid using `ModelTheory` when the file is really
about a concrete backend realization rather than formal logical machinery.

## Placement Test

When adding a declaration, use this test:

1. If it depends only on the metric axioms, put it in `Laws`.
2. If it depends on one concrete backend, put it in `Realizations` or
   `Examples`.
3. If it bridges to or from Mathlib, put it in `Interop`.
4. If it is really Euclidean geometry rather than metric-space theory, put it
   in `LRA.EuclideanSpace`.

## Refactor Target

Future metric-space cleanup should aim at:

- replacing ad hoc definition files with the `Interface / Model / Laws`
  structure,
- renaming concrete backend files into `Realizations`,
- keeping Mathlib bridges in `Interop`,
- and keeping Euclidean geometry ownership inside `LRA.EuclideanSpace`.
