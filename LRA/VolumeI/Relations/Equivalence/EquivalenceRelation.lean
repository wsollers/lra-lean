import LRA.Identity.Equality
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

This is a relation-theoretic classification of equality. The raw equality laws
are owned by `LRA.Identity`; this theorem packages them using the canonical
relation properties owned by `LRA.Relation`.

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
    exact LRA.Identity.EqualityReflexivity element
  constructor
  · intro left right ObjectsAreEqual
    exact LRA.Identity.EqualitySymmetry ObjectsAreEqual
  · intro first second third FirstEqualsSecond SecondEqualsThird
    exact LRA.Identity.EqualityTransitivity FirstEqualsSecond SecondEqualsThird

end LRA.Relation
