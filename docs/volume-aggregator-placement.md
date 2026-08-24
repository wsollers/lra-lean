# Volume Aggregator Placement

This document records the current volume-aggregator placement decision derived
from:

- `docs/tool-prompts/volume-aggregator-repopulation.md`
- `F:/repos/lra-volume-i/volume-i/index.tex`
- `F:/repos/lra-volume-ii/volume-ii/index.tex`
- `F:/repos/lra-volume-iii/volume-iii/index.tex`
- `F:/repos/lra-volume-iv/volume-iv/index.tex`
- `F:/repos/lra-volume-v/volume-v/index.tex`
- `F:/repos/lra-volume-vi/volume-vi/index.tex`
- `F:/repos/lra-volume-vii/volume-vii/index.tex`
- the corresponding per-book `index.tex` files under those volume repos
- the current public Lean surfaces under `LRA/`

It is a static placement report only. It does not regenerate aggregators and it
does not reintroduce deleted legacy `LRA/Volume*/**` trees.

## Standard

Each active volume uses three flat aggregate files:

- `LRA.Volume*Core`
- `LRA.Volume*ExamplesFailures`
- `LRA.Volume*All`

`LRA.Volume*` remains the backward-compatible alias of `LRA.Volume*All`.

Placement rule:

- `Core` routers are assigned by TOC topic alignment.
- Topic-local `Examples` and `Failures` inherit the same volume as their parent
  topic by default.
- Topic-local `Interop` inherits the same volume as its parent topic by
  default.
- Topic assignment is not complete until the matching topic-local `Examples`,
  `Failures`, and `Interop` routers are assigned at the same time when they
  exist.
- `Model` subtrees follow the parent topic by default. Only logic-native model
  theory and proof-theory surfaces, such as `Logic/Model` and logic proof
  systems, should be promoted into the Volume VII advanced-logic slice.
- Leave `Examples`, `Failures`, or `Interop` out of a volume only when they are
  clearly global, cross-topic, or support-only.

## TOC Basis

### Volume I

External TOC:

- Book I: logic
- Book II: sets
- Book III: geometry

### Volume II

External TOC:

- Book I: discrete algebraic
- Book II: continuum
- Book III: arithmetic

### Volume III

External TOC:

- Book I: real analysis, bounding, completeness, structure of the real line,
  functions, discrete calculus, sequences, series, function sequences
- Book II: elementary functions, continuity, differentiation
- Book III: integration

### Volume IV

External TOC:

- algebras of sets
- mathematical spaces
- metric spaces
- topological spaces
- measurable spaces
- measure spaces
- vector spaces
- normed linear spaces
- Banach spaces
- inner product spaces
- Hilbert spaces

### Volume VII

External TOC:

- model theory
- proof theory
- lambda calculus
- type theory
- category theory

### Volume V

External TOC:

- measure theory
- functional analysis

### Volume VI

External TOC:

- algebraic structures
- linear algebra
- lattice and order theory

## Determined Placement

### Volume I

`LRA.VolumeICore` should contain:

- `LRA.Logic`
- `LRA.Identity`
- `LRA.Identity.Model`
- `LRA.Identity.Toolkit`
- `LRA.Meta.DeclarationKeywords`
- `LRA.Set`
- `LRA.Relation`
- `LRA.Function`
- `LRA.Order`
- `LRA.SetSystems`
- `LRA.Cardinality`
- `LRA.EuclideanSpace`

Reason:

- These are the current public routers that best match logic, sets, order,
  cardinality, and the geometry slice.
- `LRA.Identity` belongs here because Volume I includes axiomatic equality.
- `LRA.Identity.Model`, `LRA.Identity.Toolkit`, and
  `LRA.Meta.DeclarationKeywords` are foundational support surfaces for the
  Volume I logic-and-identity material.
- No deleted legacy subtree names are reused.

`LRA.VolumeIExamplesFailures` should contain:

- `LRA.Order.Examples`
- `LRA.Order.FailureModes`
- `LRA.SetSystems.Examples`

Reason:

- These are the currently existing opt-in public surfaces that fit the Volume I
  slice without reaching into unrelated areas.

### Volume II

`LRA.VolumeIICore` should contain:

