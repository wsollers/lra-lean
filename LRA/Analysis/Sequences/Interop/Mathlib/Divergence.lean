import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.Divergence

namespace LRA.Analysis.Sequences.Interop.Mathlib

/--
`DivergesToPosInfIffTendstoAtTop` TODO

Predicate logic:

  (∀ x ∈ LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.DivergesToPosInf x ↔ Filter.Tendsto x Filter.atTop Filter.atTop

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence), ∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 M (x n) ↔ Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (Filter.instInfSet.1 (setOf fun x => Exists fun y => (fun a => Filter.principal (Set.Ici a)) y = x))

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

  (∀ x ∈ LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.DivergesToNegInf x ↔ Filter.Tendsto x Filter.atTop Filter.atBot

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence), ∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (x n) M ↔ Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (Filter.instInfSet.1 (setOf fun x => Exists fun y => (fun a => Filter.principal (Set.Iic a)) y = x))

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
