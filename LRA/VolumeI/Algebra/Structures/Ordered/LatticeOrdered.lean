import LRA.VolumeI.Algebra.Structures.Ordered.OrderedGroup
import LRA.VolumeI.Relations.Order.Lattices

namespace LRA.VolumeI.Algebra.Structures.Ordered

/-- A structure whose order relation also carries lattice operations. -/
structure LatticeOrderedStructure extends OrderedGroup where
  OrderIsLattice : LRA.VolumeI.Relations.Order.Lattice Order

end LRA.VolumeI.Algebra.Structures.Ordered
