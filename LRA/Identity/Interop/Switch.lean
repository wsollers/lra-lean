import LRA.Identity.Interface.Definitions.Equality
import LRA.Identity.Interop.FromMathlib
import LRA.Identity.Interop.ToMathlib

namespace LRA.Identity

universe u

/-- `LRA_Identity` (and `SelectIdentityRelation`) are for code that wants to
stay parametric over which equality construction it commits to. Both
backends below are definitionally `fun a b => a = b`, so most downstream
consumers don't need the switch at all — they can depend on
`Interface.Definitions`/`Interface.Laws` directly. Set theory is the
motivating counterexample: it deliberately routes its notion of set equality
through `LRA_Identity` rather than bare `=`. -/
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
