import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace LRA
namespace VolumeII
namespace PeanoSystems

/--
**[Theorem - Induction Principle for a Peano System]**

If a predicate holds at the distinguished element and is preserved by
successor, then it holds for every element of the Peano system.
-/
theorem induction_principle
    (ps : PeanoSystem)
    (predicate : LRA.VolumeI.Set.LRASet ps.carrier)
    (base_case : predicate ps.one)
    (successor_step :
      forall element : ps.carrier,
        predicate element ->
        predicate (ps.successor element)) :
    forall element : ps.carrier,
      predicate element :=
  ps.induction predicate base_case successor_step

/--
**[Theorem - Subset-Based Induction Principle for a Peano System]**

Every inductive subset of a Peano system contains every element of the carrier.
-/
theorem subset_based_induction_principle
    (ps : PeanoSystem)
    (subset : LRA.VolumeI.Set.LRASet ps.carrier)
    (subset_is_inductive : inductive_subset ps subset) :
    forall element : ps.carrier,
      subset element :=
  induction_principle
    ps
    subset
    subset_is_inductive.left
    subset_is_inductive.right

end PeanoSystems
end VolumeII
end LRA

