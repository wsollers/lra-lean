/-!
Reference definition for mathematical spaces.

This module records the common textbook pattern of a carrier equipped with
additional structure. It is intentionally only orienting; later formal proofs
should use the appropriate Mathlib structure for the concrete kind of space.
-/

namespace LRA.VolumeIV.MathematicalSpaces

universe u

/-- Reference data for a mathematical space as a carrier with specified

Mathematical statement (Lean): `structure MathematicalSpaceDefinition`.
structure. -/
structure MathematicalSpaceDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- A predicate naming when the chosen structural data is present. -/
  HasStructure : Prop
  /-- The chosen structural data is present. -/
  hasStructure : HasStructure

end LRA.VolumeIV.MathematicalSpaces

