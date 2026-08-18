import LRA.Order.Relation.OrderRelation.Definition
import LRA.Order.OrderedSets
import LRA.Order.Bounds
import LRA.Order.Density
import LRA.Order.Directedness
import LRA.Order.Lattices
import LRA.Order.DiscreteOrder
import LRA.Order.Constructions

/-!
Canonical Order subject.

Order specializes relation theory to comparison relations and owns ordered-set
structures, bounds, density, directedness, lattices, discrete-order laws, and
order constructions. Interoperability and the divisibility bridge remain for
final cleanup before the legacy-import audit.
-/
