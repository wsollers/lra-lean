import LRA.Identity.Interface.Equality
import LRA.Identity.Constructions.Mathlib.Satisfies

namespace LRA.Identity.Construction.Mathlib

universe u

/--
`instEqualityRelation` packages Lean equality as the in-house equality relation
for the mathlib construction.

Logical form:

```lean
scoped instance instEqualityRelation (Carrier : Type u) :
    LRA.Identity.EqualityRelation Carrier
```
-/
scoped instance instEqualityRelation (Carrier : Type u) :
    LRA.Identity.EqualityRelation Carrier where
  Equal := Eq
  EqualReflexive := fun _ => rfl
  EqualLeibniz := fun h _ hp => h ▸ hp

end LRA.Identity.Construction.Mathlib
