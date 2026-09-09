import LRA.Set.Constructions.ZFCSet.Axioms.Union.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`UnionOverIsUnique` TODO

Predicate logic:

  ∀ {A U V : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf A U ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf A V) → V = U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A U V : Set
  Prove
    ((∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.1 A B ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 V x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.1 A B ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x))) → V = U

Logical form (Lean):

```lean
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
    V = U
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
    V = U := by
  sorry

/--
`UnionOverExistsAndIsUnique` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.ExistsAndUnique fun U => LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf A U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    ((Exists fun x => (fun U => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.1 A B ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)) x) ∧ (∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 left x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.1 A B ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)) → (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 right x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.1 A B ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)) → (LRA.Identity.Constructions.Mathlib.instIdentityRelation LRA.Set.Constructions.ZFCSet.Axioms.Set).1 left right))

Logical form (Lean):

```lean
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
