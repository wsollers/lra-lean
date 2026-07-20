-- LRA/VolumeIII/Reals/Interface.lean
-- Common interface for real implementations.

import LRA.Foundation

namespace LRA
namespace VolumeIII
namespace Reals

/-!
Lean module: LRA.VolumeIII.Reals.Interface
Verification status: checked interface module

`LRARealImplementation` is the common public shape for switchable real-number
implementations used by Volume III and later. It keeps the carrier and the
operations/order needed by metric-space statements.
-/

structure LRARealImplementation where
  carrier : Foundation.LRACarrier
  zeroInstance : Zero carrier
  oneInstance : One carrier
  addInstance : Add carrier
  leInstance : LE carrier

attribute [instance] LRARealImplementation.zeroInstance
attribute [instance] LRARealImplementation.oneInstance
attribute [instance] LRARealImplementation.addInstance
attribute [instance] LRARealImplementation.leInstance

namespace LRARealImplementation

abbrev zero (R : LRARealImplementation) : R.carrier := 0
abbrev one (R : LRARealImplementation) : R.carrier := 1
abbrev add (R : LRARealImplementation) : Foundation.BinaryOperation R.carrier := (· + ·)
abbrev le (R : LRARealImplementation) : Foundation.Endorelation R.carrier := (· ≤ ·)

end LRARealImplementation

end Reals
end VolumeIII
end LRA
