import LRA.Identity.Interface.Identity

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`Ax_IdentityRelation` is the primitive relation postulated by the axiomatic
identity construction.

Logical form:

```lean
axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop
```
-/
axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop

end LRA.Identity.Constructions.Axiomatic
