import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`SeparatedSubsetIsUnique` TODO

Predicate logic:

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set} {property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop} {B C : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property B ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property C) → C = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    property : Set → Prop
    B C : Set
  Prove
    ((∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ property x)) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 C x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ property x))) → C = B

Logical form (Lean):

```lean
theorem SeparatedSubsetIsUnique
    {A : Set} {property : Set → Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B
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
theorem SeparatedSubsetIsUnique
    {A : Set} {property : Set → Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B := by
  sorry

/--
`SeparatedSubsetExistsAndIsUnique` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), LRA.Set.Constructions.ZFCSet.Axioms.ExistsAndUnique fun B => LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    property : Set → Prop
  Prove
    ((Exists fun x => (fun B => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ property x)) x) ∧ (∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 left x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ property x)) → (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 right x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ property x)) → (LRA.Identity.Constructions.Mathlib.instIdentityRelation LRA.Set.Constructions.ZFCSet.Axioms.Set).1 left right))

Logical form (Lean):

```lean
theorem SeparatedSubsetExistsAndIsUnique (A : Set) (property : Set → Prop) :
    ExistsAndUnique (fun B : Set => IsSeparatedSubset A property B)
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
theorem SeparatedSubsetExistsAndIsUnique (A : Set) (property : Set → Prop) :
    ExistsAndUnique (fun B : Set => IsSeparatedSubset A property B) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
