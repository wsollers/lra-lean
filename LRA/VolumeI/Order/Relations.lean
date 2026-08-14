import LRA.VolumeI.Order.Relations.Topic
import LRA.VolumeI.Order.OrderedCompatibility

/-!
Aggregate import for order-specific relation constructions.

The `OrderedCompatibility` import temporarily preserves the historical
`LRA.VolumeI.Order.Relations` public surface for the two predicates that couple
an order relation to an algebraic operation. New code should import
`LRA.VolumeI.Order.OrderedCompatibility` directly for those predicates.
-/
