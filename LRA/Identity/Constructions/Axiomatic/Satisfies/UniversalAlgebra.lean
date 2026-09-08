import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.Identity.Constructions.Axiomatic

universe u v w

/-- The axiomatic identity relation is a congruence for every algebraic
structure on its carrier.

Logical form:
```lean
IsCongruence structure_ Ax_IdentityRelation
```
-/
theorem SatisfiesUniversalAlgebraIdentity
    {signature : LRA.Identity.AlgebraicSignature.{v, w}}
    (structure_ : LRA.Identity.AlgebraicStructure.{u} signature) :
    LRA.Identity.IsCongruence structure_
      (Ax_IdentityRelation : structure_.Carrier -> structure_.Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic
