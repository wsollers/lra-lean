import Lake
open Lake DSL

package LRA where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.32.1"

@[default_target]
lean_lib LRA where
  roots := #[`LRA]

-- Total coverage. Every module under `LRA/` is built by this target, including
-- the opt-in layers no core router may import: `Examples`, `FailureModes`,
-- `Interop`, and the per-subject toolkits. Quarantine (§6) governs imports, not
-- targets, so those modules are unreachable from `LRA` by design and still have
-- to compile. A glob rather than a root list, so a module added tomorrow cannot
-- slip out of coverage the way `LRA.Morphism` did.
lean_lib LRAAll where
  globs := #[.andSubmodules `LRA]

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
    `LRA.Set.Interface.ModelTheory,
    `LRA.SetSystems,
    `LRA.Relation,
    `LRA.Function,
    `LRA.Function.SetTheoretic,
    `LRA.Morphism,
    `LRA.Cardinality,
    `LRA.UniversalAlgebra,
    `LRA.AlgebraicStructures,
    `LRA.Operation,
    `LRA.Order
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

lean_lib LRAVolumeVII where
  roots := #[`LRA.VolumeVII]

lean_lib LRAExamples where
  roots := #[`LRA.Examples]

lean_lib LRAFailures where
  roots := #[`LRA.Failures]

-- Build-gated smoke and regression checks. Production volume roots must not
-- import these modules.
lean_lib LRATests where
  srcDir := "test"
  roots := #[
    `LRA.VolumeI.Set.CollectionAlgebraAdaptersTest,
    `LRA.SemanticImportsSmoke,
    `LRA.Morphism.FailureModesTest,
    `LRA.Analysis.Bounds.BoundsTests,
    `LRA.VolumeIV.Learning.MetricTopologyAdapterTest,
    `LRA.VolumeIV.TopologicalSpaces.TopologyCompatibilityTest
  ]
