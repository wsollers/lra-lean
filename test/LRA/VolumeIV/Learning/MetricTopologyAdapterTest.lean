import LRA.VolumeIV.MetricSpaces.Balls.Basic
import LRA.VolumeIV.MetricSpaces.Compatibility
import LRA.VolumeIV.TopologicalSpaces.Compatibility
import LRA.VolumeIV.TopologicalSpaces.Foundations

namespace LRA.Tests.VolumeIV.Learning

universe u

open LRA.Analysis.MetricSpaces
open LRA.Topology

/-- Canonical Mathlib-facing topology proof. -/
theorem mathlib_open_inter
    {X : Type u}
    [_root_.TopologicalSpace X]
    {U V : Set X}
    (openU : _root_.IsOpen U)
    (openV : _root_.IsOpen V) :
    _root_.IsOpen (U ∩ V) := by
  exact openU.inter openV

/-- Canonical Mathlib-facing metric proof, reusing the production theorem. -/
theorem mathlib_small_ball_inside_ball
    {X : Type u}
    [MetricSpace X]
    {x y : X}
    {r : Real}
    (pointInBall : y ∈ Metric.ball x r) :
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r := by
  exact LRA.Analysis.MetricSpaces.ball_subset_ball_of_mem pointInBall

section TextbookTopology

variable (space : TopologicalSpaceDefinition.{u})

/-- The canonical Mathlib-facing topology proof works unchanged over the carrier
of a packaged textbook topological space. -/
example
    {U V : Set space.Carrier}
    (openU : _root_.IsOpen U)
    (openV : _root_.IsOpen V) :
    _root_.IsOpen (U ∩ V) := by
  exact mathlib_open_inter openU openV

/-- The direct Mathlib proof body also works unchanged against the packaged
textbook topology. -/
example
    {U V : Set space.Carrier}
    (openU : _root_.IsOpen U)
    (openV : _root_.IsOpen V) :
    _root_.IsOpen (U ∩ V) := by
  exact openU.inter openV

end TextbookTopology

section TextbookMetric

variable (space : MetricSpaceDefinition.{u})

/-- The canonical Mathlib-facing metric proof works unchanged over the carrier
of a packaged textbook metric space. -/
example
    {x y : space.Carrier}
    {r : Real}
    (pointInBall : y ∈ Metric.ball x r) :
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r := by
  exact mathlib_small_ball_inside_ball pointInBall

/-- A Mathlib lemma sees the textbook distance through the packaged textbook
metric. -/
example
    (x y : space.Carrier) :
    dist x y = dist y x := by
  exact dist_comm x y

end TextbookMetric

end LRA.Tests.VolumeIV.Learning
