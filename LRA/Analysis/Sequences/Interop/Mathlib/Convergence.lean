import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences.Interop.Mathlib

                                                                                 
theorem ConvergesToIffTendsto (x : LRA.Analysis.Sequences.RealSequence) (L : ℝ) :
    LRA.Analysis.Sequences.ConvergesTo x L ↔ Filter.Tendsto x Filter.atTop (nhds L) := by
  sorry

                                                                            
theorem IsNullIffTendstoZero (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.IsNull x ↔ Filter.Tendsto x Filter.atTop (nhds 0) := by
  sorry

end LRA.Analysis.Sequences.Interop.Mathlib
