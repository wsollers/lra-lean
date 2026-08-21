import LRA.EuclideanSpace.Interface
import LRA.EuclideanSpace.Tarski
import LRA.EuclideanSpace.MathlibPoint
import LRA.EuclideanSpace.RealLine

/-!
Euclidean space: the geometric layer between `LRA.NumberSystems` and
`LRA.Analysis`.

## Scope

Constructs Euclidean space FROM the number systems -- starting at ℝ
(`RealModel`), then ℝ², then ℝ³, then general ℝⁿ -- as its own geometric
development: points, coordinates, lines, planes, surfaces, intervals.
The starting point is analytic geometry (coordinates), but the
vocabulary built on top of them is meant to read like Hilbert's
geometry -- points and lines as genuine geometric primitives with their
own definitions, not names re-exported from an abstraction built for
other purposes.

Explicitly **not** the starting point:

- **Not a normed space.** No norm axioms assumed or proved first;
  distance in ℝⁿ is built directly from coordinates and ℝ's own
  arithmetic, the way analytic geometry actually introduces it.
- **Not a vector space.** `LRA.LinearAlgebra` generalizes *from* this
  space later; this space does not inherit its structure from
  `LinearAlgebra` first.
- **Not a metric space per se.** `LRA.Analysis`'s `MetricSpaces` group
  generalizes *from* this space too, on the far side of the gateway
  this subject exists to open.

## Position in the chain

`LRA.Set` / `LRA.Order` (theory) → `LRA.NumberSystems` (consumes
theory, produces the number systems, ending at ℝ) → `LRA.EuclideanSpace`
(consumes ℝ, produces the geometric arena: coordinates, points,
intervals, lines, planes, surfaces) → `LRA.Analysis` /
`LRA.LinearAlgebra` / `LRA.Topology` (generalize from the concrete
arena to normed/vector/metric/topological abstractions).

Intervals live here, not in `LRA.NumberSystems` or `LRA.Order`: an
interval is the one-dimensional case of a Euclidean region, a *consumer*
of `Order`'s generic bounds/lattice theory applied once actual numbers
exist, not a peer of that theory itself.

Positioned last in `LRA.VolumeII` (§7.7's number-system chain: naturals
→ ... → complex → Gaussian integers), immediately before Volume III's
`LRA.Analysis` content — Euclidean space is the intended gateway between
the two, per the design discussion recorded in
`LRA/VolumeII/Arithmetic/DesignDoc.md`.

## Structure

Declarations across all concepts share the flat `LRA.EuclideanSpace`
namespace (subfolders do not add a namespace layer), so names are
dimension-qualified where a bare name would otherwise collide.

- `Interface`: the generic, backend-agnostic characterization of
  Euclidean space -- law-classes over an arbitrary `Point` type plus
  `between`/`congruent` relations, mirroring `LRA.Set.Interface`'s
  `MembershipLaws`. Any concrete realization (`Tarski`, a future
  Mathlib-backed one) is checked against this, not against each other.
- `Tarski`: the in-house axiomatic realization -- `TarskiPoint`,
  `TarskiBetween`, `TarskiCongruent` as primitives, Tarski's eleven
  axioms about them, and a `Laws.lean` proving they satisfy `Interface`.
  Mirrors `LRA.Set.ZFC`/`ZFCSet`.
- `MathlibPoint`: the pragmatic realization built directly from
  Mathlib's `EuclideanSpace ℝ (Fin n)`, with its own `Laws.lean` proving
  it too satisfies `Interface`. Mirrors `LRA.Set.PredicateSet`.
- `RealLine` (Lecture 1): the real continuum, distance, intervals and
  rays, translation/dilation. Points are `ℝ` itself.

Still to build, pending the generic point-type design (in progress):
`CartesianPlane`, `Space3D`, `NSpace`.
-/
