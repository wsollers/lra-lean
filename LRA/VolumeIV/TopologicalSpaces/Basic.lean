-- LRA/VolumeIV/TopologicalSpaces/Basic.lean
-- Topological spaces over the active set implementation.

import LRA.VolumeIV.MathematicalSpaces

namespace LRA
namespace VolumeIV
namespace TopologicalSpaces

/-!
Volume IV label: topological-spaces-basic
Lean module: LRA.VolumeIV.TopologicalSpaces.Basic
Verification status: checked definitions module

This is the first structural shape for topology in Volume IV: a space is a set
of points, and the topology is a set of subsets of the point carrier. Topology
axioms are intentionally not bundled yet; this module establishes the interface
that later axiom/law modules can refine.
-/

structure TopologicalSpace where
  pointCarrier : Foundation.LRACarrier
  points : MathematicalSpaces.MathematicalSpace pointCarrier
  openSets : Foundation.Sets.Active.Set (Foundation.Sets.Active.Set pointCarrier)

namespace TopologicalSpace

abbrev OpenSet (space : TopologicalSpace) : Foundation.LRACarrier :=
  Foundation.Sets.Active.Set space.pointCarrier

def isOpen (space : TopologicalSpace) (subset : OpenSet space) : Prop :=
  Foundation.Sets.Active.member subset space.openSets

def containsPoint (space : TopologicalSpace) (point : space.pointCarrier) : Prop :=
  MathematicalSpaces.MathematicalSpace.contains space.points point

def discrete (pointCarrier : Foundation.LRACarrier) : TopologicalSpace where
  pointCarrier := pointCarrier
  points := Foundation.Sets.Active.universal pointCarrier
  openSets := Foundation.Sets.Active.universal (Foundation.Sets.Active.Set pointCarrier)

def indiscrete (pointCarrier : Foundation.LRACarrier) : TopologicalSpace where
  pointCarrier := pointCarrier
  points := Foundation.Sets.Active.universal pointCarrier
  openSets :=
    Foundation.Sets.Active.union
      (Foundation.Sets.Active.singleton (Foundation.Sets.Active.empty pointCarrier))
      (Foundation.Sets.Active.singleton (Foundation.Sets.Active.universal pointCarrier))

namespace Tests

example : (discrete Nat).isOpen (Foundation.Sets.Active.singleton 3) := by
  trivial

example : (indiscrete Nat).isOpen (Foundation.Sets.Active.empty Nat) := by
  left
  rfl

example : (indiscrete Nat).isOpen (Foundation.Sets.Active.universal Nat) := by
  right
  rfl

end Tests

end TopologicalSpace

end TopologicalSpaces
end VolumeIV
end LRA
