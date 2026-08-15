import LRA.VolumeII.PeanoSystems.PeanoAxioms

/-!
TeX-facing induction principle for Peano systems.

This file builds the first theorem layer above the primitive Peano axioms.
Helper declarations in this file are local Lean plumbing and are not intended
as TeX-linked formal objects.
-/

namespace LRA.NumberSystems.PeanoSystems.InductionPrinciple

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/- Volume II label: thm:induction-principle-for-peano-system
   Lean declaration:
     LRA.NumberSystems.PeanoSystems.InductionPrinciple.InductionPrincipleForPeanoSystem
   Status: pending -/
/--
`InductionPrincipleForPeanoSystem` states induction principle for peano system.

Logical form:

```lean
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.one ∈ subset)
    (successor_step :
      ∀ element : Element,
        element ∈ subset ->
          (ps.successor element) ∈ subset) :
    ∀ element : Element, element ∈ subset
```
-/
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.one ∈ subset)
    (successor_step :
      ∀ element : Element,
        element ∈ subset ->
          (ps.successor element) ∈ subset) :
    ∀ element : Element, element ∈ subset :=
  PeanoAxioms.PeanoInduction
    ps
    subset
    base_case
    successor_step

end LRA.NumberSystems.PeanoSystems.InductionPrinciple
