import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.Cauchy

namespace LRA.Analysis.Sequences.Interop.Mathlib

/-- Bridge between the native Cauchy predicate and Mathlib's `CauchySeq`. -/
theorem IsCauchyIffCauchySeq (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.IsCauchy x ↔ CauchySeq x := by
  sorry

end LRA.Analysis.Sequences.Interop.Mathlib
