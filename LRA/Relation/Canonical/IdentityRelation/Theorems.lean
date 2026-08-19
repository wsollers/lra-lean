import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Relation

universe u v

/--
**[Theorem — IdentityRelationIsReflexive]**

The identity relation is reflexive.

Logical form:

```lean
theorem IdentityRelationIsReflexive :
    Reflexive (IdentityRelation Alpha)
```
-/
theorem IdentityRelationIsReflexive
    {Alpha : Type u} :
    Reflexive (IdentityRelation Alpha) := by
  intro element
  rfl

/--
**[Theorem — IdentityRelationIsSymmetric]**

The identity relation is symmetric.

Logical form:

```lean
theorem IdentityRelationIsSymmetric :
    Symmetric (IdentityRelation Alpha)
```
-/
theorem IdentityRelationIsSymmetric
    {Alpha : Type u} :
    Symmetric (IdentityRelation Alpha) := by
  intro left right related
  exact related.symm

/--
**[Theorem — IdentityRelationIsTransitive]**

The identity relation is transitive.

Logical form:

```lean
theorem IdentityRelationIsTransitive :
    Transitive (IdentityRelation Alpha)
```
-/
theorem IdentityRelationIsTransitive
    {Alpha : Type u} :
    Transitive (IdentityRelation Alpha) := by
  intro first second third firstRelatedSecond secondRelatedThird
  exact firstRelatedSecond.trans secondRelatedThird

end LRA.Relation
