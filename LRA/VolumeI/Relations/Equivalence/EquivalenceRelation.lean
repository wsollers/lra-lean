import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.Relation

universe u

/--
Equivalence-relation laws for an endorelation.

Logical form:

```lean
abbrev EquivalenceRelation {Alpha : Type u}
    (relation : Endorelation Alpha) : Prop :=
  Equivalence relation
```
-/
def EquivalenceRelation {Alpha : Type u}
    (relation : Endorelation Alpha) : Prop :=
  Reflexive relation /\ Symmetric relation /\ Transitive relation

/--
The identity relation is an equivalence relation.

Logical form:

```lean
theorem IdentityRelationIsEquivalenceRelation :
    EquivalenceRelation (IdentityRelation Alpha)
```
-/
theorem IdentityRelationIsEquivalenceRelation
    {Alpha : Type u} :
    EquivalenceRelation (IdentityRelation Alpha) := by
  constructor
  · intro element
    rfl
  · constructor
    · intro left right related
      exact related.symm
    · intro first second third firstRelatedSecond secondRelatedThird
      exact firstRelatedSecond.trans secondRelatedThird

end LRA.Relation
