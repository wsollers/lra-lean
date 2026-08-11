/-!
The common carrier vocabulary for LRA mathematics.

A carrier is an arbitrary Lean type. It may be instantiated by a native Lean
type or by the primitive type of objects used by textbook set theory.
-/

namespace LRA.Carrier

universe u

/-- A generic type of mathematical objects.

Logical form:

```lean
abbrev Carrier : Type (u + 1) := Type u
```
-/
abbrev Carrier : Type (u + 1) := Type u

end LRA.Carrier
