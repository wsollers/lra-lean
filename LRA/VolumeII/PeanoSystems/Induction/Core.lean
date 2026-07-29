import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace LRA.VolumeII.PeanoSystems

/--
**[Theorem - Induction Principle for a Peano System]**

If a predicate holds at the distinguished element and is preserved by
successor, then it holds for every element of the Peano system.

Mathematical statement (Lean): `theorem PeanoSystemInductionPrinciple (ps : PeanoSystem) (predicate : LRA.VolumeI.Set.LRASet ps.carrier) (base_case : predicate ps.one) (successor_step : forall element : ps.carrier, predicate element -> predicate (ps.successor element)) : forall element : ps.carrier...`.
-/
theorem PeanoSystemInductionPrinciple
    (ps : PeanoSystem)
    (predicate : LRA.VolumeI.Set.LRASet ps.carrier)
    (base_case : predicate ps.one)
    (successor_step :
      forall element : ps.carrier,
        predicate element ->
        predicate (ps.successor element)) :
    forall element : ps.carrier,
      predicate element := by
  sorry

/--
**[Theorem - Subset-Based Induction Principle for a Peano System]**

Every inductive subset of a Peano system contains every element of the carrier.

Mathematical statement (Lean): `theorem SubsetBasedInductionPrinciple (ps : PeanoSystem) (subset : LRA.VolumeI.Set.LRASet ps.carrier) (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) : forall element : ps.carrier, subset element`.
-/
theorem SubsetBasedInductionPrinciple
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    forall element : ps.carrier,
      subset element := by
  sorry

theorem StrongInductionOnPeanoSystem (ps : PeanoSystem) : True := by
  sorry

theorem PeanoMinimality
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    ∀ element : ps.carrier, subset element := by
  sorry

end LRA.VolumeII.PeanoSystems
