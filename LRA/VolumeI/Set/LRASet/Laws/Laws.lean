import LRA.VolumeI.Set.LRASet.Laws.Membership
import LRA.VolumeI.Set.LRASet.Laws.Union
import LRA.VolumeI.Set.LRASet.Laws.Intersection
import LRA.VolumeI.Set.LRASet.Laws.Distributivity
import LRA.VolumeI.Set.LRASet.Laws.Difference
import LRA.VolumeI.Set.LRASet.Laws.SymmetricDifference
import LRA.VolumeI.Set.LRASet.Laws.Complement
import LRA.VolumeI.Set.LRASet.Laws.Subset

/-!
Aggregate import for the LRASet law certificates: one file per interface
family, mirroring `Enderton/Laws/`, plus `Complement.lean` -- the family
only a backend with an ambient carrier type can register, and therefore
the one place `LRASet` rather than Enderton is the default proof site.
-/
