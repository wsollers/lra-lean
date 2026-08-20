import LRA.EuclideanSpace.Definition

/-!
Euclidean space: the geometric layer between `LRA.NumberSystems` and
`LRA.Analysis`.

## Scope (agreed, not yet built out)

Constructs Euclidean space FROM the number systems -- starting at ℝ
(`RealModel`), then ℝ², then ℝ³ -- as its own geometric development:
points, coordinates, lines, planes, surfaces, intervals. The starting
point is analytic geometry (coordinates), but the vocabulary built on
top of them is meant to read like Hilbert's geometry -- points and
lines as genuine geometric primitives with their own definitions, not
names re-exported from an abstraction built for other purposes.

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

No file structure, namespace, or content below `Definition.lean` is
decided yet. This router and its one core-notion file exist to hold the
subject's place and record the agreed scope; content starts once the
first concept (coordinates in ℝ, ℝ², ℝ³) is directed.
-/
