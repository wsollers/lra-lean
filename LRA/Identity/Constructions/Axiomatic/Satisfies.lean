import LRA.Identity.Interface.Definitions.IdentityRelation
import LRA.Identity.Constructions.Axiomatic.Axioms

namespace LRA.Identity.Construction.Axiomatic

universe u

noncomputable scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier where
  Ident := Ax_IdentityRelation
  IdentReflexive := Ax_EqualityReflexivity
  IdentLeibniz := Ax_LeibnizLaw

end LRA.Identity.Construction.Axiomatic
