import LRA.VolumeI.Identity.Theorems.Relations

/-!
Contract home for equality laws.
-/

namespace LRA.Identity

universe u

/--
Equality is the canonical equivalence relation on every carrier.

Logical form:

```lean
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier)
```
-/
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) :=
  EqualityRelationIsEquivalence Carrier

end LRA.Identity
