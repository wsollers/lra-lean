import Lake
open Lake DSL

package LRA where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.20.0"

lean_lib LRAFoundation where
  roots := #[`LRA.Foundation]

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

lean_lib LRAVolumeVII where
  roots := #[`LRA.VolumeVII]
