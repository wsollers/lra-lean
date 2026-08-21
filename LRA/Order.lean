import LRA.Order.Relation.OrderRelation.Definition
import LRA.Order.OrderedSets
import LRA.Order.Bounds
import LRA.Order.Density
import LRA.Order.Directedness
import LRA.Order.Lattices
import LRA.Order.DiscreteOrder
import LRA.Order.Constructions
import LRA.Order.Morphisms
import LRA.Order.Laws
import LRA.Order.Relation.GreaterThanOrEqual.Definition
import LRA.Order.Relation.GreaterThanOrEqual.Relationships
import LRA.Order.Relation.CoverRelation.Theorems
import LRA.Order.Relation.UpperCover.Definition
import LRA.Order.Relation.LowerCover.Definition
import LRA.Order.Relation.Adjacent.Definition

/-!
Canonical Order subject.

Order specializes relation theory to comparison relations and owns ordered-set
structures, bounds, density, directedness, lattices, discrete-order and native
order law certificates, order constructions, and order-specific morphisms.

Mathlib interoperability and set-image/preimage transport adapters remain
explicit opt-in boundaries rather than part of this default aggregate.

The `Examples` and `FailureModes` leaves are deliberately not reached from here:
they are quarantined (§2.3, §6) and compiled from the test library instead.
-/
