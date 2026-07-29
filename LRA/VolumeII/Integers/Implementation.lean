-- LRA/VolumeII/Integers/Implementation.lean
-- Active integer implementation switch.

import LRA.VolumeII.Integers.Polish
import LRA.VolumeII.Integers.Tao
import LRA.VolumeII.Integers.Mendelson
import LRA.VolumeII.Integers.Pfefer

namespace LRA.VolumeII.Integers

/-!
Volume II label: integers-active-implementation
Lean module: LRA.VolumeII.Integers.Implementation
Verification status: checked switch module

This module is the root-level implementation switch for integer construction
work. Change the abbreviations in `Active` to make another construction the
default target for shared arithmetic tests and downstream examples.
-/

end LRA.VolumeII.Integers
namespace LRA.VolumeII.Integers.Active

/--
**[Abbrev — ZImpl]**

Mathematical statement (Lean): `abbrev ZImpl : IntegerStructure`.
-/
abbrev ZImpl : IntegerStructure := Polish.PolishZ

/--
**[Abbrev — Z]**

Mathematical statement (Lean): `abbrev Z`.
-/
abbrev Z := ZImpl.carrier
/--
**[Abbrev — P]**

Mathematical statement (Lean): `abbrev P`.
-/
abbrev P := Polish.TwoSidedSuccessor.P
/--
**[Abbrev — N]**

Mathematical statement (Lean): `abbrev N`.
-/
abbrev N := Polish.TwoSidedSuccessor.N

instance : Zero Z where
  zero := ZImpl.zero
instance : One Z where
  one := ZImpl.one
instance : Add Z where
  add := ZImpl.add
instance : Neg Z where
  neg := ZImpl.neg
instance : Mul Z where
  mul := ZImpl.mul
instance : LT Z where
  lt := ZImpl.lt
instance : LE Z where
  le := ZImpl.le

/--
**[Abbrev — zero]**

Mathematical statement (Lean): `abbrev zero : Z`.
-/
abbrev zero : Z := ZImpl.zero
/--
**[Abbrev — one]**

Mathematical statement (Lean): `abbrev one : Z`.
-/
abbrev one : Z := ZImpl.one
/--
**[Abbrev — pos]**

Mathematical statement (Lean): `abbrev pos : P → Z`.
-/
abbrev pos : P → Z := Polish.TwoSidedSuccessor.Z.pos
/--
**[Abbrev — neg]**

Mathematical statement (Lean): `abbrev neg : N → Z`.
-/
abbrev neg : N → Z := Polish.TwoSidedSuccessor.Z.neg

/--
**[Abbrev — succ]**

Mathematical statement (Lean): `abbrev succ : Z → Z`.
-/
abbrev succ : Z → Z := ZImpl.succ
/--
**[Abbrev — pred]**

Mathematical statement (Lean): `abbrev pred : Z → Z`.
-/
abbrev pred : Z → Z := ZImpl.pred

/--
**[Abbrev — add]**

Mathematical statement (Lean): `abbrev add : Z → Z → Z`.
-/
abbrev add : Z → Z → Z := ZImpl.add
/--
**[Abbrev — negZ]**

Mathematical statement (Lean): `abbrev negZ : Z → Z`.
-/
abbrev negZ : Z → Z := ZImpl.neg
/--
**[Abbrev — mul]**

Mathematical statement (Lean): `abbrev mul : Z → Z → Z`.
-/
abbrev mul : Z → Z → Z := ZImpl.mul

/--
**[Abbrev — successorLaws]**

Mathematical statement (Lean): `abbrev successorLaws : IntegerSuccessorLaws ZImpl`.
-/
abbrev successorLaws : IntegerSuccessorLaws ZImpl := Polish.PolishSuccessorLaws
/--
**[Abbrev — additiveLaws]**

Mathematical statement (Lean): `abbrev additiveLaws : IntegerAdditiveLaws ZImpl`.
-/
abbrev additiveLaws : IntegerAdditiveLaws ZImpl := Polish.PolishAdditiveLaws
/--
**[Abbrev — multiplicativeLaws]**

Mathematical statement (Lean): `abbrev multiplicativeLaws : IntegerMultiplicativeLaws ZImpl`.
-/
abbrev multiplicativeLaws : IntegerMultiplicativeLaws ZImpl :=
  Polish.PolishMultiplicativeLaws
/--
**[Abbrev — multiplicationSuccessorLaws]**

Mathematical statement (Lean): `abbrev multiplicationSuccessorLaws : IntegerMultiplicationSuccessorLaws ZImpl`.
-/
abbrev multiplicationSuccessorLaws :
    IntegerMultiplicationSuccessorLaws ZImpl :=
  Polish.PolishMultiplicationSuccessorLaws
/--
**[Abbrev — ringLaws]**

Mathematical statement (Lean): `abbrev ringLaws : IntegerRingLaws ZImpl`.
-/
abbrev ringLaws : IntegerRingLaws ZImpl := Polish.PolishRingLaws
/--
**[Abbrev — orderLaws]**

Mathematical statement (Lean): `abbrev orderLaws : IntegerOrderLaws ZImpl`.
-/
abbrev orderLaws : IntegerOrderLaws ZImpl := Polish.PolishOrderLaws
/--
**[Abbrev — orderedRingLaws]**

Mathematical statement (Lean): `abbrev orderedRingLaws : IntegerOrderedRingLaws ZImpl`.
-/
abbrev orderedRingLaws : IntegerOrderedRingLaws ZImpl := Polish.PolishOrderedRingLaws
/--
**[Abbrev — integerLaws]**

Mathematical statement (Lean): `abbrev integerLaws : IntegerLaws ZImpl`.
-/
abbrev integerLaws : IntegerLaws ZImpl := Polish.PolishIntegerLaws

end LRA.VolumeII.Integers.Active
namespace LRA.VolumeII.Integers

end LRA.VolumeII.Integers