- `LRA.Relation`
- `LRA.Operation`
- `LRA.NumberSystems.PeanoSystem`
- `LRA.NumberSystems.NaturalNumbers`
- `LRA.NumberSystems.WholeNumbers`
- `LRA.NumberSystems.IntegerStructure`
- `LRA.NumberSystems.Integers`
- `LRA.NumberSystems.RationalNumbers`
- `LRA.NumberSystems.RealNumbers`
- `LRA.NumberSystems.ComplexNumbers`
- `LRA.NumberSystems.GaussianIntegers`
- `LRA.Arithmetic`
- `LRA.EuclideanSpace`

Reason:

- This matches the explicit Volume II books and chapters around equality,
  operations, discrete number systems, continuum constructions, arithmetic, and
  the intended Euclidean geometry placement for this repo.
- It intentionally excludes `LRA.Order` and `LRA.AlgebraicStructures` as
  standalone volume-level imports because those are broader than the Volume II
  TOC and are already pulled transitively where needed.

`LRA.VolumeIIExamplesFailures` should contain:

- `LRA.Operation.Examples`
- `LRA.Operation.FailureModes`
- `LRA.NumberSystems.RationalNumbers.Examples`

Reason:

- These are the currently existing opt-in public surfaces that fit the Volume
  II slice.

### Volume III

`LRA.VolumeIIICore` should contain:

- `LRA.NumberSystems.RealNumbers`
- `LRA.Analysis.RealAnalysis`
- `LRA.Analysis.Bounds`
- `LRA.Analysis.Completeness`
- `LRA.Analysis.StructureOfRealLine`
- `LRA.Analysis.Functions`
- `LRA.Analysis.Sequences`
- `LRA.Analysis.Limits`
- `LRA.Analysis.Continuity`
- `LRA.Analysis.Differentiation`
- `LRA.Analysis.Integration`

Reason:

- These are the current public analysis routers that match the Volume III TOC.
- This intentionally avoids the broader `LRA.Analysis` umbrella because that
  umbrella also pulls metric space, measure theory, and functional analysis
  material beyond the present Volume III books.

`LRA.VolumeIIIExamplesFailures` should contain:

- `LRA.Analysis.Bounds.Examples`
- `LRA.Analysis.Completeness.Completeness.Failures`
- `LRA.Analysis.Completeness.Density.Failures`
- `LRA.Analysis.Completeness.NestedIntervalProperty.Failures`
- `LRA.Analysis.Limits.IndeterminateForms.Failures`
- `LRA.Analysis.Limits.Order.Failures`
- `LRA.Analysis.Sequences.ExamplesCounterexamples`
- `LRA.Analysis.Sequences.Interop.Mathlib`

Reason:

- These are topic-local examples and failures attached to parent topics already
  assigned to Volume III.
- This follows the inheritance rule for topic-local examples, failures, and
  interop instead of treating them as repository-global by default.

### Volume IV

`LRA.VolumeIVCore` should contain:

- `LRA.Analysis.MetricSpace`
- `LRA.Topology`
- `LRA.Analysis.NormedLinearSpace`
- `LRA.Analysis.BanachSpace`
- `LRA.Analysis.InnerProductSpace`
- `LRA.Analysis.HilbertSpace`

Reason:

- These are the current public routers that match the Volume IV mathematical
  spaces TOC inside the present Lean tree.
- This keeps the spaces-side analysis material out of `LRA.VolumeIIICore`.
- The standalone `LRA.Analysis.MeasureTheory` and
  `LRA.Analysis.FunctionalAnalysis` routers belong to Volume V, while their
  space-side prerequisites remain here.
- `LRA.Topology` is the current public root matching the Volume IV `Topology`
  chapter, even though the underlying subtree is named `PointSetTopology`.

`LRA.VolumeIVExamplesFailures` should contain:

