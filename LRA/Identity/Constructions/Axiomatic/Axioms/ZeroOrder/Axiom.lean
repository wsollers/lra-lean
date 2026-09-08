import LRA.Identity.Constructions.Axiomatic.Axioms.ZeroOrder.Definitions
import LRA.Identity.Interface.ZeroOrder

namespace LRA.Identity.Constructions.Axiomatic.ZeroOrder

/-- Zero-order syntactic identity is reflexive. -/
axiom Ax_Reflexivity {Formula : Type} (formula : Formula) :
  SyntacticIdentity formula formula

/-- Truth is invariant under zero-order syntactic identity. -/
axiom Ax_Substitution
    {L : LRA.Identity.Interface.ZeroOrder.LStructure}
    (M : LRA.Identity.Interface.ZeroOrder.Model L)
    {left right : L.Formula} (h : SyntacticIdentity left right) :
    M.Holds left <-> M.Holds right

end LRA.Identity.Constructions.Axiomatic.ZeroOrder
