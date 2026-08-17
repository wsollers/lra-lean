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
abbrev EquivalenceRelation {Alpha : Type u}
    (relation : Endorelation Alpha) : Prop :=
  Equivalence relation

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
  exact
    ⟨fun element => rfl,
      (fun _ _ related => related.symm),
      fun _ _ _ firstRelatedSecond secondRelatedThird =>
        firstRelatedSecond.trans secondRelatedThird⟩

end LRA.Relation
