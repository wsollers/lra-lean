import LRA.Identity.Interface.Definitions.IdentityRelation

namespace LRA.Identity.Construction.Mathlib

universe u

scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier where
  Ident := Eq
  IdentReflexive := fun _ => rfl
  IdentLeibniz := fun h _ hp => h ▸ hp

end LRA.Identity.Construction.Mathlib
