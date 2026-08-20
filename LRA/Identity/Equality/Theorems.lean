import LRA.Identity.Axioms
import LRA.Relation.Definition
import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Relation.Structures.Definition
import LRA.Identity.Equality.Definition

namespace LRA.Identity

universe u

/-- Equality is symmetric, derived from reflexivity and Leibniz substitution. -/
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left := by
  sorry

/-- Equality is transitive, derived from Leibniz substitution. -/
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third := by
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

/--
Equality is the canonical equivalence relation on every carrier.

Logical form:

```lean
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier)
```
-/
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) := by
  sorry

end LRA.Identity
