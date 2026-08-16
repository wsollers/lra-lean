-- LRA/VolumeII/Switches/NumberSystems.lean
-- Active Mathlib-backed number-system carriers for Volume II scratch modules.

import Mathlib.Data.Rat.Defs
import Mathlib.Algebra.Group.Even

/-!
This switch module is the only Volume II location that imports the Mathlib
number-system backends directly. Downstream arithmetic files import this module
and name the active carriers through ordinary Lean aliases.
-/

