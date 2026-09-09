import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.Cauchy

namespace LRA.Analysis.Sequences.Interop.Mathlib

/--
`IsCauchyIffCauchySeq` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.IsCauchy x ↔ CauchySeq x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : LRA.Analysis.Sequences.RealSequence
  Prove
    LRA.Analysis.Sequences.IsCauchy x ↔ CauchySeq x

Logical form (Lean):

```lean
theorem IsCauchyIffCauchySeq (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.IsCauchy x ↔ CauchySeq x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem IsCauchyIffCauchySeq (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.IsCauchy x ↔ CauchySeq x := by
  sorry
end LRA.Analysis.Sequences.Interop.Mathlib
