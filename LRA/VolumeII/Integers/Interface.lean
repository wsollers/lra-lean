-- LRA/VolumeII/Integers/Interface.lean
-- Common interface for integer implementations.

namespace LRA
namespace VolumeII
namespace Integers

/-!
Volume II label: integers-interface
Lean module: LRA.VolumeII.Integers.Interface
Verification status: checked interface module

`LRAZ` is the common public shape for integer implementations. It uses Lean's
standard operation typeclasses for Mathlib-compatible notation while keeping
`succ` and `pred` explicit, since the two-sided construction treats them as
primitive structure.
-/

structure LRAZ where
  carrier : Type u
  zeroInst : Zero carrier
  oneInst : One carrier
  addInst : Add carrier
  negInst : Neg carrier
  mulInst : Mul carrier
  ltInst : LT carrier
  leInst : LE carrier
  succ : carrier → carrier
  pred : carrier → carrier

attribute [instance] LRAZ.zeroInst
attribute [instance] LRAZ.oneInst
attribute [instance] LRAZ.addInst
attribute [instance] LRAZ.negInst
attribute [instance] LRAZ.mulInst
attribute [instance] LRAZ.ltInst
attribute [instance] LRAZ.leInst

namespace LRAZ

abbrev zero (Z : LRAZ) : Z.carrier := 0
abbrev one (Z : LRAZ) : Z.carrier := 1
abbrev add (Z : LRAZ) : Z.carrier → Z.carrier → Z.carrier := (· + ·)
abbrev neg (Z : LRAZ) : Z.carrier → Z.carrier := Neg.neg
abbrev mul (Z : LRAZ) : Z.carrier → Z.carrier → Z.carrier := (· * ·)
abbrev lt (Z : LRAZ) : Z.carrier → Z.carrier → Prop := (· < ·)
abbrev le (Z : LRAZ) : Z.carrier → Z.carrier → Prop := (· ≤ ·)

end LRAZ

end Integers
end VolumeII
end LRA
