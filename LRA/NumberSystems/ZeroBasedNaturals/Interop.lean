import LRA.NumberSystems.ZeroBasedNaturals.Constructions.Mathlib

namespace LRA.NumberSystems.ZeroBasedNaturals.Interop

def toMathlib :
    LRA.NumberSystems.ZeroBasedNaturals.Constructions.Mathlib.LRA_MathlibCarrier → Nat :=
  id

def fromMathlib :
    Nat → LRA.NumberSystems.ZeroBasedNaturals.Constructions.Mathlib.LRA_MathlibCarrier :=
  id

end LRA.NumberSystems.ZeroBasedNaturals.Interop
