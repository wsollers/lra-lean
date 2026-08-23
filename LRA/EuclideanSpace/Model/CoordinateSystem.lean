import LRA.EuclideanSpace.Model.PointOperations

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

universe u

/-!
Coordinate systems (frames): an origin plus a basis, over the same `Rn`
carrier already in use. `Rn`/`EuclideanPoint` itself is left untouched --
it *is* the standard-frame representation. A `Coordinates` value is a
tuple of components paired, in its very type, with the `CoordinateSystem`
they are read off against: `Coordinates` values recorded against
different frames are different types, so combining them (adding,
comparing) without an explicit conversion is a type error, not a silent
bug. That is the sense in which "a coordinate knows what system it came
from" here -- not extra runtime data carried alongside the tuple, but the
frame value baked into the type itself, the same way `Rn`'s dimension `n`
already is. New frames may be given arbitrarily (any origin, any basis);
`Coordinates.toStandard` and `Coordinates.ofStandard_exists` are the
coordinate transform between a frame and the shared standard one, and
`changeOfFrame_exists` composes the two to move between any pair of
frames.
-/

/-- A coordinate system (frame): an origin point plus `n` basis
directions, each itself given as an `Rn` displacement from that origin.
No independence law is required by this structure alone -- a degenerate
frame (e.g. collinear basis directions) is still a `CoordinateSystem`, it
just fails to name every point uniquely. `CoordinateSystem.IsIndependent`
names the nondegenerate case that `Coordinates.ofStandard_exists`
needs. -/
structure CoordinateSystem (real_model : RealModel) (n : ℕ) where
  origin : Rn real_model n
  basis : Fin n → Rn real_model n

/-- The standard frame: origin at `OriginPoint`, basis the standard unit
directions `e_i`. Every `Rn real_model n` point already *is* a
standard-frame coordinate tuple; `StandardFrame` names that fact so it
can be passed wherever a `CoordinateSystem` is expected. -/
def StandardFrame (real_model : RealModel) (n : ℕ) : CoordinateSystem real_model n where
  origin := OriginPoint real_model n
  basis := fun i => { coord := fun j => if j = i then 1 else 0 }

/-- A point's coordinates relative to a chosen `frame`: an `n`-tuple of
components, indexed in its type by the frame they were read off
against. -/
structure Coordinates (real_model : RealModel) (n : ℕ)
    (frame : CoordinateSystem real_model n) where
  component : Fin n → RealCoordinate real_model

/-- Read a `Coordinates` tuple back into the standard frame: the origin,
displaced by each component times its basis direction. This is the one
place frame-relative and standard coordinates meet; every other
operation (`PointAdd`, the transforms, distance, ...) stays defined on
plain `Rn` values and is reached by going through `toStandard` first. -/
def Coordinates.toStandard {real_model : RealModel} {n : ℕ}
    {frame : CoordinateSystem real_model n}
    (c : Coordinates real_model n frame) : Rn real_model n :=
  { coord := fun j =>
      frame.origin.coord j + sumFin (fun i => c.component i * (frame.basis i).coord j) }

/-- A frame's basis is independent when no nontrivial combination of its
basis directions is the zero displacement -- exactly the nondegeneracy
`Coordinates.ofStandard_exists` needs. -/
def CoordinateSystem.IsIndependent {real_model : RealModel} {n : ℕ}
    (frame : CoordinateSystem real_model n) : Prop :=
  ∀ coeffs : Fin n → RealCoordinate real_model,
    (∀ j : Fin n, sumFin (fun i => coeffs i * (frame.basis i).coord j) = 0) →
    ∀ i : Fin n, coeffs i = 0

/-- Every standard-frame point has coordinates relative to any
independent frame, and `toStandard` recovers it. This is the existence
half of the frame-to-frame coordinate transform: an independent frame's
basis, together with its origin, names every point of the space. -/
theorem Coordinates.ofStandard_exists {real_model : RealModel} {n : ℕ}
    (frame : CoordinateSystem real_model n) (hframe : frame.IsIndependent)
    (p : Rn real_model n) :
    ∃ c : Coordinates real_model n frame, c.toStandard = p := by
  sorry

/-- Reading a point's `frameA`-relative coordinates in a second,
independent `frameB` instead: pass through the shared standard frame
both are ultimately measured against. This is the "coordinate
transforms" a newly-established frame needs, stated for any two
frames at once rather than one conversion per pair. -/
theorem changeOfFrame_exists {real_model : RealModel} {n : ℕ}
    (frameA frameB : CoordinateSystem real_model n) (hB : frameB.IsIndependent)
    (c : Coordinates real_model n frameA) :
    ∃ c' : Coordinates real_model n frameB, c'.toStandard = c.toStandard :=
  Coordinates.ofStandard_exists frameB hB c.toStandard

end LRA.EuclideanSpace
