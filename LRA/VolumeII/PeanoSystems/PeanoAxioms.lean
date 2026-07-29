import LRA.VolumeII.PeanoSystems.PeanoSystem

/-!
TeX-facing Peano axioms.

These declarations record the primitive axiom artifacts already present in the
Volume II TeX Peano-system section.  The source formal environment kind is
`axiom`, so these Lean declarations are axioms as well.
-/

namespace LRA.VolumeII.PeanoSystems.PeanoAxioms

universe u

/- Volume II label: ax:peano-base-in-set
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoBaseInSet
   Status: pending -/
axiom PeanoBaseInSet (ps : PeanoSystem) : True

/- Volume II label: ax:peano-successor-closure
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoSuccessorClosure
   Status: pending -/
axiom PeanoSuccessorClosure (ps : PeanoSystem) :
    ∀ element : ps.carrier, ps.successor element ∈ Set.univ

/- Volume II label: ax:peano-base-not-successor
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoBaseNotSuccessor
   Status: pending -/
axiom PeanoBaseNotSuccessor (ps : PeanoSystem) :
    ∀ element : ps.carrier, ps.successor element ≠ ps.one

/- Volume II label: ax:peano-successor-injective
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoSuccessorInjective
   Status: pending -/
axiom PeanoSuccessorInjective (ps : PeanoSystem) :
    ∀ first second : ps.carrier,
      ps.successor first = ps.successor second -> first = second

/- Volume II label: ax:peano-induction
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoInduction
   Status: pending -/
axiom PeanoInduction (ps : PeanoSystem)
    (predicate : LRA.VolumeI.Set.LRASet ps.carrier) :
    predicate ps.one ->
      (∀ element : ps.carrier, predicate element -> predicate (ps.successor element)) ->
      ∀ element : ps.carrier, predicate element

/- Volume II label: ax:peano-system-existence
   Lean declaration: LRA.VolumeII.PeanoSystems.PeanoAxioms.PeanoSystemExistence
   Status: pending -/
axiom PeanoSystemExistence : Nonempty PeanoSystem

end LRA.VolumeII.PeanoSystems.PeanoAxioms
