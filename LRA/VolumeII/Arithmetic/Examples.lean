-- LRA/VolumeII/Arithmetic/Examples.lean
-- Small executable checks for the arithmetic section.

import LRA.VolumeII.Arithmetic.AlgebraicIdentities
import LRA.VolumeII.Arithmetic.Parity
import LRA.VolumeII.Arithmetic.Fractions
import LRA.VolumeII.Arithmetic.MultiplicativeInverses

namespace LRA.NumberSystems.Arithmetic.Examples

open AlgebraicIdentities
open Parity
open Fractions
open MultiplicativeInverses

example : IsEven ((2 : Parity.N) + 4) :=
  EvenAddEven
    (by exact ⟨1, rfl⟩)
    (by exact ⟨2, rfl⟩)

example : IsOdd ((2 : Parity.N) + 5) :=
  EvenAddOdd
    (by exact ⟨1, rfl⟩)
    (by exact ⟨2, rfl⟩)

example : IsOdd ((5 : Parity.N) ^ 2) :=
  SqOddOfOdd (by exact ⟨2, rfl⟩)

example : Fractions.toQ ((-2 : Fractions.Z) * (-4)) /
      Fractions.toQ ((-2 : Fractions.Z) * 5) =
    Fractions.toQ (-4 : Fractions.Z) / Fractions.toQ (5 : Fractions.Z) := by
  exact FractionCancellation (a := -2) (m := -4) (n := 5) (by decide) (by decide)

example : ((2 : MultiplicativeInverses.Q)⁻¹ * 2 = 1) :=
  (NonzeroHasMultiplicativeInverse (a := 2) (by decide)).1

end LRA.NumberSystems.Arithmetic.Examples
