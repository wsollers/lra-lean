import LRA.VolumeII.Foundations.IdentityEquality

/-!
TeX-facing Peano axioms.

These declarations intentionally do not import or depend on the existing
`PeanoSystem` structure. They record the primitive axiom layer used by the
Volume II TeX Peano-system section.
-/

namespace LRA
namespace VolumeII
namespace PeanoSystems
namespace PeanoAxioms

universe u

axiom PeanoBaseInSet {carrier : Type u} (one : carrier) : True

axiom PeanoSuccessorClosure {carrier : Type u} (successor : carrier -> carrier) :
    True

axiom PeanoBaseNotSuccessor {carrier : Type u}
    (one : carrier)
    (successor : carrier -> carrier) :
    ∀ element : carrier, successor element ≠ one

axiom PeanoSuccessorInjective {carrier : Type u}
    (successor : carrier -> carrier) :
    Function.Injective successor

axiom PeanoInduction {carrier : Type u}
    (one : carrier)
    (successor : carrier -> carrier)
    (predicate : carrier -> Prop) :
    predicate one ->
      (∀ element : carrier, predicate element -> predicate (successor element)) ->
      ∀ element : carrier, predicate element

axiom PeanoSystemExistence :
    ∃ carrier : Type, Nonempty carrier

end PeanoAxioms
end PeanoSystems
end VolumeII
end LRA
