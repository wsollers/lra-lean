import Lake
open Lake DSL

package LRA where

lean_lib LRAVolumeI where
  roots := #[`LRA.VolumeI]

-- Volume II: Project Landau — NO Mathlib. Everything proved from axioms.
lean_lib LRAVolumeII where
  roots := #[`LRA.VolumeII]

-- Volumes III–VIII: scaffolded with a placeholder theorem each so the build
-- gates every volume (no volume can be silently forgotten). Mathlib is
-- permitted from Volume III onward (add a `require` + import when needed).
-- When adding a volume: add its lean_lib here AND to the CI build list.
lean_lib LRAVolumeIII where
  roots := #[`LRA.VolumeIII]

lean_lib LRAVolumeIV where
  roots := #[`LRA.VolumeIV]

lean_lib LRAVolumeV where
  roots := #[`LRA.VolumeV]

lean_lib LRAVolumeVI where
  roots := #[`LRA.VolumeVI]

lean_lib LRAVolumeVII where
  roots := #[`LRA.VolumeVII]

lean_lib LRAVolumeVIII where
  roots := #[`LRA.VolumeVIII]
