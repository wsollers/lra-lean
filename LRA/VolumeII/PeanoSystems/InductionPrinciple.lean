import LRA.VolumeII.PeanoSystems.PeanoAxioms

/-!
TeX-facing induction principle for Peano systems.

This file builds the first theorem layer above the primitive Peano axioms.
Helper declarations in this file are local Lean plumbing and are not intended
as TeX-linked formal objects.
-/

namespace LRA.VolumeII.PeanoSystems.InductionPrinciple

/- Volume II label: thm:induction-principle-for-peano-system
   Lean declaration:
     LRA.VolumeII.PeanoSystems.InductionPrinciple.InductionPrincipleForPeanoSystem
   Status: pending -/
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem)
    (subset : ps.setInterface.SetObject)
    (base_case : ps.setInterface.Member ps.one subset)
    (successor_step :
      ∀ element : ps.carrier,
        ps.setInterface.Member element subset ->
          ps.setInterface.Member (ps.successor element) subset) :
    ∀ element : ps.carrier, ps.setInterface.Member element subset :=
  PeanoAxioms.PeanoInduction
    ps
    subset
    base_case
    successor_step

end LRA.VolumeII.PeanoSystems.InductionPrinciple
