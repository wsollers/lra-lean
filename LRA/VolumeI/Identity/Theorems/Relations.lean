import LRA.VolumeI.Identity.Theorems.Core
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.Identity

universe u

/-- TeX label: `def:identity-relation`.

Logical form:

```lean
abbrev IdentityRelation {Carrier : Type u} (left right : Carrier) : Prop :=
  LRA.Relation.IdentityRelation Carrier left right
```
-/
abbrev IdentityRelation {Carrier : Type u} (left right : Carrier) : Prop :=
  LRA.Relation.IdentityRelation Carrier left right

/-- TeX label: `def:equality-relation`.

Logical form:

```lean
abbrev EqualityRelation (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  LRA.Relation.IdentityRelation Carrier
```
-/
abbrev EqualityRelation (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  LRA.Relation.IdentityRelation Carrier

/--
Equality is reflexive as a named binary-relation predicate.

Logical form:

```lean
theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.Relation.Reflexive (EqualityRelation Carrier)
```
-/
theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.Relation.Reflexive (EqualityRelation Carrier) := by
  intro element
  exact EqualityReflexivity element

/--
Equality is symmetric as a named binary-relation predicate.

Logical form:

```lean
theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.Relation.Symmetric (EqualityRelation Carrier)
```
-/
theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.Relation.Symmetric (EqualityRelation Carrier) := by
  intro left right ObjectsAreEqual
  exact EqualitySymmetry ObjectsAreEqual

/--
Equality is transitive as a named binary-relation predicate.

Logical form:

```lean
theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.Relation.Transitive (EqualityRelation Carrier)
```
-/
theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.Relation.Transitive (EqualityRelation Carrier) := by
  intro first second third FirstEqualsSecond SecondEqualsThird
  exact EqualityTransitivity FirstEqualsSecond SecondEqualsThird

/--
Equality is an equivalence relation.

Logical form:

```lean
theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier)
```
-/
theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) := by
  exact ⟨
    EqualityRelationIsReflexive Carrier,
    EqualityRelationIsSymmetric Carrier,
    EqualityRelationIsTransitive Carrier⟩

end LRA.Identity
