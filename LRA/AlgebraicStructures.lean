import LRA.AlgebraicStructures.AbelianGroup
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup
import LRA.AlgebraicStructures.AdditiveGroup
import LRA.AlgebraicStructures.AdditiveMonoid
import LRA.AlgebraicStructures.AdditiveSemigroup
import LRA.AlgebraicStructures.BooleanAlgebra.All
import LRA.AlgebraicStructures.BoundedLattice.All
import LRA.AlgebraicStructures.CommutativeMonoid
import LRA.AlgebraicStructures.CommutativeRing.All
import LRA.AlgebraicStructures.CommutativeSemigroup
import LRA.AlgebraicStructures.CommutativeSemiring.All
import LRA.AlgebraicStructures.CompleteOrderedField.All
import LRA.AlgebraicStructures.DiscreteInteger.All
import LRA.AlgebraicStructures.DistributiveLattice.All
import LRA.AlgebraicStructures.DivisionRing.All
import LRA.AlgebraicStructures.Field.All
import LRA.AlgebraicStructures.Group
import LRA.AlgebraicStructures.IntegralDomain.All
import LRA.AlgebraicStructures.JoinSemilattice.All
import LRA.AlgebraicStructures.Lattice.All
import LRA.AlgebraicStructures.LinearlyOrderedGroup.All
import LRA.AlgebraicStructures.LinearlyOrderedRing.All
import LRA.AlgebraicStructures.Magma
import LRA.AlgebraicStructures.MeetSemilattice.All
import LRA.AlgebraicStructures.Monoid
import LRA.AlgebraicStructures.NontrivialRing.All
import LRA.AlgebraicStructures.OrderedField.All
import LRA.AlgebraicStructures.OrderedGroup.All
import LRA.AlgebraicStructures.OrderedRing.All
import LRA.AlgebraicStructures.OrderedSemiring.All
import LRA.AlgebraicStructures.Ring.All
import LRA.AlgebraicStructures.Semigroup
import LRA.AlgebraicStructures.Semiring.All
import LRA.AlgebraicStructures.MathlibBridge
import LRA.AlgebraicStructures.MathlibAdapters

/-!
Aggregate import for the named algebraic-structures layer.

- **Machines**: Lean core's notation classes (`Add`, `Mul`, `Neg`,
  `Sub`, `Inv`, `Div`, `LE`, `LT`, numerals via `OfNat R 0/1`). A carrier
  is "a ring of Xs" by registering operations on `X`, exactly as a type
  becomes a set backend -- ring of reals, ring of sets, one theorem
  surface.
- **Certificates**: small `Prop` mixins under named concept folders
  (`Magma`, `Semigroup`, `Monoid`, `Group`, `Ring`,
  `NontrivialRing`, `DivisionRing`, `Field`, `OrderedGroup`,
  `OrderedRing`, `LinearlyOrderedRing`, `OrderedField`, ...), together
  with canonical `LRA.Order`
  certificates for ordered structures.
- **Bundles**: `class abbrev` conjunctions owned by each named
  structure, such as `RingLaws`, `DivisionRingLaws`, `FieldLaws`,
  and `OrderedFieldLaws`.
- **Completeness**: the named complete ordered-field combination,
  using backend-relative completeness from `LRA.Order`.
- **Mathlib bridge** (`MathlibBridge.lean`): generic instances deriving
  every certificate from Mathlib's classes, so `ℕ`, `ℤ`, `ℚ`, `ℝ`, `ℂ`,
  and every other Mathlib carrier is certified once, with zero `sorry`.

Capability honesty throughout: `ℕ` never registers `Neg`, so `-n` does
not elaborate; a field's `0⁻¹ = 0` convention is a stated law, not a
hidden fact.
-/
