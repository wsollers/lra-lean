import LRA.Identity.Constructions.Axiomatic

namespace LRA.Identity.Interop.Providers.LRA

universe u

noncomputable scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier :=
  LRA.Identity.Construction.Axiomatic.instIdentityRelation Carrier

end LRA.Identity.Interop.Providers.LRA
