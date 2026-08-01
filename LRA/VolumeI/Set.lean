import LRA.VolumeI.Set.Set
import LRA.VolumeI.Set.Operations
import LRA.VolumeI.Set.Algebra
import LRA.VolumeI.Set.Products
import LRA.VolumeI.Set.Families
import LRA.VolumeI.Set.PowerSets
import LRA.VolumeI.Set.ZFC
import LRA.VolumeI.Set.ZFCSet

/-!
Aggregate import shim for the `Set` layer as a whole (`Set/`): basic
model-backed set vocabulary, predicate-set tools, products, and ZFC as a
first-order theory over `Logic.FirstOrder`'s existing
`Signature`/`Model`/`Formula`/`Satisfies` machinery.
-/
