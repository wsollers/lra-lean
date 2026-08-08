import LRA.VolumeI.Set.Finiteness
import LRA.VolumeI.Set.Implementations.LRASet.Operations.Families.Indexed

namespace LRA.VolumeI.Set.Implementations.LRASet

open LRA.VolumeI.Set.Finiteness

/-!
Finite indexed set operations.

This file is the public entrypoint for operations indexed by a finite carrier.
The underlying family vocabulary is shared with arbitrary indexed families.
-/

/-- A finite indexed family of sets. -/
abbrev FiniteIndexedFamily (Index Alpha : LRACarrier)
    (_indexFinite : FiniteType Index) :=
  IndexedFamily Index Alpha

/-- Finite indexed union, represented by an indexed union over a finite carrier.
The finiteness proof records the intended domain; the operation itself is the
same underlying indexed union. -/
def FiniteIndexedUnion {Index Alpha : LRACarrier}
    (indexFinite : FiniteType Index)
    (Family : FiniteIndexedFamily Index Alpha indexFinite) : LRASet Alpha :=
  IndexedUnion Family

/-- Finite indexed intersection, represented by an indexed intersection over a
finite carrier. The finiteness proof records the intended domain; the operation
itself is the same underlying indexed intersection. -/
def FiniteIndexedIntersection {Index Alpha : LRACarrier}
    (indexFinite : FiniteType Index)
    (Family : FiniteIndexedFamily Index Alpha indexFinite) : LRASet Alpha :=
  IndexedIntersection Family

end LRA.VolumeI.Set.Implementations.LRASet
