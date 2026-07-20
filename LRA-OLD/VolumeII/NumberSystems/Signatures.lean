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
  zero : Foundation.NullaryOperation carrier
  one : Foundation.NullaryOperation carrier
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

namespace OrderedFieldSignature

def inverse_domain
    (signature : OrderedFieldSignature)
    (value : signature.carrier) : Prop :=
  value ≠ signature.zero

def partial_inverse
    (signature : OrderedFieldSignature) :
    Foundation.PartialUnaryOperation signature.carrier where
  domain := inverse_domain signature
  apply := fun value _ => signature.inverse value

def partial_division
    (signature : OrderedFieldSignature) :
    Foundation.PartialBinaryOperation signature.carrier where
  domain := fun _ divisor => divisor ≠ signature.zero
  apply := fun dividend divisor _ =>
    signature.multiplication dividend (signature.inverse divisor)

end OrderedFieldSignature

end NumberSystems
end VolumeII
end LRA
