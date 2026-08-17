import LRA.VolumeI.AlgebraicStructures.AbelianGroup.All
import LRA.VolumeI.AlgebraicStructures.AdditiveCommutativeSemigroup.All
import LRA.VolumeI.AlgebraicStructures.AdditiveGroup.All
import LRA.VolumeI.AlgebraicStructures.AdditiveMonoid.All
import LRA.VolumeI.AlgebraicStructures.AdditiveSemigroup.All
import LRA.VolumeI.AlgebraicStructures.BooleanAlgebra.All
import LRA.VolumeI.AlgebraicStructures.BoundedLattice.All
import LRA.VolumeI.AlgebraicStructures.CommutativeMonoid.All
import LRA.VolumeI.AlgebraicStructures.CommutativeRing.All
import LRA.VolumeI.AlgebraicStructures.CommutativeSemigroup.All
import LRA.VolumeI.AlgebraicStructures.CommutativeSemiring.All
import LRA.VolumeI.AlgebraicStructures.CompleteOrderedField.All
import LRA.VolumeI.AlgebraicStructures.DiscreteInteger.All
import LRA.VolumeI.AlgebraicStructures.DistributiveLattice.All
import LRA.VolumeI.AlgebraicStructures.DivisionRing.All
import LRA.VolumeI.AlgebraicStructures.Field.All
import LRA.VolumeI.AlgebraicStructures.Group.All
import LRA.VolumeI.AlgebraicStructures.IntegralDomain.All
import LRA.VolumeI.AlgebraicStructures.JoinSemilattice.All
import LRA.VolumeI.AlgebraicStructures.Lattice.All
import LRA.VolumeI.AlgebraicStructures.LinearlyOrderedGroup.All
import LRA.VolumeI.AlgebraicStructures.LinearlyOrderedRing.All
import LRA.VolumeI.AlgebraicStructures.Magma.All
import LRA.VolumeI.AlgebraicStructures.MeetSemilattice.All
import LRA.VolumeI.AlgebraicStructures.Monoid.All
import LRA.VolumeI.AlgebraicStructures.NontrivialRing.All
import LRA.VolumeI.AlgebraicStructures.OrderedField.All
import LRA.VolumeI.AlgebraicStructures.OrderedGroup.All
import LRA.VolumeI.AlgebraicStructures.OrderedRing.All
import LRA.VolumeI.AlgebraicStructures.OrderedSemiring.All
import LRA.VolumeI.AlgebraicStructures.Ring.All
import LRA.VolumeI.AlgebraicStructures.Semigroup.All
import LRA.VolumeI.AlgebraicStructures.Semiring.All
import LRA.VolumeI.AlgebraicStructures.MathlibBridge
import LRA.VolumeI.AlgebraicStructures.MathlibAdapters

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
