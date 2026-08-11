import LRA.VolumeII.PeanoSystems.PeanoSystem

/-!
TeX-facing Peano axioms.

These declarations record the primitive axiom artifacts already present in the
Volume II TeX Peano-system section.  The source formal environment kind is
`axiom`, so these Lean declarations are axioms as well.
-/

namespace LRA.VolumeII.PeanoSystems.PeanoAxioms

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/- Volume II label: ax:peano-base-in-set
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoBaseInSet
   Status: pending -/
axiom PeanoBaseInSet (ps : PeanoSystem Element SetObject) : True

/- Volume II label: ax:peano-successor-closure
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoSuccessorClosure
   Status: pending

   Needs a singleton-forming backend (`Singleton Element SetObject`), which
   is an additional capability beyond membership: `LRASet` and the Mathlib
   backends register it; Enderton does not yet (pairing-based singletons are
   not yet phrased as `insert`/`singleton`). -/
axiom PeanoSuccessorClosure [Singleton Element SetObject]
    (ps : PeanoSystem Element SetObject) :
    ∀ element : Element,
      ps.successor element ∈ ({ps.successor element} : SetObject)

/- Volume II label: ax:peano-base-not-successor
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoBaseNotSuccessor
   Status: pending -/
axiom PeanoBaseNotSuccessor (ps : PeanoSystem Element SetObject) :
    ∀ element : Element, ps.successor element ≠ ps.one

/- Volume II label: ax:peano-successor-injective
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoSuccessorInjective
   Status: pending -/
axiom PeanoSuccessorInjective (ps : PeanoSystem Element SetObject) :
    ∀ first second : Element,
      ps.successor first = ps.successor second -> first = second

/- Volume II label: ax:peano-induction
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoInduction
   Status: pending -/
axiom PeanoInduction (ps : PeanoSystem Element SetObject)
    (subset : SetObject) :
    ps.one ∈ subset ->
      (∀ element : Element,
        element ∈ subset ->
          ps.successor element ∈ subset) ->
      ∀ element : Element, element ∈ subset

/- Volume II label: ax:peano-system-existence
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoSystemExistence
   Status: pending

   Existence must choose its carrier: the unparameterized
   `Nonempty (PeanoSystem Element SetObject)` for *arbitrary* types would be
   false (an empty carrier admits no Peano system), so the axiom asserts
   that some backend carries one. -/
axiom PeanoSystemExistence :
    ∃ (Element : Type u) (SetObject : Type v)
      (_ : Membership Element SetObject),
      Nonempty (PeanoSystem Element SetObject)

end LRA.VolumeII.PeanoSystems.PeanoAxioms
