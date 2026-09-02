import Mathlib.Data.PNat.Defs
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Carrier

namespace LRA.NumberSystems.NaturalNumbers

/-!
`NaturalNumbers` owns the naturals-family carrier choices. The redundant
successor-adjacent subjects consume these aliases until their retirement pass:

- `PositiveNaturals` -> `LRA_N_Landau`
- `ZeroBasedNaturals` -> `LRA_N_VonNeumann`
- `PresburgerArithmetic` -> `LRA_N_Presburger`
- `FirstOrderArithmetic` -> `LRA_MATHLIB_N`
-/

abbrev LRA_N_Landau :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

abbrev LRA_N_Presburger :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement

abbrev LRA_N_VonNeumann :=
  LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

abbrev LRA_N := LRA_N_Landau

abbrev LRA_Nat := LRA_N

abbrev LRA_DefaultCarrier := LRA_Nat

abbrev LRA_MATHLIB_N := Nat

abbrev LRA_MATHLIB_N_Pos := PNat

/-!
`NaturalNumbers` is already the one-based positive owner in this tree, so the
generic `N+` refinement collapses to the parent carrier instead of introducing
an extra subtype wrapper.
-/
abbrev LRA_N_Pos := LRA_N

end LRA.NumberSystems.NaturalNumbers
