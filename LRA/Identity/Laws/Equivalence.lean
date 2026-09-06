import LRA.Identity.Laws.Primitive
import LRA.Identity.Laws.Equality
import LRA.Relation.Interface.Structures.Equivalence.Definition

namespace LRA.Identity

universe u

/--
`IdentIsEquivalenceRelation` packages reflexivity, symmetry, and transitivity
of in-house identity as the generic Relation equivalence interface.

Logical form:

```lean
theorem IdentIsEquivalenceRelation {Carrier : Type u}
    [IdentityRelation Carrier] :
    LRA.Relation.EquivalenceRelation (Ident : Carrier → Carrier → Prop)
```
-/
theorem IdentIsEquivalenceRelation {Carrier : Type u}
    [IdentityRelation Carrier] :
    LRA.Relation.EquivalenceRelation (Ident : Carrier → Carrier → Prop) := by
  sorry

/--
`EqualIsEquivalenceRelation` packages reflexivity, symmetry, and transitivity
of in-house equality as the generic Relation equivalence interface.

Logical form:

```lean
theorem EqualIsEquivalenceRelation {Carrier : Type u}
    [EqualityRelation Carrier] :
    LRA.Relation.EquivalenceRelation (Equal : Carrier → Carrier → Prop)
```
-/
theorem EqualIsEquivalenceRelation {Carrier : Type u}
    [EqualityRelation Carrier] :
    LRA.Relation.EquivalenceRelation (Equal : Carrier → Carrier → Prop) := by
  sorry

end LRA.Identity
