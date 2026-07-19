-- LRA/VolumeII/Integers/Interface.lean
-- Common algebraic interfaces for integer implementations.

import LRA.Foundation

namespace LRA
namespace VolumeII
namespace Integers

/-!
Volume II label: integers-interface
Lean module: LRA.VolumeII.Integers.Interface
Verification status: checked interface module

The generic algebraic structures are carrier-level operation bundles. Integer
implementations extend them with successor and predecessor so construction
variants can attach law bundles as mixins at the level they have proved.
-/

/-- Carrier with additive group operations. -/
structure AdditiveStructure where
  carrier : Foundation.LRACarrier
  zeroInstance : Zero carrier
  addInstance : Add carrier
  negInstance : Neg carrier

/-- Carrier with multiplicative operations. -/
structure MultiplicativeStructure where
  carrier : Foundation.LRACarrier
  zeroInstance : Zero carrier
  oneInstance : One carrier
  mulInstance : Mul carrier

/-- Carrier with strict and non-strict order relations. -/
structure OrderedStructure where
  carrier : Foundation.LRACarrier
  ltInstance : LT carrier
  leInstance : LE carrier

/-- Carrier with ring operations. -/
structure RingStructure extends AdditiveStructure, MultiplicativeStructure where

/-- Carrier with ordered-ring operations. -/
structure OrderedRingStructure extends RingStructure, OrderedStructure where

/-- Public structure for integer implementations. -/
structure IntegerStructure extends OrderedRingStructure where
  succ : carrier → carrier
  pred : carrier → carrier

attribute [instance] AdditiveStructure.zeroInstance
attribute [instance] AdditiveStructure.addInstance
attribute [instance] AdditiveStructure.negInstance
attribute [instance] MultiplicativeStructure.zeroInstance
attribute [instance] MultiplicativeStructure.oneInstance
attribute [instance] MultiplicativeStructure.mulInstance
attribute [instance] OrderedStructure.ltInstance
attribute [instance] OrderedStructure.leInstance

namespace AdditiveStructure

abbrev zero (structure_data : AdditiveStructure) : structure_data.carrier := 0
abbrev add (structure_data : AdditiveStructure) :
    Foundation.BinaryOperation structure_data.carrier := (· + ·)
abbrev neg (structure_data : AdditiveStructure) :
    Foundation.UnaryOperation structure_data.carrier := Neg.neg

end AdditiveStructure

namespace MultiplicativeStructure

abbrev zero (structure_data : MultiplicativeStructure) : structure_data.carrier := 0
abbrev one (structure_data : MultiplicativeStructure) : structure_data.carrier := 1
abbrev mul (structure_data : MultiplicativeStructure) :
    Foundation.BinaryOperation structure_data.carrier := (· * ·)

end MultiplicativeStructure

namespace OrderedStructure

abbrev lt (structure_data : OrderedStructure) :
    Foundation.Endorelation structure_data.carrier := (· < ·)
abbrev le (structure_data : OrderedStructure) :
    Foundation.Endorelation structure_data.carrier := (· ≤ ·)

end OrderedStructure

namespace RingStructure

abbrev zero (structure_data : RingStructure) : structure_data.carrier :=
  letI := structure_data.zeroInstance
  0
abbrev one (structure_data : RingStructure) : structure_data.carrier :=
  letI := structure_data.oneInstance
  1
abbrev add (structure_data : RingStructure) :
    Foundation.BinaryOperation structure_data.carrier :=
  letI := structure_data.addInstance
  (· + ·)
abbrev neg (structure_data : RingStructure) :
    Foundation.UnaryOperation structure_data.carrier :=
  letI := structure_data.negInstance
  Neg.neg
abbrev mul (structure_data : RingStructure) :
    Foundation.BinaryOperation structure_data.carrier :=
  letI := structure_data.mulInstance
  (· * ·)

end RingStructure

namespace OrderedRingStructure

abbrev zero (structure_data : OrderedRingStructure) : structure_data.carrier :=
  letI := structure_data.zeroInstance
  0
abbrev one (structure_data : OrderedRingStructure) : structure_data.carrier :=
  letI := structure_data.oneInstance
  1
abbrev add (structure_data : OrderedRingStructure) :
    Foundation.BinaryOperation structure_data.carrier :=
  letI := structure_data.addInstance
  (· + ·)
abbrev neg (structure_data : OrderedRingStructure) :
    Foundation.UnaryOperation structure_data.carrier :=
  letI := structure_data.negInstance
  Neg.neg
abbrev mul (structure_data : OrderedRingStructure) :
    Foundation.BinaryOperation structure_data.carrier :=
  letI := structure_data.mulInstance
  (· * ·)
abbrev lt (structure_data : OrderedRingStructure) :
    Foundation.Endorelation structure_data.carrier :=
  letI := structure_data.ltInstance
  (· < ·)
abbrev le (structure_data : OrderedRingStructure) :
    Foundation.Endorelation structure_data.carrier :=
  letI := structure_data.leInstance
  (· ≤ ·)

end OrderedRingStructure

namespace IntegerStructure

abbrev zero (integer_structure : IntegerStructure) : integer_structure.carrier :=
  letI := integer_structure.zeroInstance
  0
abbrev one (integer_structure : IntegerStructure) : integer_structure.carrier :=
  letI := integer_structure.oneInstance
  1
abbrev add (integer_structure : IntegerStructure) :
    Foundation.BinaryOperation integer_structure.carrier :=
  letI := integer_structure.addInstance
  (· + ·)
abbrev neg (integer_structure : IntegerStructure) :
    Foundation.UnaryOperation integer_structure.carrier :=
  letI := integer_structure.negInstance
  Neg.neg
abbrev mul (integer_structure : IntegerStructure) :
    Foundation.BinaryOperation integer_structure.carrier :=
  letI := integer_structure.mulInstance
  (· * ·)
abbrev lt (integer_structure : IntegerStructure) :
    Foundation.Endorelation integer_structure.carrier :=
  letI := integer_structure.ltInstance
  (· < ·)
abbrev le (integer_structure : IntegerStructure) :
    Foundation.Endorelation integer_structure.carrier :=
  letI := integer_structure.leInstance
  (· ≤ ·)

end IntegerStructure

end Integers
end VolumeII
end LRA
