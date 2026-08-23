import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.Divergence

namespace LRA.Analysis.Sequences.Interop.Mathlib

                                                                              
theorem DivergesToPosInfIffTendstoAtTop (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.DivergesToPosInf x ↔ Filter.Tendsto x Filter.atTop Filter.atTop := by
  sorry

                                                                              
theorem DivergesToNegInfIffTendstoAtBot (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.DivergesToNegInf x ↔ Filter.Tendsto x Filter.atTop Filter.atBot := by
  sorry

end LRA.Analysis.Sequences.Interop.Mathlib
