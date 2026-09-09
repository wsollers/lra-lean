import LRA.Identity.Interface.Equality
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Satisfies

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`instEqualityRelation` packages the axiomatic identity relation as the current
in-house equality relation for the axiomatic construction.

Logical form:

```lean
noncomputable scoped instance instEqualityRelation (Carrier : Type u) :
    LRA.Identity.EqualityRelation Carrier
```
-/
noncomputable scoped instance instEqualityRelation (Carrier : Type u) :
    LRA.Identity.EqualityRelation Carrier where
  Equal := Ax_IdentityRelation
  satisfiesEqualityTheory := by
    constructor
    · intro x
      exact axiomaticIdentityRelation_satisfiesReflexivity Carrier x
    · intro x y hxy P _ hx
      exact Ax_LeibnizLaw hxy P hx


end LRA.Identity.Constructions.Axiomatic
