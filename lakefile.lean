import Lake
open Lake DSL

package LRA where

lean_lib LRAVolumeI where
  roots := #[`LRA.VolumeI]

-- Volume II: Project Landau — NO Mathlib. Everything proved from axioms.
lean_lib LRAVolumeII where
  roots := #[`LRA.VolumeII]

-- Volume III and beyond: Mathlib permitted (add require when needed)
-- lean_lib LRAVolumeIII where
--   roots := #[`LRA.VolumeIII]
