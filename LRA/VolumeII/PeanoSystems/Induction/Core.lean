import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace LRA.VolumeII.PeanoSystems

/--
**[Theorem - Induction Principle for a Peano System]**

If a predicate holds at the distinguished element and is preserved by
successor, then it holds for every element of the Peano system.

Mathematical statement (Lean): `theorem PeanoSystemInductionPrinciple (ps : PeanoSystem) (subset : ps.setInterface.SetObject) (base_case : ps.setInterface.Member ps.one subset) (successor_step : forall element : ps.carrier, ps.setInterface.Member element subset -> ps.setInterface.Member (ps.successor element) subset) : forall element : ps.carrier...`.
-/
theorem PeanoSystemInductionPrinciple
    (ps : PeanoSystem)
    (subset : ps.setInterface.SetObject)
    (base_case : ps.setInterface.Member ps.one subset)
    (successor_step :
      forall element : ps.carrier,
        ps.setInterface.Member element subset ->
        ps.setInterface.Member (ps.successor element) subset) :
    forall element : ps.carrier,
      ps.setInterface.Member element subset := by
  sorry

theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem)
    (subset : ps.setInterface.SetObject)
    (base_case : ps.setInterface.Member ps.one subset)
    (successor_step :
      forall element : ps.carrier,
        ps.setInterface.Member element subset ->
        ps.setInterface.Member (ps.successor element) subset) :
    forall element : ps.carrier,
      ps.setInterface.Member element subset := by
  sorry

/--
**[Theorem - Subset-Based Induction Principle for a Peano System]**

Every inductive subset of a Peano system contains every element of the carrier.

Mathematical statement (Lean): `theorem SubsetBasedInductionPrinciple (ps : PeanoSystem) (subset : ps.setInterface.SetObject) (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) : forall element : ps.carrier, ps.setInterface.Member element subset`.
-/
theorem SubsetBasedInductionPrinciple
    (ps : PeanoSystem)
    (subset : ps.setInterface.SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    forall element : ps.carrier,
      ps.setInterface.Member element subset := by
  sorry

theorem StrongInductionOnPeanoSystem (ps : PeanoSystem) : True := by
  sorry

theorem PeanoMinimality
    (ps : PeanoSystem)
    (subset : ps.setInterface.SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    ∀ element : ps.carrier, ps.setInterface.Member element subset := by
  sorry

theorem SuccessorClosedSubsetMinimality
    (ps : PeanoSystem)
    (subset : ps.setInterface.SetObject)
    (contains_one : ps.setInterface.Member ps.one subset)
    (successor_closed : SuccessorClosedSubset ps subset) :
    ∀ element : ps.carrier, ps.setInterface.Member element subset := by
  sorry

end LRA.VolumeII.PeanoSystems
