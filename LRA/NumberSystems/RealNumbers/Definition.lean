import Mathlib.Data.NNReal.Defs
import Mathlib.Data.ENNReal.Basic
import Mathlib.Data.EReal.Basic
import LRA.NumberSystems.RealNumbers.Interface.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic
import LRA.NumberSystems.Carriers.Witnesses

namespace LRA.NumberSystems.RealNumbers

abbrev LRA_R_Cantor := LRA.NumberSystems.Carriers.R_Cantor

abbrev LRA_R_Dedekind := LRA.NumberSystems.Carriers.R_Dedekind

abbrev LRA_R_PrimitiveIntervals := LRA.NumberSystems.Carriers.R_PrimitiveIntervals

abbrev LRA_R_EffectiveCauchy := LRA.NumberSystems.Carriers.R_EffectiveCauchy

abbrev LRA_R_Cauchy := LRA.NumberSystems.Carriers.R_Cauchy

abbrev LRA_R_Dyadic := LRA.NumberSystems.RealNumbers.Dyadic.Expansion

abbrev LRA_R := LRA_R_Cauchy

abbrev LRA_Real := LRA_R

abbrev LRA_DefaultCarrier := LRA_Real

abbrev LRA_MATHLIB_R := Real

abbrev LRA_MATHLIB_R_Nonneg := NNReal

abbrev LRA_MATHLIB_R_Pos := LRA_MATHLIB_R_Nonnegˣ

abbrev LRA_MATHLIB_R_Extended := EReal

abbrev LRA_MATHLIB_R_ExtendedNonneg := ENNReal

def LRA_R_Pos : Type := { value : LRA_R // (0 : LRA_R) < value }

def LRA_R_Nonneg : Type := { value : LRA_R // (0 : LRA_R) <= value }

def LRA_R_Neg : Type := { value : LRA_R // value < (0 : LRA_R) }

def LRA_R_Nonpos : Type := { value : LRA_R // value <= (0 : LRA_R) }

namespace LRA_R_Pos

noncomputable instance : OfNat LRA.NumberSystems.RealNumbers.LRA_R_Pos 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RealNumbers.LRA_R_Pos := ⟨1⟩

noncomputable instance : Add LRA.NumberSystems.RealNumbers.LRA_R_Pos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.RealNumbers.LRA_R_Pos := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Inv LRA.NumberSystems.RealNumbers.LRA_R_Pos := ⟨
  fun value => ⟨value.1⁻¹, by
    sorry
  ⟩
⟩

end LRA_R_Pos

namespace LRA_R_Nonneg

noncomputable instance : OfNat LRA.NumberSystems.RealNumbers.LRA_R_Nonneg 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : OfNat LRA.NumberSystems.RealNumbers.LRA_R_Nonneg 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RealNumbers.LRA_R_Nonneg := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.RealNumbers.LRA_R_Nonneg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.RealNumbers.LRA_R_Nonneg := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

end LRA_R_Nonneg

namespace LRA_R_Neg

noncomputable instance : Nonempty LRA.NumberSystems.RealNumbers.LRA_R_Neg := ⟨⟨-1, by
  sorry
⟩⟩

noncomputable instance : Add LRA.NumberSystems.RealNumbers.LRA_R_Neg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Inv LRA.NumberSystems.RealNumbers.LRA_R_Neg := ⟨
  fun value => ⟨value.1⁻¹, by
    sorry
  ⟩
⟩

end LRA_R_Neg

namespace LRA_R_Nonpos

noncomputable instance : OfNat LRA.NumberSystems.RealNumbers.LRA_R_Nonpos 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RealNumbers.LRA_R_Nonpos := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.RealNumbers.LRA_R_Nonpos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

end LRA_R_Nonpos

end LRA.NumberSystems.RealNumbers
