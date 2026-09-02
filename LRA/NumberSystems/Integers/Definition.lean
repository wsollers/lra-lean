import LRA.NumberSystems.Integers.Interface.Definition
import LRA.NumberSystems.Integers.Constructions.Polish
import LRA.NumberSystems.Carriers.Witnesses

namespace LRA.NumberSystems.Integers

abbrev LRA_Z_Polish := LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

abbrev LRA_Z_QuotientOrderedPairs := LRA.NumberSystems.Carriers.Z_QuotientOrderedPairs

abbrev LRA_Z_Tao := LRA.NumberSystems.Carriers.Z_Tao

abbrev LRA_Z_Mendelson := LRA.NumberSystems.Carriers.Z_Mendelson

abbrev LRA_Z := LRA_Z_Polish

abbrev LRA_Int := LRA_Z

abbrev LRA_DefaultCarrier := LRA_Int

abbrev LRA_MATHLIB_Z := Int

def LRA_Z_Pos : Type := { value : LRA_Z // (0 : LRA_Z) < value }

def LRA_Z_Nonneg : Type := { value : LRA_Z // (0 : LRA_Z) <= value }

def LRA_Z_Neg : Type := { value : LRA_Z // value < (0 : LRA_Z) }

def LRA_Z_Nonpos : Type := { value : LRA_Z // value <= (0 : LRA_Z) }

namespace LRA_Z_Pos

noncomputable instance : OfNat LRA.NumberSystems.Integers.LRA_Z_Pos 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.Integers.LRA_Z_Pos := ⟨1⟩

noncomputable instance : Add LRA.NumberSystems.Integers.LRA_Z_Pos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.Integers.LRA_Z_Pos := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

end LRA_Z_Pos

namespace LRA_Z_Nonneg

noncomputable instance : OfNat LRA.NumberSystems.Integers.LRA_Z_Nonneg 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : OfNat LRA.NumberSystems.Integers.LRA_Z_Nonneg 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.Integers.LRA_Z_Nonneg := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.Integers.LRA_Z_Nonneg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.Integers.LRA_Z_Nonneg := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

end LRA_Z_Nonneg

namespace LRA_Z_Neg

noncomputable instance : Nonempty LRA.NumberSystems.Integers.LRA_Z_Neg := ⟨⟨-1, by
  sorry
⟩⟩

noncomputable instance : Add LRA.NumberSystems.Integers.LRA_Z_Neg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

end LRA_Z_Neg

namespace LRA_Z_Nonpos

noncomputable instance : OfNat LRA.NumberSystems.Integers.LRA_Z_Nonpos 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.Integers.LRA_Z_Nonpos := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.Integers.LRA_Z_Nonpos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

end LRA_Z_Nonpos

end LRA.NumberSystems.Integers
