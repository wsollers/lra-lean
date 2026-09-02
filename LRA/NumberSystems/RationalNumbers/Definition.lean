import Mathlib.Data.NNRat.Defs
import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.Carriers.Witnesses

namespace LRA.NumberSystems.RationalNumbers

abbrev LRA_Q_RationalQuotientFractions :=
  LRA.NumberSystems.Carriers.Q_RationalQuotientFractions

abbrev LRA_Q := LRA_Q_RationalQuotientFractions

abbrev LRA_Rat := LRA_Q

abbrev LRA_DefaultCarrier := LRA_Rat

abbrev LRA_MATHLIB_Q := Rat

abbrev LRA_MATHLIB_Q_Nonneg := NNRat

abbrev LRA_MATHLIB_Q_Pos := LRA_MATHLIB_Q_Nonnegˣ

def LRA_Q_Pos : Type := { value : LRA_Q // (0 : LRA_Q) < value }

def LRA_Q_Nonneg : Type := { value : LRA_Q // (0 : LRA_Q) <= value }

def LRA_Q_Neg : Type := { value : LRA_Q // value < (0 : LRA_Q) }

def LRA_Q_Nonpos : Type := { value : LRA_Q // value <= (0 : LRA_Q) }

namespace LRA_Q_Pos

noncomputable instance : OfNat LRA.NumberSystems.RationalNumbers.LRA_Q_Pos 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := ⟨1⟩

noncomputable instance : Add LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Inv LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := ⟨
  fun value => ⟨value.1⁻¹, by
    sorry
  ⟩
⟩

end LRA_Q_Pos

namespace LRA_Q_Nonneg

noncomputable instance : OfNat LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : OfNat LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

end LRA_Q_Nonneg

namespace LRA_Q_Neg

noncomputable instance : Nonempty LRA.NumberSystems.RationalNumbers.LRA_Q_Neg := ⟨⟨-1, by
  sorry
⟩⟩

noncomputable instance : Add LRA.NumberSystems.RationalNumbers.LRA_Q_Neg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Inv LRA.NumberSystems.RationalNumbers.LRA_Q_Neg := ⟨
  fun value => ⟨value.1⁻¹, by
    sorry
  ⟩
⟩

end LRA_Q_Neg

namespace LRA_Q_Nonpos

noncomputable instance : OfNat LRA.NumberSystems.RationalNumbers.LRA_Q_Nonpos 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RationalNumbers.LRA_Q_Nonpos := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.RationalNumbers.LRA_Q_Nonpos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

end LRA_Q_Nonpos

end LRA.NumberSystems.RationalNumbers
