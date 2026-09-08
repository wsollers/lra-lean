import LRA.Identity.Interface.ZeroOrder.LStructure

namespace LRA.Identity.Interface.ZeroOrder

/-- A truth assignment for a zero-order syntax. -/
structure Model (L : LStructure) where
  Holds : L.Formula -> Prop

end LRA.Identity.Interface.ZeroOrder
