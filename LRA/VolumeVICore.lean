import LRA.AlgebraicStructures
import LRA.AlgebraicStructures.AbelianGroup.Laws
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Interface.Laws
import LRA.AlgebraicStructures.AdditiveGroup.Interface.Laws
import LRA.AlgebraicStructures.AdditiveMonoid.Interface.Laws
import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Laws
import LRA.AlgebraicStructures.BooleanAlgebra.Laws
import LRA.AlgebraicStructures.BoundedLattice.Interface.Laws
import LRA.AlgebraicStructures.CommutativeMonoid.Interface.Laws
import LRA.AlgebraicStructures.CommutativeRing.Laws
import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws
import LRA.AlgebraicStructures.CommutativeSemiring.Laws
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Laws
import LRA.AlgebraicStructures.CompleteOrderedField.Laws
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws
import LRA.AlgebraicStructures.DistributiveLattice.Interface.Laws
import LRA.AlgebraicStructures.DivisionRing.Laws
import LRA.AlgebraicStructures.Field.Laws
import LRA.AlgebraicStructures.Group.Interface.Laws
import LRA.AlgebraicStructures.IntegralDomain.Laws
import LRA.AlgebraicStructures.JoinSemilattice.Interface.Laws
import LRA.AlgebraicStructures.Lattice.Interface.Laws
import LRA.AlgebraicStructures.LinearlyOrderedGroup.Laws
import LRA.AlgebraicStructures.LinearlyOrderedRing.Laws
import LRA.AlgebraicStructures.Magma.Interface.Laws
import LRA.AlgebraicStructures.MeetSemilattice.Interface.Laws
import LRA.AlgebraicStructures.Monoid.Interface.Laws
import LRA.AlgebraicStructures.NontrivialRing.Laws
import LRA.AlgebraicStructures.OrderedField.Laws
import LRA.AlgebraicStructures.OrderedGroup.Laws
import LRA.AlgebraicStructures.OrderedRing.Laws
import LRA.AlgebraicStructures.OrderedSemiring.Laws
import LRA.AlgebraicStructures.Ring.Laws
import LRA.AlgebraicStructures.Semigroup.Interface.Laws
import LRA.AlgebraicStructures.Semiring.Laws
import LRA.AlgebraicStructures.Semiring.Laws.Distributive
import LRA.Algebra.LinearAlgebra
import LRA.Algebra.LinearAlgebra.VectorSpace.Construction
import LRA.Order
import LRA.Order.Relation.GreaterThan.Relationships

/-!
Volume VI core aggregate.

This slice follows the external Volume VI TOC for algebraic structures, linear
algebra, and lattice/order theory, including topic-local law routers that are
not pulled by `LRA.AlgebraicStructures` itself.
-/