- `LRA.Analysis.BanachSpace.Examples`
- `LRA.Analysis.BanachSpace.Failures`
- `LRA.Analysis.BanachSpace.Interop.FromMathlib`
- `LRA.Analysis.BanachSpace.Interop.ToMathlib`
- `LRA.Analysis.HilbertSpace.Examples`
- `LRA.Analysis.HilbertSpace.Failures`
- `LRA.Analysis.HilbertSpace.Interop.FromMathlib`
- `LRA.Analysis.HilbertSpace.Interop.ToMathlib`
- `LRA.Analysis.InnerProductSpace.Examples`
- `LRA.Analysis.InnerProductSpace.Failures`
- `LRA.Analysis.InnerProductSpace.Interop.FromMathlib`
- `LRA.Analysis.InnerProductSpace.Interop.ToMathlib`
- `LRA.Analysis.MeasureTheory.MeasurableSpace.Examples`
- `LRA.Analysis.MeasureTheory.MeasurableSpace.Failures`
- `LRA.Analysis.MeasureTheory.MeasurableSpace.Interop.FromMathlib`
- `LRA.Analysis.MeasureTheory.MeasurableSpace.Interop.ToMathlib`
- `LRA.Analysis.MeasureTheory.MeasureSpace.Examples`
- `LRA.Analysis.MeasureTheory.MeasureSpace.Failures`
- `LRA.Analysis.MeasureTheory.MeasureSpace.Interop.FromMathlib`
- `LRA.Analysis.MeasureTheory.MeasureSpace.Interop.ToMathlib`
- `LRA.Analysis.MetricSpace.Examples`
- `LRA.Analysis.MetricSpace.Failures`
- `LRA.Analysis.MetricSpace.Interop`
- `LRA.Analysis.NormedLinearSpace.Examples`
- `LRA.Analysis.NormedLinearSpace.Failures`
- `LRA.Analysis.NormedLinearSpace.Interop.FromMathlib`
- `LRA.Analysis.NormedLinearSpace.Interop.ToMathlib`
- `LRA.Topology.PointSetTopology.TopologicalSpace.Examples`
- `LRA.Topology.PointSetTopology.TopologicalSpace.Failures`
- `LRA.Topology.PointSetTopology.TopologicalSpace.Interop`

Reason:

- These are topic-local examples and failures attached to parent topics already
  assigned to Volume IV.
- These also include topic-local interop attached to the same Volume IV parent
  topics.
- The topology examples, failures, and interop routers are included here
  because the Volume IV TOC chapter is `Topology`, and the current Lean public
  topology surface lives under `Topology/PointSetTopology`.

### Volume V

`LRA.VolumeVCore` should contain:

- `LRA.Analysis.MeasureTheory`
- `LRA.Analysis.FunctionalAnalysis`

Reason:

- The external Volume V TOC has standalone Measure Theory and Functional
  Analysis books.
- The Lean routers with those exact public names should therefore live in the
  Volume V core aggregate.

`LRA.VolumeVExamplesFailures` should contain:

- nothing yet

Reason:

- There is no standalone topic-local examples/failures/interop router attached
  directly to the Volume V public roots today.

### Volume VI

`LRA.VolumeVICore` should contain:

- `LRA.AlgebraicStructures`
- `LRA.Algebra.LinearAlgebra`
- `LRA.Order`

Reason:

- The external Volume VI TOC explicitly contains algebraic structures, linear
  algebra, and lattice/order theory.
- These are the matching public Lean routers.

`LRA.VolumeVIExamplesFailures` should contain:

- `LRA.Order.Examples`
- `LRA.Order.FailureModes`
- `LRA.Algebra.LinearAlgebra.VectorSpace.Examples`
- `LRA.Algebra.LinearAlgebra.VectorSpace.Failures`
- `LRA.Algebra.LinearAlgebra.VectorSpace.Interop.FromMathlib`
- `LRA.Algebra.LinearAlgebra.VectorSpace.Interop.ToMathlib`

Reason:

- These are the currently exposed topic-local examples, failures, and interop
  attached to Volume VI parent topics.

### Volume VII

`LRA.VolumeVIICore` should contain:

- `LRA.Logic.Model`
- `LRA.Logic.Proof`

Reason:

- Volume VII is reserved for advanced-logic surfaces that are logic-native by
  subject, not merely because their path contains `Model`.
- `Logic/Model` aligns with model theory, and logic proof-system surfaces align
  with proof theory.
- Non-logic `*/Model` subtrees, such as set, number-system, Euclidean, and
  algebraic-structure model workups, stay with their parent topics instead of
  being pulled into Volume VII by name.

