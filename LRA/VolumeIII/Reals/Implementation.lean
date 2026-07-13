-- LRA/VolumeIII/Reals/Implementation.lean
-- Active real implementation switch.

import LRA.VolumeIII.Reals.Interface
import LRA.VolumeIII.Reals.LraReal

namespace LRA
namespace VolumeIII
namespace Reals

/-!
Lean module: LRA.VolumeIII.Reals.Implementation
Verification status: checked switch module

This module is the shared implementation switch for real-number work in Volume
III and later. The active carrier is currently the project `LraReal` cut type.
-/

namespace Active

abbrev RealImpl : LRARealImplementation where
  carrier := LraReals.LraReal
  zeroInstance := inferInstance
  oneInstance := inferInstance
  addInstance := inferInstance
  leInstance := inferInstance

abbrev Real : Foundation.LRACarrier :=
  RealImpl.carrier

abbrev zero : Real := 0
abbrev one : Real := 1
abbrev add : Foundation.BinaryOperation Real := (· + ·)
abbrev le : Foundation.Endorelation Real := (· ≤ ·)

end Active

end Reals
end VolumeIII
end LRA
