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

abbrev ZImpl : LRAZ := Polish.PolishZ

abbrev Z := ZImpl.carrier
abbrev P := Polish.TwoSidedSuccessor.P
abbrev N := Polish.TwoSidedSuccessor.N

abbrev zero : Z := 0
abbrev one : Z := 1
abbrev pos : P → Z := Polish.TwoSidedSuccessor.Z.pos
abbrev neg : N → Z := Polish.TwoSidedSuccessor.Z.neg

abbrev succ : Z → Z := ZImpl.succ
abbrev pred : Z → Z := ZImpl.pred

abbrev add : Z → Z → Z := (· + ·)
abbrev negZ : Z → Z := Neg.neg
abbrev mul : Z → Z → Z := (· * ·)

abbrev successorLaws : LRASuccessorLaws ZImpl := Polish.PolishSuccessorLaws
abbrev additiveLaws : LRAAdditiveLaws ZImpl := Polish.PolishAdditiveLaws
abbrev multiplicativeLaws : LRAMultiplicativeLaws ZImpl := Polish.PolishMultiplicativeLaws
abbrev ringLaws : LRARingLaws ZImpl := Polish.PolishRingLaws
abbrev orderLaws : LRAOrderLaws ZImpl := Polish.PolishOrderLaws
abbrev orderedRingLaws : LRAOrderedRingLaws ZImpl := Polish.PolishOrderedRingLaws

end Active

end Integers
end VolumeII
end LRA
