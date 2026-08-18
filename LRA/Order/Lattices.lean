import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Join.Theorems
import LRA.Order.Lattices.Meet.Definition
import LRA.Order.Lattices.Meet.Theorems
import LRA.Order.Lattices.JoinSemilattice.Definition
import LRA.Order.Lattices.JoinSemilattice.Theorems
import LRA.Order.Lattices.MeetSemilattice.Definition
import LRA.Order.Lattices.MeetSemilattice.Theorems
import LRA.Order.Lattices.Lattice.Definition
import LRA.Order.Lattices.Lattice.Theorems
import LRA.Order.Lattices.DistributiveLattice.Definition
import LRA.Order.Lattices.DistributiveLattice.Theorems
import LRA.Order.Lattices.CompleteLattice.Definition

/-!
Canonical lattice vocabulary, structural hierarchy, and backend-neutral theorem
surface. Complete-lattice theorems that require represented-set capabilities
remain separate until their Set-law imports are canonicalized explicitly.
-/
