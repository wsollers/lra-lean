import LRA.VolumeII.PeanoSystems.PeanoAxioms

/-!
TeX-facing induction principle for Peano systems.

This file builds the first theorem layer above the primitive Peano axioms.
Helper declarations in this file are local Lean plumbing and are not intended
as TeX-linked formal objects.
-/

namespace LRA.VolumeII.PeanoSystems
namespace InductionPrinciple

/- Volume II label: thm:induction-principle-for-peano-system
   Lean declaration:
     LRA.VolumeII.PeanoSystems.InductionPrinciple.InductionPrincipleForPeanoSystem
   Status: pending -/
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem)
    (predicate : LRA.VolumeI.Set.LRASet ps.carrier)
    (base_case : predicate ps.one)
    (successor_step :
      ∀ element : ps.carrier,
        predicate element -> predicate (ps.successor element)) :
    ∀ element : ps.carrier, predicate element :=
  PeanoAxioms.PeanoInduction
    ps
    predicate
    base_case
    successor_step

end InductionPrinciple
end LRA.VolumeII.PeanoSystems
