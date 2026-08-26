import LRA.Identity.Constructions.Leibniz.Axioms
import LRA.Identity.Interface.ModelTheory.Theory

namespace LRA.Identity

universe u

theorem LeibnizEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier where
  reflexivity := EqualityReflexivity
  leibniz := by
    intro x y objectsAreIdentical property
    exact LeibnizLaw objectsAreIdentical property

end LRA.Identity
