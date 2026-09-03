import LRA.ModelTheory.SecondOrder
import LRA.ModelTheory.SecondOrderMonadic
import LRA.ModelTheory.Theory

namespace LRA.ModelTheory

/--
Thin compatibility spine for second-order model theory. The canonical `SOL`
surface now names the general second-order layer, while the established monadic
path remains available as an explicit specialization.
-/
abbrev SOLModel := SecondOrder.HenkinModel
abbrev SOLHenkinModel := SecondOrder.HenkinModel
abbrev SOLFullModel := SecondOrder.FullModel
abbrev MonadicSOLHenkinModel := SecondOrderMonadic.HenkinModel
abbrev MonadicSOLFullModel := SecondOrderMonadic.FullModel

end LRA.ModelTheory
