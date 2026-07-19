-- LRA/VolumeII/Integers/Implementation.lean
-- Active integer implementation switch.

import LRA.VolumeII.Integers.Polish
import LRA.VolumeII.Integers.Tao
import LRA.VolumeII.Integers.Mendelson
import LRA.VolumeII.Integers.Pfefer

namespace LRA
namespace VolumeII
namespace Integers

/-!
Volume II label: integers-active-implementation
Lean module: LRA.VolumeII.Integers.Implementation
Verification status: checked switch module

This module is the root-level implementation switch for integer construction
work. Change the abbreviations in `Active` to make another construction the
default target for shared arithmetic tests and downstream examples.
-/

namespace Active

abbrev ZImpl : IntegerStructure := Polish.PolishZ

abbrev Z := ZImpl.carrier
abbrev P := Polish.TwoSidedSuccessor.P
abbrev N := Polish.TwoSidedSuccessor.N

instance : Zero Z := ZImpl.zeroInstance
instance : One Z := ZImpl.oneInstance
instance : Add Z := ZImpl.addInstance
instance : Neg Z := ZImpl.negInstance
instance : Mul Z := ZImpl.mulInstance
instance : LT Z := ZImpl.ltInstance
instance : LE Z := ZImpl.leInstance

abbrev zero : Z := IntegerStructure.zero ZImpl
abbrev one : Z := IntegerStructure.one ZImpl
abbrev pos : P → Z := Polish.TwoSidedSuccessor.Z.pos
abbrev neg : N → Z := Polish.TwoSidedSuccessor.Z.neg

abbrev succ : Z → Z := ZImpl.succ
abbrev pred : Z → Z := ZImpl.pred

abbrev add : Z → Z → Z := IntegerStructure.add ZImpl
abbrev negZ : Z → Z := IntegerStructure.neg ZImpl
abbrev mul : Z → Z → Z := IntegerStructure.mul ZImpl

abbrev successorLaws : IntegerSuccessorLaws ZImpl := Polish.PolishSuccessorLaws
abbrev additiveLaws : IntegerAdditiveLaws ZImpl := Polish.PolishAdditiveLaws
abbrev multiplicativeLaws : IntegerMultiplicativeLaws ZImpl :=
  Polish.PolishMultiplicativeLaws
abbrev multiplicationSuccessorLaws :
    IntegerMultiplicationSuccessorLaws ZImpl :=
  Polish.PolishMultiplicationSuccessorLaws
abbrev ringLaws : IntegerRingLaws ZImpl := Polish.PolishRingLaws
abbrev orderLaws : IntegerOrderLaws ZImpl := Polish.PolishOrderLaws
abbrev orderedRingLaws : IntegerOrderedRingLaws ZImpl := Polish.PolishOrderedRingLaws
abbrev integerLaws : IntegerLaws ZImpl := Polish.PolishIntegerLaws

end Active

end Integers
end VolumeII
end LRA
