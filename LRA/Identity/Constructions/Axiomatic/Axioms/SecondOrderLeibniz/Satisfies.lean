import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Satisfies
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems

namespace LRA.Identity.Constructions.Axiomatic

universe u

noncomputable scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier where
  Ident := Ax_IdentityRelation
  IdentReflexive := by
    sorry
  IdentLeibniz := by
    sorry

end LRA.Identity.Constructions.Axiomatic
