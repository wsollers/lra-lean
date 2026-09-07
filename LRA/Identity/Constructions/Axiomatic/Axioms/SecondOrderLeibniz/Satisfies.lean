import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Satisfies
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems

namespace LRA.Identity.Construction.Axiomatic

universe u

noncomputable scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier where
  Ident := Ax_IdentityRelation
  IdentReflexive := axiomaticIdentityRelation_satisfiesReflexivity Carrier
  IdentLeibniz := axiomaticLeibnizLaw

end LRA.Identity.Construction.Axiomatic
