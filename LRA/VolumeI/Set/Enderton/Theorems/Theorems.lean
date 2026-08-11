import LRA.VolumeI.Set.Enderton.Theorems.Extensionality
import LRA.VolumeI.Set.Enderton.Theorems.EmptySet
import LRA.VolumeI.Set.Enderton.Theorems.Pairing
import LRA.VolumeI.Set.Enderton.Theorems.Union
import LRA.VolumeI.Set.Enderton.Theorems.PowerSet
import LRA.VolumeI.Set.Enderton.Theorems.Separation
import LRA.VolumeI.Set.Enderton.Theorems.RelativeComplement
import LRA.VolumeI.Set.Enderton.Theorems.Intersection
import LRA.VolumeI.Set.Enderton.Theorems.SymmetricDifference
import LRA.VolumeI.Set.Enderton.Theorems.IntersectionOver
import LRA.VolumeI.Set.Enderton.Theorems.Replacement
import LRA.VolumeI.Set.Enderton.Theorems.Infinity
import LRA.VolumeI.Set.Enderton.Theorems.Foundation
import LRA.VolumeI.Set.Enderton.Theorems.Choice

/-!
Aggregate import for the Enderton textbook set theorems: one file per axiom
(Extensionality has no existence obligation of its own, so it is stated
directly as a biconditional rather than an existence/uniqueness pair), plus
`RelativeComplement` and `Intersection`, neither of which is its own axiom --
both are direct instances of Separation, placed right after it for that
reason -- and `SymmetricDifference`, derived from relative complement and
binary union, placed after both for the same reason.
-/
