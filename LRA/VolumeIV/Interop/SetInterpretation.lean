-- LRA/VolumeIV/Interop/SetInterpretation.lean
-- Compatibility tests between active LRA sets and Mathlib sets.

import Mathlib
import LRA.VolumeIV.TopologicalSpaces

namespace LRA
namespace VolumeIV
namespace Interop
namespace SetInterpretation

/-!
Volume IV label: set-interpretation-tests
Lean module: LRA.VolumeIV.Interop.SetInterpretation
Verification status: checked compatibility tests

These examples pin down the current active set implementation as compatible
with Mathlib's `Set α` representation. They are deliberately small shape tests:
membership, transport in both directions, a generic mathematical space, and the
first topological-space structure.
-/

abbrev toMathlibSet {α : Foundation.LRACarrier}
    (subset : Foundation.Sets.Active.Set α) : Set α :=
  fun element => Foundation.Sets.Active.member element subset

abbrev ofMathlibSet {α : Foundation.LRACarrier}
    (subset : Set α) : Foundation.Sets.Active.Set α :=
  fun element => element ∈ subset

example {α : Foundation.LRACarrier} (subset : Foundation.Sets.Active.Set α) (element : α) :
    element ∈ toMathlibSet subset ↔ Foundation.Sets.Active.member element subset :=
  Iff.rfl

example {α : Foundation.LRACarrier} (subset : Set α) (element : α) :
    Foundation.Sets.Active.member element (ofMathlibSet subset) ↔ element ∈ subset :=
  Iff.rfl

example {α : Foundation.LRACarrier} (subset : Foundation.Sets.Active.Set α) :
    ofMathlibSet (toMathlibSet subset) = subset := by
  exact Foundation.Sets.Active.extensionality (fun element => Iff.rfl)

example {α : Foundation.LRACarrier} (subset : Set α) :
    toMathlibSet (ofMathlibSet subset) = subset := by
  rfl

def evenNaturalNumbers : MathematicalSpaces.MathematicalSpace Nat :=
  ofMathlibSet {n : Nat | n % 2 = 0}

example : MathematicalSpaces.MathematicalSpace.contains evenNaturalNumbers 4 := by
  rfl

example : ¬ MathematicalSpaces.MathematicalSpace.contains evenNaturalNumbers 5 := by
  decide

def natDiscreteTopology : TopologicalSpaces.TopologicalSpace :=
  TopologicalSpaces.TopologicalSpace.discrete Nat

example : natDiscreteTopology.isOpen (ofMathlibSet {n : Nat | n < 3}) := by
  trivial

example :
    toMathlibSet (ofMathlibSet {n : Nat | n < 3}) = {n : Nat | n < 3} := by
  rfl

end SetInterpretation
end Interop
end VolumeIV
end LRA
