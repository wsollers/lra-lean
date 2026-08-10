import LRA.VolumeI.Identity.Theorems.Core
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.VolumeI.Identity

universe u

/-- TeX label: `def:identity-relation`.

Logical form:

```lean
IdentityRelation left right ↔ left = right
```
-/
abbrev IdentityRelation {Carrier : Type u} (left right : Carrier) : Prop :=
  LRA.VolumeI.Relations.IdentityRelation Carrier left right

/-- TeX label: `def:equality-relation`.

Logical form:

```lean
EqualityRelation Carrier left right ↔ left = right
```
-/
abbrev EqualityRelation (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  LRA.VolumeI.Relations.IdentityRelation Carrier

/--
Equality is reflexive as a named binary-relation predicate.

Logical form:

```lean
∀ element : Carrier, EqualityRelation Carrier element element
```
-/
theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.VolumeI.Relations.Reflexive (EqualityRelation Carrier) := by
  intro element
  exact EqualityReflexivity element

/--
Equality is symmetric as a named binary-relation predicate.

Logical form:

```lean
∀ left right : Carrier,
  EqualityRelation Carrier left right →
    EqualityRelation Carrier right left
```
-/
theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.VolumeI.Relations.Symmetric (EqualityRelation Carrier) := by
  intro left right ObjectsAreEqual
  exact EqualitySymmetry ObjectsAreEqual

/--
Equality is transitive as a named binary-relation predicate.

Logical form:

```lean
∀ first second third : Carrier,
  EqualityRelation Carrier first second →
  EqualityRelation Carrier second third →
    EqualityRelation Carrier first third
```
-/
theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.VolumeI.Relations.Transitive (EqualityRelation Carrier) := by
  intro first second third FirstEqualsSecond SecondEqualsThird
  exact EqualityTransitivity FirstEqualsSecond SecondEqualsThird

/--
Equality is an equivalence relation.

Logical form:

```lean
LRA.VolumeI.Relations.Reflexive (EqualityRelation Carrier) ∧
LRA.VolumeI.Relations.Symmetric (EqualityRelation Carrier) ∧
LRA.VolumeI.Relations.Transitive (EqualityRelation Carrier)
```
-/
theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.VolumeI.Relations.Equivalence (EqualityRelation Carrier) := by
  exact ⟨
    EqualityRelationIsReflexive Carrier,
    EqualityRelationIsSymmetric Carrier,
    EqualityRelationIsTransitive Carrier⟩

end LRA.VolumeI.Identity
