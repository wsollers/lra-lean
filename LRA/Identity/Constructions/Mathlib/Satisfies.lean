import LRA.Identity.Interface.Identity

namespace LRA.Identity.Constructions.Mathlib

universe u

scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier where
  Ident := Eq
  IdentReflexive := by
    sorry
  IdentLeibniz := by
    sorry

end LRA.Identity.Constructions.Mathlib
