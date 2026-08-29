import LRA.NumberSystems.PositiveNaturals.Constructions.Mathlib

namespace LRA.NumberSystems.PositiveNaturals.Interop

def toMathlib :
    LRA.NumberSystems.PositiveNaturals.Constructions.Mathlib.LRA_MathlibCarrier → Nat :=
  id

def fromMathlib :
    Nat → LRA.NumberSystems.PositiveNaturals.Constructions.Mathlib.LRA_MathlibCarrier :=
  id

end LRA.NumberSystems.PositiveNaturals.Interop
