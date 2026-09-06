import LRA.Identity.Constructions.Axiomatic.Laws.Primitive
import LRA.Identity.Laws.Equivalence

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`axiomaticIdentIsEquivalenceRelation` packages the axiomatic identity laws as a
generic Relation equivalence relation.

Logical form:

```lean
theorem axiomaticIdentIsEquivalenceRelation {Carrier : Type u} :
    LRA.Relation.EquivalenceRelation
      (Ax_IdentityRelation : Carrier → Carrier → Prop)
```
-/
theorem axiomaticIdentIsEquivalenceRelation {Carrier : Type u} :
    LRA.Relation.EquivalenceRelation
      (Ax_IdentityRelation : Carrier → Carrier → Prop) := by
  sorry

end LRA.Identity.Construction.Axiomatic
