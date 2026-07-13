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

abbrev Z := Polish.TwoSidedSuccessor.Z
abbrev P := Polish.TwoSidedSuccessor.P
abbrev N := Polish.TwoSidedSuccessor.N

abbrev zero : Z := Polish.TwoSidedSuccessor.Z.zero
abbrev pos : P → Z := Polish.TwoSidedSuccessor.Z.pos
abbrev neg : N → Z := Polish.TwoSidedSuccessor.Z.neg

abbrev succ : Z → Z := Polish.TwoSidedSuccessor.succ
abbrev pred : Z → Z := Polish.TwoSidedSuccessor.pred

abbrev add : Z → Z → Z := Polish.TwoSidedSuccessor.add
abbrev negZ : Z → Z := Polish.TwoSidedSuccessor.negZ
abbrev mul : Z → Z → Z := Polish.TwoSidedSuccessor.mul

end Active

end Integers
end VolumeII
end LRA
