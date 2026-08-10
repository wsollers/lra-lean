import LRA.VolumeI.Set.Implementations.LRASet.Operations.Families.Indexed

namespace LRA.VolumeI.Set.Implementations.LRASet

/-!
Countable indexed set operations.

Countable indexed operations are represented by `Nat`-indexed families.
-/

/-- A countable indexed family of sets. -/
abbrev CountableIndexedFamily (Alpha : LRACarrier) :=
  IndexedFamily Nat Alpha

/-- Countable union, represented by a `Nat`-indexed union. -/
def CountableUnion {Alpha : LRACarrier}
    (Family : CountableIndexedFamily Alpha) : LRASet Alpha :=
  IndexedUnion Family

/-- Countable intersection, represented by a `Nat`-indexed intersection. -/
def CountableIntersection {Alpha : LRACarrier}
    (Family : CountableIndexedFamily Alpha) : LRASet Alpha :=
  IndexedIntersection Family

end LRA.VolumeI.Set.Implementations.LRASet
