import LRA.Identity.Constructions.Leibniz.Definitions.Equality
import LRA.Identity.Interop.FromMathlib
import LRA.Identity.Interop.ToMathlib

namespace LRA.Identity

universe u

inductive IdentityBackend where
  | leibniz
  | mathlib
  deriving DecidableEq, Repr

def DefaultIdentityBackend : IdentityBackend :=
  .mathlib

abbrev LRA_Identity_Leibniz (Carrier : Type u) : Carrier → Carrier → Prop :=
  PropositionalEquality

abbrev LRA_Identity_Mathlib (Carrier : Type u) : Carrier → Carrier → Prop :=
  NativeEquality Carrier

abbrev LRA_Identity (Carrier : Type u) : Carrier → Carrier → Prop :=
  LRA_Identity_Mathlib Carrier

def SelectIdentityRelation (backend : IdentityBackend) (Carrier : Type u) :
    Carrier → Carrier → Prop :=
  match backend with
  | .leibniz => LRA_Identity_Leibniz Carrier
  | .mathlib => LRA_Identity_Mathlib Carrier

end LRA.Identity
