import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences.Interop.Mathlib

/--
`ConvergesToIffTendsto` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), LRA.Analysis.Sequences.ConvergesTo x L ↔ Filter.Tendsto x Filter.atTop (nhds L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : LRA.Analysis.Sequences.RealSequence
    L : ℝ
  Prove
    LRA.Analysis.Sequences.ConvergesTo x L ↔ Filter.Tendsto x Filter.atTop (nhds L)

Logical form (Lean):

```lean
theorem ConvergesToIffTendsto (x : LRA.Analysis.Sequences.RealSequence) (L : ℝ) :
    LRA.Analysis.Sequences.ConvergesTo x L ↔ Filter.Tendsto x Filter.atTop (nhds L)
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
theorem ConvergesToIffTendsto (x : LRA.Analysis.Sequences.RealSequence) (L : ℝ) :
    LRA.Analysis.Sequences.ConvergesTo x L ↔ Filter.Tendsto x Filter.atTop (nhds L) := by
  sorry
/--
`IsNullIffTendstoZero` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.IsNull x ↔ Filter.Tendsto x Filter.atTop (nhds 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : LRA.Analysis.Sequences.RealSequence
  Prove
    LRA.Analysis.Sequences.IsNull x ↔ Filter.Tendsto x Filter.atTop (nhds 0)

Logical form (Lean):

```lean
theorem IsNullIffTendstoZero (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.IsNull x ↔ Filter.Tendsto x Filter.atTop (nhds 0)
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
theorem IsNullIffTendstoZero (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.IsNull x ↔ Filter.Tendsto x Filter.atTop (nhds 0) := by
  sorry
end LRA.Analysis.Sequences.Interop.Mathlib
