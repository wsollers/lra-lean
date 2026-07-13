-- LRA/VolumeIV/MetricSpaces/Basic.lean
-- Metric spaces over switchable sets, functions, and reals.

import LRA.Foundation.Functions.Implementation
import LRA.Foundation.Products
import LRA.VolumeIII.Reals.Implementation
import LRA.VolumeIV.MathematicalSpaces

namespace LRA
namespace VolumeIV
namespace MetricSpaces

/-!
Volume IV label: metric-spaces-basic
Lean module: LRA.VolumeIV.MetricSpaces.Basic
Verification status: checked definitions module

A metric-space data object has:

* a point carrier,
* a selected set of points, through `Foundation.Sets.Active`,
* a distance function, through `Foundation.Functions.Active`,
* values in the active real implementation, through `VolumeIII.Reals.Active`.

The metric laws are a separate bundle so the representation switches can be
validated independently from the later proof obligations.
-/

structure MetricSpace where
  pointCarrier : Foundation.LRACarrier
  points : MathematicalSpaces.MathematicalSpace pointCarrier
  distance :
    Foundation.Functions.Active.Function
      (Foundation.Product pointCarrier pointCarrier)
      VolumeIII.Reals.Active.Real

namespace MetricSpace

abbrev Real : Foundation.LRACarrier :=
  VolumeIII.Reals.Active.Real

def distanceBetween (space : MetricSpace)
    (left right : space.pointCarrier) : Real :=
  Foundation.Functions.Active.apply space.distance (left, right)

def containsPoint (space : MetricSpace) (point : space.pointCarrier) : Prop :=
  MathematicalSpaces.MathematicalSpace.contains space.points point

structure Laws (space : MetricSpace) : Prop where
  nonnegative :
    ∀ left right,
      containsPoint space left →
      containsPoint space right →
        (0 : Real) ≤ distanceBetween space left right
  identityOfIndiscernibles :
    ∀ left right,
      containsPoint space left →
      containsPoint space right →
        distanceBetween space left right = 0 ↔ left = right
  symmetric :
    ∀ left right,
      containsPoint space left →
      containsPoint space right →
        distanceBetween space left right = distanceBetween space right left
  triangle :
    ∀ first second third,
      containsPoint space first →
      containsPoint space second →
      containsPoint space third →
        distanceBetween space first third ≤
          distanceBetween space first second + distanceBetween space second third

def fromDistanceFunction
    (pointCarrier : Foundation.LRACarrier)
    (points : MathematicalSpaces.MathematicalSpace pointCarrier)
    (distance :
      Foundation.Product pointCarrier pointCarrier → VolumeIII.Reals.Active.Real) :
    MetricSpace where
  pointCarrier := pointCarrier
  points := points
  distance := Foundation.Functions.Active.ofNative distance

def discreteShape (pointCarrier : Foundation.LRACarrier) : MetricSpace :=
  fromDistanceFunction pointCarrier
    (MathematicalSpaces.MathematicalSpace.universal pointCarrier)
    (fun pair => if pair.1 = pair.2 then 0 else 1)

namespace Tests

example : (discreteShape Nat).containsPoint 5 := by
  trivial

example : (discreteShape Nat).distanceBetween 4 4 = 0 := by
  rfl

example : (discreteShape Nat).distanceBetween 4 5 = 1 := by
  rfl

end Tests

end MetricSpace

end MetricSpaces
end VolumeIV
end LRA
