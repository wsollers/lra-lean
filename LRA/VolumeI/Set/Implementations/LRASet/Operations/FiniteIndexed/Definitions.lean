import Mathlib.Data.Fintype.Basic
import LRA.VolumeI.Set.Implementations.LRASet.Operations.Families.Indexed

namespace LRA.VolumeI.Set.Implementations.LRASet

/-!
Finite indexed set operations.

This file is the public entrypoint for operations indexed by a finite carrier.
The underlying family vocabulary is shared with arbitrary indexed families.
-/

/-- A finite indexed family of sets. -/
abbrev FiniteIndexedFamily (Index Alpha : LRACarrier) [Fintype Index] :=
  IndexedFamily Index Alpha

/-- Finite indexed union, represented by an indexed union over a finite carrier. -/
def FiniteIndexedUnion {Index Alpha : LRACarrier} [Fintype Index]
    (Family : FiniteIndexedFamily Index Alpha) : LRASet Alpha :=
  IndexedUnion Family

/-- Finite indexed intersection, represented by an indexed intersection over a
finite carrier. -/
def FiniteIndexedIntersection {Index Alpha : LRACarrier} [Fintype Index]
    (Family : FiniteIndexedFamily Index Alpha) : LRASet Alpha :=
  IndexedIntersection Family

end LRA.VolumeI.Set.Implementations.LRASet
