import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Relation.Interface.Structures.Equivalence.Definition

namespace LRA.Identity.Constructions.Mathlib.Laws

universe u

theorem Reflexivity {Carrier : Type u} (x : Carrier) : NativeIdentity x x := by
  sorry

theorem Symmetry {Carrier : Type u} {x y : Carrier}
    (h : NativeIdentity x y) : NativeIdentity y x := by
  sorry

theorem Transitivity {Carrier : Type u} {x y z : Carrier}
    (hxy : NativeIdentity x y) (hyz : NativeIdentity y z) :
    NativeIdentity x z := by
  sorry

theorem IndiscernibilityOfIdenticals {Carrier : Type u} {x y : Carrier}
    (h : NativeIdentity x y) : forall P : Carrier -> Prop, P x <-> P y := by
  sorry

theorem IdentityOfIndiscernibles {Carrier : Type u} {x y : Carrier}
    (h : forall P : Carrier -> Prop, P x <-> P y) : NativeIdentity x y := by
  sorry

theorem LeibnizIff {Carrier : Type u} {x y : Carrier} :
    NativeIdentity x y <-> forall P : Carrier -> Prop, P x <-> P y := by
  sorry

theorem Equivalence {Carrier : Type u} :
    LRA.Relation.EquivalenceRelation
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

theorem Congruence {Carrier Codomain : Type u} {x y : Carrier}
    (h : NativeIdentity x y) (f : Carrier -> Codomain) :
    NativeIdentity (f x) (f y) := by
  sorry

end LRA.Identity.Constructions.Mathlib.Laws
