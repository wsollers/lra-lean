import LRA.Identity.Interface.FirstOrder.LStructure
import LRA.Logic.Semantics.Interpretation

namespace LRA.Identity.Interface.FirstOrder

/-- A first-order model exposes its language, interpretation, and interpreted
identity relation. -/
structure Model (L : LStructure) where
  interpretation : LRA.Logic.FirstOrder.Interpretation L.signature
  Identity : interpretation.Domain -> interpretation.Domain -> Prop

end LRA.Identity.Interface.FirstOrder
