import LRA.VolumeI.Order.Bounds.UpperBound.All
import LRA.VolumeI.Order.Bounds.LowerBound.All
import LRA.VolumeI.Order.Bounds.BoundSets.All
import LRA.VolumeI.Order.Bounds.BoundedAbove.All
import LRA.VolumeI.Order.Bounds.BoundedBelow.All
import LRA.VolumeI.Order.Bounds.Bounded.All
import LRA.VolumeI.Order.Bounds.LeastElement.All
import LRA.VolumeI.Order.Bounds.GreatestElement.All
import LRA.VolumeI.Order.Bounds.BottomElement.All
import LRA.VolumeI.Order.Bounds.TopElement.All
import LRA.VolumeI.Order.Bounds.MinimalElement.All
import LRA.VolumeI.Order.Bounds.MaximalElement.All
import LRA.VolumeI.Order.Bounds.Supremum.All
import LRA.VolumeI.Order.Bounds.Infimum.All
import LRA.VolumeI.Order.Bounds.LeastUpperBoundProperty.All
import LRA.VolumeI.Order.Bounds.GreatestLowerBoundProperty.All

/-!
Topic aggregate for bounds in Volume I order theory.

Upper/lower bounds, least/greatest elements, suprema, and infima use a
non-strict relation. Minimal and maximal elements use the associated strict
relation. This convention is intentional and follows the standard distinction
between global extrema and local incomparability-sensitive extrema.
-/
