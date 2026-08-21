import LRA.EuclideanSpace.Model.EuclideanN
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
-/
