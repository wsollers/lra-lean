import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences.Interop.Mathlib

/--
`ConvergesToIffTendsto` TODO

Predicate logic:

  (∀ x ∈ LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.ConvergesTo x L ↔ Filter.Tendsto x Filter.atTop (nhds L)

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ↔ Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L)

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

  (∀ x ∈ LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.IsNull x ↔ Filter.Tendsto x Filter.atTop (nhds 0)

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) ε ↔ Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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
