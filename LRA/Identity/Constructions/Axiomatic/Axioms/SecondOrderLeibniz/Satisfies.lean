import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Satisfies
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions

namespace LRA.Identity.Construction.Axiomatic

universe u

noncomputable scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier where
  Ident := Ax_IdentityRelation
  IdentReflexive := axiomaticIdentityRelation_satisfiesReflexivity Carrier
  IdentLeibniz := Ax_LeibnizLaw

end LRA.Identity.Construction.Axiomatic
