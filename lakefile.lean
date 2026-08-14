import Lake
open Lake DSL

package LRA where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.32.1"

lean_lib LRA where
  roots := #[`LRA]

-- Isolated design experiments that can be compiled without importing them
-- into the production volume aggregate.
lean_lib LRAPilot where
  roots := #[`LRA.Pilot, `LRA.Pilot.Supremum.ExtractionManifest]

/-- Extract the Ordering and Bounds pilot metadata and render its local explorer. -/
script lraBoundsExplorer (arguments) do
  Lake.env "lean" (#["--run", "LRA/Pilot/ExtractMetadata.lean"] ++ arguments)

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
    `LRA.VolumeIII.Analysis.Bounding.BoundsTests,
    `LRA.VolumeIV.Learning.MetricTopologyAdapterTest,
    `LRA.VolumeIV.MetricSpaces.BallSubsetCustomMetricTest,
    `LRA.VolumeIV.TopologicalSpaces.TopologyCompatibilityTest
  ]
