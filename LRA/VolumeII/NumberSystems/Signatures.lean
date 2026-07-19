-- LRA/VolumeII/NumberSystems/Signatures.lean
-- Shared operation signatures for configurable number-system models.

import LRA.Foundation

namespace LRA
namespace VolumeII
namespace NumberSystems

/-!
Volume II label: number-system-signatures
Lean module: LRA.VolumeII.NumberSystems.Signatures
Blueprint label: number-system-signatures
Verification status: checked-data-definitions
-/

/--
**[Definition — Ordered Ring Signature]**

An ordered-ring signature contains only carrier data, operations, distinguished
elements, and order relations. Laws are stored separately.
-/
structure OrderedRingSignature where
  carrier : Foundation.LRACarrier
  zero : carrier
  one : carrier
  addition : Foundation.BinaryOperation carrier
  negation : Foundation.UnaryOperation carrier
  multiplication : Foundation.BinaryOperation carrier
  strict_order : Foundation.Endorelation carrier
  nonstrict_order : Foundation.Endorelation carrier

/--
**[Definition — Ordered Field Signature]**
-/
structure OrderedFieldSignature extends OrderedRingSignature where
  inverse : Foundation.UnaryOperation carrier

namespace OrderedRingSignature

abbrev subtraction
    (signature : OrderedRingSignature) :
    Foundation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.addition first (signature.negation second)

end OrderedRingSignature

end NumberSystems
end VolumeII
end LRA
