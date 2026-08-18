/-!
Reference definition for mathematical spaces.

This module records the common textbook pattern of a carrier equipped with
additional structure. It is intentionally only orienting; later formal proofs
should use the appropriate Mathlib structure for the concrete kind of space.
-/

namespace LRA.Internal.MathematicalSpaces

universe u

/-- **[Structure — MathematicalSpaceDefinition]**

Reference data for a mathematical space: a carrier together with a named
predicate for the structural data it carries, and evidence that the predicate
holds.

Logical form:

```lean
structure MathematicalSpaceDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- A predicate naming when the chosen structural data is present. -/
  HasStructure : Prop
  /-- The chosen structural data is present. -/
  structureHolds : HasStructure
```
-/
structure MathematicalSpaceDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- A predicate naming when the chosen structural data is present. -/
  HasStructure : Prop
  /-- The chosen structural data is present. -/
  structureHolds : HasStructure

end LRA.Internal.MathematicalSpaces

