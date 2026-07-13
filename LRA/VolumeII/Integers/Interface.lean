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
  zeroInstance : Zero carrier
  oneInstance : One carrier
  addInstance : Add carrier
  negInstance : Neg carrier
  mulInstance : Mul carrier
  ltInstance : LT carrier
  leInstance : LE carrier
  succ : carrier → carrier
  pred : carrier → carrier

attribute [instance] LRAZ.zeroInstance
attribute [instance] LRAZ.oneInstance
attribute [instance] LRAZ.addInstance
attribute [instance] LRAZ.negInstance
attribute [instance] LRAZ.mulInstance
attribute [instance] LRAZ.ltInstance
attribute [instance] LRAZ.leInstance

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
