import LRA.Identity.Interface.ZeroOrder.Model

namespace LRA.Identity.Interface.ZeroOrder

/-- The pure-syntax identity interface.

The two fields are the zero-order identity axioms: syntactic reflexivity and
preservation of truth by syntactic identity.
-/
structure Theory (L : LStructure) (M : Model L) : Prop where
  reflexivity : forall formula : L.Formula, formula = formula
  substitution : forall {left right : L.Formula}, left = right ->
    (M.Holds left <-> M.Holds right)

end LRA.Identity.Interface.ZeroOrder
