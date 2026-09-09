import LRA.Identity.Laws.Primitive
import LRA.Identity.Laws.Equality
import LRA.Relation.Interface.Structures.Equivalence.Definition

namespace LRA.Identity

universe u

/--
`IdentIsEquivalenceRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier], LRA.Relation.EquivalenceRelation inst.Ident

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier], ((∀ (x : Carrier), inst.Ident x x) ∧ ((∀ (x y : Carrier), inst.Ident x y → inst.Ident y x) ∧ (∀ (x y z : Carrier), inst.Ident x y → inst.Ident y z → inst.Ident x z)))

Logical form (Lean):

```lean
theorem IdentIsEquivalenceRelation {Carrier : Type u}
    [IdentityRelation Carrier] :
    LRA.Relation.EquivalenceRelation (Ident : Carrier → Carrier → Prop)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem IdentIsEquivalenceRelation {Carrier : Type u}
    [IdentityRelation Carrier] :
    LRA.Relation.EquivalenceRelation (Ident : Carrier → Carrier → Prop) := by
  sorry

/--
`EqualIsEquivalenceRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier], LRA.Relation.EquivalenceRelation inst.Equal

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier], ((∀ (x : Carrier), inst.Equal x x) ∧ ((∀ (x y : Carrier), inst.Equal x y → inst.Equal y x) ∧ (∀ (x y z : Carrier), inst.Equal x y → inst.Equal y z → inst.Equal x z)))

Logical form (Lean):

```lean
theorem EqualIsEquivalenceRelation {Carrier : Type u}
    [EqualityRelation Carrier] :
    LRA.Relation.EquivalenceRelation (Equal : Carrier → Carrier → Prop)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem EqualIsEquivalenceRelation {Carrier : Type u}
    [EqualityRelation Carrier] :
    LRA.Relation.EquivalenceRelation (Equal : Carrier → Carrier → Prop) := by
  sorry

end LRA.Identity
