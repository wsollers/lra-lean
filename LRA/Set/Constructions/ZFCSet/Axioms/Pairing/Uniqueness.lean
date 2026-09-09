import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PairSetIsUnique` TODO

Predicate logic:

  ∀ {A B P G : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet A B P ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet A B G) → G = P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B P G : Set
  Prove
    ((∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 P w ↔ Or (w = A)(w = B)) ∧ (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 G w ↔ Or (w = A)(w = B))) → G = P

Logical form (Lean):

```lean
theorem PairSetIsUnique
    {A B P G : Set}
    (PIsPairSet : IsPairSet A B P)
    (GIsPairSet : IsPairSet A B G) :
    G = P := by

  have p := Pairing A B
  have g
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
theorem PairSetIsUnique
    {A B P G : Set}
    (PIsPairSet : IsPairSet A B P)
    (GIsPairSet : IsPairSet A B G) :
    G = P := by

  have p := Pairing A B
  have g := Pairing A B



  sorry

/--
`PairingOutputExistsAndIsUnique` TODO

Predicate logic:

  ∀ (x1 x2 : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.ExistsAndUnique fun P => LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet x1 x2 P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x1 x2 : Set
  Prove
    ((Exists fun x => (fun P => ∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 P w ↔ Or (w = x1)(w = x2)) x) ∧ (∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 left w ↔ Or (w = x1)(w = x2)) → (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 right w ↔ Or (w = x1)(w = x2)) → (LRA.Identity.Constructions.Mathlib.instIdentityRelation LRA.Set.Constructions.ZFCSet.Axioms.Set).1 left right))

Logical form (Lean):

```lean
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P)
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
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
