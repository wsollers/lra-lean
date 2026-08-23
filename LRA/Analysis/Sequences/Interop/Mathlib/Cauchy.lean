import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.Cauchy

namespace LRA.Analysis.Sequences.Interop.Mathlib

                                                                            
theorem IsCauchyIffCauchySeq (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.IsCauchy x ↔ CauchySeq x := by
  sorry

end LRA.Analysis.Sequences.Interop.Mathlib
