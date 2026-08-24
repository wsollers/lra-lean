import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Identity

universe u

/--
`PropositionalEquality` TODO

Predicate logic:

  ∀ {Carrier : Type u} (left right : Carrier), left = right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (left right : Carrier), left = right

Logical form (Lean):

```lean
abbrev PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/--
`EqualityRelation` TODO

Predicate logic:

  ∀ (Carrier : Type u) (a a_1 : Carrier), a = a_1

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (a a_1 : Carrier), a = a_1

Logical form (Lean):

```lean
abbrev EqualityRelation (Carrier : Type u) : Carrier → Carrier → Prop :=
  LRA.Relation.IdentityRelation Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev EqualityRelation (Carrier : Type u) : Carrier → Carrier → Prop :=
  LRA.Relation.IdentityRelation Carrier

end LRA.Identity
