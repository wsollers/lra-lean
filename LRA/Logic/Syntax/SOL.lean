import LRA.Logic.Syntax.SecondOrder
import LRA.Logic.Syntax.SecondOrderMonadic

namespace LRA.Logic

/--
General `SOL` syntax in `LRA.Logic`. The canonical `SOLFormula` now denotes the
general second-order formula layer, while the monadic path remains available as
an explicit specialization.
-/
abbrev SOLTerm := SecondOrder.Term
abbrev SOLFormula := SecondOrder.Formula
abbrev MonadicSOLFormula := SecondOrderMonadic.SOFormula

end LRA.Logic
