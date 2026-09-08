import LRA.Identity.Constructions.Axiomatic.Axioms
import LRA.Relation.Interface.Structures.Equivalence.Definition

namespace LRA.Identity.Constructions.Axiomatic.Laws

universe u

theorem Reflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  sorry

theorem Symmetry {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) : Ax_IdentityRelation y x := by
  sorry

theorem Transitivity {Carrier : Type u} {x y z : Carrier}
    (hxy : Ax_IdentityRelation x y) (hyz : Ax_IdentityRelation y z) :
    Ax_IdentityRelation x z := by
  sorry

theorem IndiscernibilityOfIdenticals {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) :
    forall P : Carrier -> Prop, P x <-> P y := by
  sorry

theorem IdentityOfIndiscernibles {Carrier : Type u} {x y : Carrier}
    (h : forall P : Carrier -> Prop, P x <-> P y) :
    Ax_IdentityRelation x y := by
  sorry

theorem LeibnizIff {Carrier : Type u} {x y : Carrier} :
    Ax_IdentityRelation x y <-> forall P : Carrier -> Prop, P x <-> P y := by
  sorry

theorem Equivalence {Carrier : Type u} :
    LRA.Relation.EquivalenceRelation
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

theorem Congruence {Carrier Codomain : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (f : Carrier -> Codomain) :
    Ax_IdentityRelation (f x) (f y) := by
  sorry

end LRA.Identity.Constructions.Axiomatic.Laws
