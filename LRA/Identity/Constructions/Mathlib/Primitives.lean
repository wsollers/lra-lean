namespace LRA.Identity.Constructions.Mathlib

universe u

/-- The native Lean realization of identity.

Logical form: `left = right`.
-/
abbrev NativeIdentity {Carrier : Type u} : Carrier -> Carrier -> Prop := Eq

end LRA.Identity.Constructions.Mathlib
