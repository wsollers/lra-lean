import LRA.Logic.Language.SecondOrder
import LRA.Logic.Language.SecondOrderMonadic

namespace LRA.Logic

/--
General `SOL` surface in `LRA.Logic`. The canonical `SOLLanguage` now denotes
the general second-order layer, while the monadic path remains available as a
compatibility specialization.
-/
abbrev SOLLanguage := SecondOrder.SecondOrderLanguage
abbrev MonadicSOLLanguage := SecondOrderMonadic.SecondOrderMonadicLanguage

end LRA.Logic
