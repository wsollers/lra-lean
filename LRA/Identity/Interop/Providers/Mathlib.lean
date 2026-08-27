import LRA.Identity.Constructions.Mathlib

namespace LRA.Identity.Interop.Providers.Mathlib

universe u

scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier :=
  LRA.Identity.Construction.Mathlib.instIdentityRelation Carrier

end LRA.Identity.Interop.Providers.Mathlib
