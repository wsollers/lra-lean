import LRA.Identity.Interface.Equality
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Satisfies

namespace LRA.Identity.Construction.Axiomatic

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
  EqualReflexive := axiomaticIdentityRelation_satisfiesReflexivity Carrier
  EqualLeibniz := axiomaticLeibnizLaw

end LRA.Identity.Construction.Axiomatic
