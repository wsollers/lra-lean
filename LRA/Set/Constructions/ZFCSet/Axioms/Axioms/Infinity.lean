import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Infinity` TODO

Predicate logic:

  ∃ A ∈ ZFCSet, ∃ empty ∈ ZFCSet, empty ∈ A ∧ ∀ w : ZFCSet, w ∉ empty ∧ ∀ x : ZFCSet, x ∈ A → ∃ successor ∈ ZFCSet, successor ∈ A ∧ ∀ w : ZFCSet, w ∈ successor ↔ w ∈ x ∨ w = x end LRA.Set.Constructions.ZFCSet.Axioms

Predicate logic (unfolded):

  Exists fun A => (Exists fun empty => (LRA.Set.instMembershipZFCSet.1 A empty ∧ ∀ (w : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 empty w → False) ∧ ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 A x → Exists fun successor => (LRA.Set.instMembershipZFCSet.1 A successor ∧ ∀ (w : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 successor w ↔ Or (LRA.Set.instMembershipZFCSet.1 x w) (w = x)))

Logical form (Lean):

```lean
axiom Infinity :
  ∃ A : ZFCSet,
    (∃ empty : ZFCSet, empty ∈ A ∧ ∀ w : ZFCSet, w ∉ empty) ∧
    ∀ x : ZFCSet, x ∈ A →
      ∃ successor : ZFCSet,
        successor ∈ A ∧
        ∀ w : ZFCSet, w ∈ successor ↔ w ∈ x ∨ w = x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr, use

-/
axiom Infinity :
  ∃ A : ZFCSet,
    (∃ empty : ZFCSet, empty ∈ A ∧ ∀ w : ZFCSet, w ∉ empty) ∧
    ∀ x : ZFCSet, x ∈ A →
      ∃ successor : ZFCSet,
        successor ∈ A ∧
        ∀ w : ZFCSet, w ∈ successor ↔ w ∈ x ∨ w = x

end LRA.Set.Constructions.ZFCSet.Axioms
