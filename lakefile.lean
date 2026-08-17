import Lake
open Lake DSL

package LRA where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.32.1"

@[default_target]
lean_lib LRA where
  roots := #[`LRA]

lean_lib LRALogic where
  roots := #[`LRA.Logic]

lean_lib LRAIdentity where
  roots := #[`LRA.Identity]

lean_lib LRASetCore where
  roots := #[`LRA.Set]

lean_lib LRAStandardizedFoundations where
  roots := #[
    `LRA.Set.PredicateSet,
    `LRA.Set.ZFCSet,
    `LRA.Set.ZFC,
    `LRA.Set.Model,
    `LRA.SetSystems,
    `LRA.Relation
  ]

lean_lib LRAVolumeI where
  roots := #[`LRA.VolumeI]

-- Volume II: construction modules remain project-owned; active switches and
-- selected proof-working sections may use Mathlib-backed carriers.
lean_lib LRAVolumeII where
  roots := #[`LRA.VolumeII]

-- Volume III and beyond: Mathlib permitted.
lean_lib LRAVolumeIII where
  roots := #[`LRA.VolumeIII]

lean_lib LRAVolumeIV where
  roots := #[`LRA.VolumeIV]

lean_lib LRAVolumeVI where
  roots := #[`LRA.VolumeVI]

lean_lib LRAVolumeVII where
  roots := #[`LRA.VolumeVII]

-- Build-gated smoke and regression checks. Production volume roots must not
-- import these modules.
lean_lib LRATests where
  srcDir := "test"
  roots := #[
    `LRA.VolumeI.Set.CollectionAlgebraAdaptersTest,
    `LRA.SemanticImportsSmoke,
    `LRA.VolumeIII.Analysis.Bounding.BoundsTests,
    `LRA.VolumeIV.Learning.MetricTopologyAdapterTest,
    `LRA.VolumeIV.MetricSpaces.BallSubsetCustomMetricTest,
    `LRA.VolumeIV.TopologicalSpaces.TopologyCompatibilityTest
  ]
