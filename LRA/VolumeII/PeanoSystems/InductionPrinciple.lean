import LRA.VolumeII.PeanoSystems.PeanoAxioms

/-!
TeX-facing induction principle for Peano systems.

This file builds the first theorem layer above the primitive Peano axioms.
Helper declarations in this file are local Lean plumbing and are not intended
as TeX-linked formal objects.
-/

namespace LRA
namespace VolumeII
namespace PeanoSystems
namespace InductionPrinciple

universe u

structure HelperPeanoData where
  carrier : Type u
  one : carrier
  successor : carrier -> carrier

def HelperPredicateOn (system : HelperPeanoData.{u}) : Type u :=
  system.carrier -> Prop

def HelperBaseCase
    (system : HelperPeanoData.{u})
    (predicate : HelperPredicateOn system) : Prop :=
  predicate system.one

def HelperSuccessorStep
    (system : HelperPeanoData.{u})
    (predicate : HelperPredicateOn system) : Prop :=
  ∀ element : system.carrier,
    predicate element -> predicate (system.successor element)

theorem InductionPrincipleForPeanoSystem
    (system : HelperPeanoData.{u})
    (predicate : HelperPredicateOn system)
    (base_case : HelperBaseCase system predicate)
    (successor_step : HelperSuccessorStep system predicate) :
    ∀ element : system.carrier, predicate element :=
  PeanoAxioms.PeanoInduction
    system.one
    system.successor
    predicate
    base_case
    successor_step

end InductionPrinciple
end PeanoSystems
end VolumeII
end LRA