`LRA.VolumeVIIExamplesFailures` should contain:

- `LRA.Logic.Model.Examples`
- `LRA.Logic.Model.Comparison.Examples`
- `LRA.Logic.Model.Propositional.Examples`
- `LRA.Logic.Model.Propositional.ModelsAndTheoriesExamples`

Reason:

- These are topic-local examples attached to the logic-native model-theory
  surfaces assigned to Volume VII.

## Aggregate Chain

The aggregate chain is:

- `LRA.Volume*All` imports `LRA.Volume*Core` and `LRA.Volume*ExamplesFailures`
- `LRA.Volume*` imports `LRA.Volume*All`
- `LRA.ExamplesFailures` imports all `LRA.Volume*ExamplesFailures`
- `LRA.All` imports `LRA.Core`, `LRA.ExamplesFailures`, and the `LRA.Volume*`
  aliases

## Current Gaps

- Volume I geometry is only partially represented by `LRA.EuclideanSpace`; the
  external TOC also includes trigonometry and analytic geometry that do not yet
  have matching public root routers, even though `EuclideanSpace` is assigned
  to Volume II for aggregator purposes.
- Volume III includes series, function sequences, and elementary functions in
  the external TOC, but there is no separate public root router for each of
  those topics today.
- Volume IV includes mathematical spaces, topological spaces, and vector spaces
  in the external TOC, but the current public `LRA` root does not yet expose a
  dedicated Volume IV router for each of those slices.
- Volume V is now represented by a dedicated aggregate family, but most
  measure-theory and functional-analysis detail still sits below shared
  space-side prerequisite routers in Volume IV.
- Volume VII is structurally present as an aggregate family, but the placement
  rule is intentionally narrow: only logic-native model-theory and proof-theory
  surfaces should move there, while all other `*/Model` material remains with
  its parent topic.

## Machine-Readable Summary

