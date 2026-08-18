import LRA.VolumeI.Map.Graph.All
import LRA.VolumeI.Map.Domain.All
import LRA.VolumeI.Map.Codomain.All
import LRA.VolumeI.Map.Image.All
import LRA.VolumeI.Map.Preimage.All
import LRA.VolumeI.Map.Fiber.All
import LRA.VolumeI.Map.Inverse.All
import LRA.VolumeI.Map.Partial.All

/-!
Build gate for the material still sited under `LRA/VolumeI/Map/` while §7.1
relocates it to its owning subject.

What remains here is not function vocabulary. The concept directories that
merely respelled `LRA.Function` names have been deleted; every declaration
below is either a morphism primitive bound for `LRA.Morphism`, a set-backed
realization bound for `LRA.Function.Calculus`, graph vocabulary bound for
`LRA.Relation.Calculus`, or the partial-map structure bound for
`LRA.Function.Structures`. This module aggregates them so they stay under a
Lake target until those moves happen; it owns nothing and re-exports nothing
that has a canonical home elsewhere.
-/
