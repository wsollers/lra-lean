import LRA.VolumeI.AlgebraicStructures.Additive
import LRA.VolumeI.AlgebraicStructures.Multiplicative
import LRA.VolumeI.AlgebraicStructures.Distributive
import LRA.VolumeI.AlgebraicStructures.Order
import LRA.VolumeI.AlgebraicStructures.Discrete
import LRA.VolumeI.AlgebraicStructures.Bundles
import LRA.VolumeI.AlgebraicStructures.Completeness
import LRA.VolumeI.AlgebraicStructures.MathlibBridge
import LRA.VolumeI.AlgebraicStructures.MathlibAdapters

/-!
Aggregate import for the algebraic-structures layer: the Set chapter's
machine/certificate architecture applied to algebra.

- **Machines**: Lean core's notation classes (`Add`, `Mul`, `Neg`,
  `Sub`, `Inv`, `Div`, `LE`, `LT`, numerals via `OfNat R 0/1`). A carrier
  is "a ring of Xs" by registering operations on `X`, exactly as a type
  becomes a set backend -- ring of reals, ring of sets, one theorem
  surface.
- **Certificates**: small `Prop` mixins (`Additive.lean`,
  `Multiplicative.lean`, `Distributive.lean`, `Order.lean`), so
  attribute combinations are brackets, not a 2^N class hierarchy, and
  every theorem can state exactly the laws it uses. Data diamonds cannot
  arise: operations live in single-field core classes, laws in `Prop`.
- **Bundles** (`Bundles.lean`): `class abbrev` conjunctions
  (`RingLaws`, `FieldLaws`, `OrderedFieldLaws`, ...) -- ergonomic names,
  no new fields.
- **Completeness** (`Completeness.lean`): backend-relative, quantifying
  over a chosen `SetObject` -- the second-order law done the same way
  `PeanoSystem` induction is.
- **Mathlib bridge** (`MathlibBridge.lean`): generic instances deriving
  every certificate from Mathlib's classes, so `ℕ`, `ℤ`, `ℚ`, `ℝ`, `ℂ`,
  and every other Mathlib carrier is certified once, with zero `sorry`.

Capability honesty throughout: `ℕ` never registers `Neg`, so `-n` does
not elaborate; a field's `0⁻¹ = 0` convention is a stated law, not a
hidden fact. This layer supersedes the bundled hierarchies in
`AlgebraicStructures`, `UniversalAlgebra/Models/AbstractLaws`, and the symbol-level
`Algebra/Signatures/Algebraic`; those migrate here over time.
-/
