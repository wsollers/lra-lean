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

/-!
Canonical Order subject.

Order specializes relation theory to comparison relations and owns ordered-set
structures, bounds, density, directedness, lattices, discrete-order and native
order law certificates, order constructions, and order-specific morphisms.

Mathlib interoperability and set-image/preimage transport adapters remain
explicit opt-in boundaries rather than part of this default aggregate.
-/
