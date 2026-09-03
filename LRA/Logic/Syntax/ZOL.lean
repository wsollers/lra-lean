import LRA.Logic.Syntax.Propositional

namespace LRA.Logic

/--
Thin compatibility spine for zero-order/propositional syntax. This preserves
the existing propositional implementation path while exposing a standardized
`ZOL` import surface.
-/
abbrev ZOLFormula := Propositional.Formula

end LRA.Logic
