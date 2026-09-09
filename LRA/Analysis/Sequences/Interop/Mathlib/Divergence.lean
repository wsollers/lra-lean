import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.Divergence

namespace LRA.Analysis.Sequences.Interop.Mathlib

/--
`DivergesToPosInfIffTendstoAtTop` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.DivergesToPosInf x ↔ Filter.Tendsto x Filter.atTop Filter.atTop

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : LRA.Analysis.Sequences.RealSequence
  Prove
    LRA.Analysis.Sequences.DivergesToPosInf x ↔ Filter.Tendsto x Filter.atTop Filter.atTop

Logical form (Lean):

```lean
theorem DivergesToPosInfIffTendstoAtTop (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.DivergesToPosInf x ↔ Filter.Tendsto x Filter.atTop Filter.atTop
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
theorem DivergesToPosInfIffTendstoAtTop (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.DivergesToPosInf x ↔ Filter.Tendsto x Filter.atTop Filter.atTop := by
  sorry
/--
`DivergesToNegInfIffTendstoAtBot` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.DivergesToNegInf x ↔ Filter.Tendsto x Filter.atTop Filter.atBot

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : LRA.Analysis.Sequences.RealSequence
  Prove
    LRA.Analysis.Sequences.DivergesToNegInf x ↔ Filter.Tendsto x Filter.atTop Filter.atBot

Logical form (Lean):

```lean
theorem DivergesToNegInfIffTendstoAtBot (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.DivergesToNegInf x ↔ Filter.Tendsto x Filter.atTop Filter.atBot
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
theorem DivergesToNegInfIffTendstoAtBot (x : LRA.Analysis.Sequences.RealSequence) :
    LRA.Analysis.Sequences.DivergesToNegInf x ↔ Filter.Tendsto x Filter.atTop Filter.atBot := by
  sorry
end LRA.Analysis.Sequences.Interop.Mathlib
