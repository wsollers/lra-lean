import LRA.EuclideanSpace.Model.EuclideanN
import LRA.EuclideanSpace.Model.PointOperations
import LRA.EuclideanSpace.Model.CoordinateSystem
import LRA.EuclideanSpace.Model.Transforms
import LRA.EuclideanSpace.Model.Distance
import LRA.EuclideanSpace.Model.RealLine
import LRA.EuclideanSpace.Model.CartesianPlane
import LRA.EuclideanSpace.Model.Euclidean3Space
import LRA.EuclideanSpace.Model.Euclidean4Space

/-!
Aggregate import for the model-first Euclidean-space development.

The central object is the ordered-tuple carrier `Rn real_model n`, with
named low-dimensional specializations:

* `R1` -- the model real line
* `R2` -- the Cartesian plane
* `R3` -- three-dimensional Euclidean space
* `R4` -- a first higher-dimensional extension

Each file expands the visible school-geometry vocabulary of the same
underlying coordinate model rather than redefining a different carrier.

Dimension-agnostic vocabulary over that same carrier -- independent of
which named specialization is in view -- lives alongside it:

* `PointOperations` -- the origin, coordinatewise point addition and
  subtraction, scaling, and the dot product.
* `CoordinateSystem` -- frames (origin + basis), the standard frame, and
  frame-relative coordinates with the standard-frame coordinate
  transform.
* `Transforms` -- translation, dilation, reflection (through a point,
  across a coordinate hyperplane, across a general hyperplane), and
  elementary (Givens) rotation.
* `Distance` -- actual (unsquared) length, via the real model's `Sqrt`.
-/
