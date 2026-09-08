import LRA.Identity.Interface.FirstOrder.Model
import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Interface.FirstOrder

/-- The strictly first-order identity interface.

Its two axioms are reflexivity and the Leibniz schema restricted to predicates
definable in the chosen first-order model.
-/
structure Theory (L : LStructure) (Variable : Type) [DecidableEq Variable]
    (M : Model L) : Prop where
  reflexivity : forall x, M.Identity x x
  leibniz : LRA.Identity.Logic.FOL.LeibnizSchema
    (LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation)
    M.Identity

end LRA.Identity.Interface.FirstOrder
