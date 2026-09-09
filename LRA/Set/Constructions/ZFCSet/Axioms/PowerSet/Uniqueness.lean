import LRA.Set.Constructions.ZFCSet.Axioms.PowerSet.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PowerSetOfIsUnique` TODO

Predicate logic:

  ∀ {A P Q : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A P ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A Q) → Q = P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A P Q : Set
  Prove
    ((∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 Q x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y)) → Q = P

Logical form (Lean):

```lean
theorem PowerSetOfIsUnique
    {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P)
    (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P
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
theorem PowerSetOfIsUnique
    {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P)
    (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P := by
  sorry

/--
`PowerSetOfExistsAndIsUnique` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.ExistsAndUnique fun P => LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    ((Exists fun x => (fun P => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y) x) ∧ (∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 left x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y) → (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 right x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y) → (LRA.Identity.Constructions.Mathlib.instIdentityRelation LRA.Set.Constructions.ZFCSet.Axioms.Set).1 left right))

Logical form (Lean):

```lean
theorem PowerSetOfExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun P : Set => IsPowerSetOf A P)
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
theorem PowerSetOfExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun P : Set => IsPowerSetOf A P) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
