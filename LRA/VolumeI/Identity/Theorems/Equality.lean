import LRA.VolumeI.Identity.Theorems.Relations

/-!
Contract home for equality laws.
-/

namespace LRA.VolumeI.Identity

universe u

/--
Equality is the canonical equivalence relation on every carrier.

Logical form:

```lean
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.VolumeI.Relations.Equivalence (EqualityRelation Carrier)
```
-/
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.VolumeI.Relations.Equivalence (EqualityRelation Carrier) :=
  EqualityRelationIsEquivalence Carrier

end LRA.VolumeI.Identity