```json
{
  "volume_i": {
    "core": [
      "LRA.Logic",
      "LRA.Identity",
      "LRA.Identity.Model",
      "LRA.Identity.Toolkit",
      "LRA.Meta.DeclarationKeywords",
      "LRA.Set",
      "LRA.Relation",
      "LRA.Function",
      "LRA.Order",
      "LRA.SetSystems",
      "LRA.Cardinality",
      "LRA.EuclideanSpace"
    ],
    "examples_failures": [
      "LRA.Order.Examples",
      "LRA.Order.FailureModes",
      "LRA.SetSystems.Examples"
    ]
  },
  "volume_ii": {
    "core": [
      "LRA.Relation",
      "LRA.Operation",
      "LRA.NumberSystems.PeanoSystem",
      "LRA.NumberSystems.NaturalNumbers",
      "LRA.NumberSystems.WholeNumbers",
      "LRA.NumberSystems.IntegerStructure",
      "LRA.NumberSystems.Integers",
      "LRA.NumberSystems.RationalNumbers",
      "LRA.NumberSystems.RealNumbers",
      "LRA.NumberSystems.ComplexNumbers",
      "LRA.NumberSystems.GaussianIntegers",
      "LRA.Arithmetic",
      "LRA.EuclideanSpace"
    ],
    "examples_failures": [
      "LRA.Operation.Examples",
      "LRA.Operation.FailureModes",
      "LRA.NumberSystems.RationalNumbers.Examples"
    ]
  },
  "volume_iii": {
    "core": [
      "LRA.NumberSystems.RealNumbers",
      "LRA.Analysis.RealAnalysis",
      "LRA.Analysis.Bounds",
      "LRA.Analysis.Completeness",
      "LRA.Analysis.StructureOfRealLine",
      "LRA.Analysis.Functions",
      "LRA.Analysis.Sequences",
      "LRA.Analysis.Limits",
      "LRA.Analysis.Continuity",
      "LRA.Analysis.Differentiation",
      "LRA.Analysis.Integration"
    ],
    "examples_failures": [
      "LRA.Analysis.Bounds.Examples",
      "LRA.Analysis.Completeness.Completeness.Failures",
      "LRA.Analysis.Completeness.Density.Failures",
      "LRA.Analysis.Completeness.NestedIntervalProperty.Failures",
      "LRA.Analysis.Limits.IndeterminateForms.Failures",
      "LRA.Analysis.Limits.Order.Failures",
      "LRA.Analysis.Sequences.ExamplesCounterexamples",
      "LRA.Analysis.Sequences.Interop.Mathlib"
    ]
  },
  "volume_iv": {
    "core": [
      "LRA.Analysis.MetricSpace",
      "LRA.Topology",
      "LRA.Analysis.NormedLinearSpace",
      "LRA.Analysis.BanachSpace",
      "LRA.Analysis.InnerProductSpace",
      "LRA.Analysis.HilbertSpace"
    ],
    "examples_failures": [
      "LRA.Analysis.BanachSpace.Examples",
      "LRA.Analysis.BanachSpace.Failures",
      "LRA.Analysis.BanachSpace.Interop.FromMathlib",
      "LRA.Analysis.BanachSpace.Interop.ToMathlib",
      "LRA.Analysis.HilbertSpace.Examples",
      "LRA.Analysis.HilbertSpace.Failures",
      "LRA.Analysis.HilbertSpace.Interop.FromMathlib",
      "LRA.Analysis.HilbertSpace.Interop.ToMathlib",
      "LRA.Analysis.InnerProductSpace.Examples",
      "LRA.Analysis.InnerProductSpace.Failures",
      "LRA.Analysis.InnerProductSpace.Interop.FromMathlib",
      "LRA.Analysis.InnerProductSpace.Interop.ToMathlib",
      "LRA.Analysis.MeasureTheory.MeasurableSpace.Examples",
      "LRA.Analysis.MeasureTheory.MeasurableSpace.Failures",
      "LRA.Analysis.MeasureTheory.MeasurableSpace.Interop.FromMathlib",
      "LRA.Analysis.MeasureTheory.MeasurableSpace.Interop.ToMathlib",
      "LRA.Analysis.MeasureTheory.MeasureSpace.Examples",
      "LRA.Analysis.MeasureTheory.MeasureSpace.Failures",
      "LRA.Analysis.MeasureTheory.MeasureSpace.Interop.FromMathlib",
      "LRA.Analysis.MeasureTheory.MeasureSpace.Interop.ToMathlib",
      "LRA.Analysis.MetricSpace.Examples",
      "LRA.Analysis.MetricSpace.Failures",
      "LRA.Analysis.MetricSpace.Interop",
      "LRA.Analysis.NormedLinearSpace.Examples",
      "LRA.Analysis.NormedLinearSpace.Failures",
      "LRA.Analysis.NormedLinearSpace.Interop.FromMathlib",
      "LRA.Analysis.NormedLinearSpace.Interop.ToMathlib",
      "LRA.Topology.PointSetTopology.TopologicalSpace.Examples",
      "LRA.Topology.PointSetTopology.TopologicalSpace.Failures",
      "LRA.Topology.PointSetTopology.TopologicalSpace.Interop"
    ]
  },
  "volume_v": {
    "core": [
      "LRA.Analysis.MeasureTheory",
      "LRA.Analysis.FunctionalAnalysis"
    ],
    "examples_failures": []
  },
  "volume_vi": {
    "core": [
      "LRA.AlgebraicStructures",
      "LRA.Algebra.LinearAlgebra",
      "LRA.Order"
    ],
    "examples_failures": [
      "LRA.Order.Examples",
      "LRA.Order.FailureModes",
      "LRA.Algebra.LinearAlgebra.VectorSpace.Examples",
      "LRA.Algebra.LinearAlgebra.VectorSpace.Failures",
      "LRA.Algebra.LinearAlgebra.VectorSpace.Interop.FromMathlib",
      "LRA.Algebra.LinearAlgebra.VectorSpace.Interop.ToMathlib"
    ]
  },
  "volume_vii": {
    "core": [
      "LRA.Logic.Model",
      "LRA.Logic.Proof"
    ],
    "examples_failures": [
      "LRA.Logic.Model.Examples",
      "LRA.Logic.Model.Comparison.Examples",
      "LRA.Logic.Model.Propositional.Examples",
      "LRA.Logic.Model.Propositional.ModelsAndTheoriesExamples"
    ]
  }
}
```
