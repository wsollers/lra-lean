-- LRA/VolumeIV/Interop/MetricInterpretation.lean
-- Compatibility tests for switchable metric-space components.

import Mathlib
import LRA.VolumeIV.MetricSpaces

namespace LRA
namespace VolumeIV
namespace Interop
namespace MetricInterpretation

/-!
Volume IV label: metric-interpretation-tests
Lean module: LRA.VolumeIV.Interop.MetricInterpretation
Verification status: checked compatibility tests

These examples pin down the metric-space data layer as using the active set,
function, and real switches. A separate Mathlib-valued function check verifies
that the active function switch still interoperates with ordinary Mathlib
codomains.
-/

def activeDiscreteNatMetric : MetricSpaces.MetricSpace :=
  MetricSpaces.MetricSpace.discreteShape Nat

example : activeDiscreteNatMetric.containsPoint 0 := by
  trivial

example : activeDiscreteNatMetric.distanceBetween 7 7 = 0 := by
  rfl

def mathlibRealDistance :
    Foundation.Functions.Active.Function (Foundation.Product Nat Nat) ℝ :=
  Foundation.Functions.Active.ofNative
    (fun pair => if pair.1 = pair.2 then (0 : ℝ) else 1)

example :
    Foundation.Functions.Active.apply mathlibRealDistance (3, 3) = (0 : ℝ) := by
  rfl

example :
    Foundation.Functions.Active.apply mathlibRealDistance (3, 4) = (1 : ℝ) := by
  rfl

end MetricInterpretation
end Interop
end VolumeIV
end LRA
