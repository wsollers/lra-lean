import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace Peano

theorem induction_principle
    (ps : PeanoSystem)
    (predicate : ps.carrier → Prop)
    (base_case : predicate ps.one)
    (successor_step :
      ∀ element : ps.carrier,
        predicate element →
        predicate (ps.successor element)) :
    ∀ element : ps.carrier,
      predicate element :=
  ps.induction predicate base_case successor_step

theorem subset_based_induction_principle
    (ps : PeanoSystem)
    (subset : ps.carrier → Prop)
    (subset_is_inductive : inductive_subset ps subset) :
    ∀ element : ps.carrier,
      subset element :=
  induction_principle
    ps
    subset
    subset_is_inductive.left
    subset_is_inductive.right

end Peano
