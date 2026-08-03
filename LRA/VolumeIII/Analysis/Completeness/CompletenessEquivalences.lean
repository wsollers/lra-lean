import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.List.TFAE
import Mathlib.Data.Set.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import Mathlib.Topology.UniformSpace.Cauchy
import LRA.VolumeIII.Analysis.Completeness.AxiomOfCompleteness
import LRA.VolumeIII.Analysis.Completeness.CompletenessProcesses

/-!
Standard equivalences between order completeness and process-level completeness.
-/

namespace LRA.VolumeIII.Analysis.Completeness

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

variable (F : Type*)

/-- A preorder has the greatest-lower-bound property when every nonempty bounded-below set has an infimum. -/
def HasGreatestLowerBoundProperty [Preorder F] : Prop :=
  ∀ A : Set F, A.Nonempty → (∃ l, IsLowerBound l A) → ∃ i, IsInfimum i A

/-- Every Cauchy sequence converges. -/
def CauchySequencesConverge [UniformSpace F] : Prop :=
  ∀ a : ℕ → F, CauchySeq a → ∃ L, Filter.Tendsto a Filter.atTop (nhds L)

/-- Every bounded sequence has a convergent subsequence. -/
def BolzanoWeierstrassProperty [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, (∃ u, IsUpperBound u (Set.range a)) →
    (∃ l, IsLowerBound l (Set.range a)) →
      ∃ indexMap : ℕ → ℕ,
        StrictMono indexMap ∧ ∃ L, Filter.Tendsto (a ∘ indexMap) Filter.atTop (nhds L)

/-- If `[LinearOrder F]`, `[TopologicalSpace F]`, `[OrderTopology F]`, and `leastUpperBoundProperty
: HasLeastUpperBoundProperty F`. Then `IncreasingBoundedProcessesConverge F`. -/
theorem LubPropertyImpliesIncreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    IncreasingBoundedProcessesConverge F := by
  sorry

/-- If `[LinearOrder F]`, `[TopologicalSpace F]`, `[OrderTopology F]`, and `leastUpperBoundProperty
: HasLeastUpperBoundProperty F`. Then `DecreasingBoundedProcessesConverge F`. -/
theorem LubPropertyImpliesDecreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    DecreasingBoundedProcessesConverge F := by
  sorry

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, `[OrderTopology F]`, and `monotoneProcessConvergenceHypothesis :
IncreasingBoundedProcessesConverge F`. Then `HasLeastUpperBoundProperty F`. -/
theorem MonotoneProcessConvergenceImpliesLubProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F]
    (monotoneProcessConvergenceHypothesis : IncreasingBoundedProcessesConverge F) :
    HasLeastUpperBoundProperty F := by
  sorry

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, and `[OrderTopology F]`. Then `[HasLeastUpperBoundProperty F,
IncreasingBoundedProcessesConverge F, DecreasingBoundedProcessesConverge F].TFAE`. -/
theorem LubPropertyEquivalentToMonotoneProcessConvergence
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F].TFAE := by
  sorry

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, and `[OrderTopology F]`. Then `[HasLeastUpperBoundProperty F,
NestedIntervalProperty F].TFAE`. -/
theorem LubPropertyEquivalentToNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F, NestedIntervalProperty F].TFAE := by
  sorry

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`, `[UniformSpace
F]`, and `[OrderTopology F]`. Then `[HasLeastUpperBoundProperty F, HasGreatestLowerBoundProperty
F, IncreasingBoundedProcessesConverge F, DecreasingBoundedProcessesConverge F,
NestedIntervalProperty F, ArchimedeanReciprocalProperty, CauchySequencesConverge F,
BolzanoWeierstrassProperty F].TFAE`. -/
theorem StandardCompletenessEquivalences
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [UniformSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      HasGreatestLowerBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F,
      NestedIntervalProperty F,
      ArchimedeanReciprocalProperty,
      CauchySequencesConverge F,
      BolzanoWeierstrassProperty F].TFAE := by
  sorry

end LRA.VolumeIII.Analysis.Completeness
