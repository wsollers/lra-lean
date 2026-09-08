import LRA.Identity.Interface.Identity

namespace LRA.Identity.Logic.SOL

universe u

/-- The unary predicate domain admitted by a Henkin second-order model. -/
structure HenkinPredicateDomain (Carrier : Type u) where
  Admissible : (Carrier -> Prop) -> Prop

/-- Identity under Henkin semantics is relative to the model's admitted
predicate domain.

Logical form: `IdentityTheory domain.Admissible R`.
-/
abbrev HenkinIdentityTheory {Carrier : Type u}
    (domain : HenkinPredicateDomain Carrier)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  LRA.Identity.IdentityTheory domain.Admissible R

/-- Full second-order identity quantifies over every predicate on the carrier.

Logical form: `IdentityTheory FullLeibniz R`.
-/
abbrev FullIdentityTheory {Carrier : Type u}
    (R : Carrier -> Carrier -> Prop) : Prop :=
  LRA.Identity.IdentityTheory (LRA.Identity.FullLeibniz Carrier) R

/-- The admitted Henkin predicates separate points when agreement on all of
them entails ambient equality.

Logical form:
`forall x y, (forall P, Admissible P -> (P x <-> P y)) -> x = y`.
-/
def HenkinPredicatesSeparatePoints {Carrier : Type u}
    (domain : HenkinPredicateDomain Carrier) : Prop :=
  forall x y, (forall P, domain.Admissible P -> (P x <-> P y)) -> x = y

end LRA.Identity.Logic.SOL
