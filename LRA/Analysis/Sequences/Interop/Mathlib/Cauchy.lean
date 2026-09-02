import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Sequences.Cauchy

namespace LRA.Analysis.Sequences.Interop.Mathlib

/--
`IsCauchyIffCauchySeq` TODO

Predicate logic:

  (∀ x ∈ LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.IsCauchy x ↔ CauchySeq x

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ↔ ({ sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ }.NeBot ∧ Filter.instPartialOrder.toLE.1 (Filter.instSProd.1 { sets := setOf fun x_1 => Set.instMembership.mem Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } { sets := setOf fun x_1 => Set.instMembership.mem Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ }) Real.pseudoMetricSpace.toUniformSpace.2)

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
