import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Identity

universe u

abbrev PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

abbrev EqualityRelation (Carrier : Type u) : Carrier → Carrier → Prop :=
  LRA.Relation.IdentityRelation Carrier

end LRA.Identity
