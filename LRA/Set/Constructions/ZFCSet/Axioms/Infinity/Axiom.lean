import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Infinity` TODO

Predicate logic:

  Exists fun A => ((Exists fun empty => (LRA.Set.Constructions.instMembershipZFCSet.mem A empty ∧ (∀ (w : LRA.Set.Constructions.ZFCSet), ¬ LRA.Set.Constructions.instMembershipZFCSet.mem empty w))) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x → Exists fun successor => (LRA.Set.Constructions.instMembershipZFCSet.mem A successor ∧ (∀ (w : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem successor w ↔ Or (LRA.Set.Constructions.instMembershipZFCSet.mem x w) (w = x)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => ((Exists fun empty => (LRA.Set.Constructions.instMembershipZFCSet.mem A empty ∧ (∀ (w : LRA.Set.Constructions.ZFCSet), ¬ LRA.Set.Constructions.instMembershipZFCSet.mem empty w))) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x → Exists fun successor => (LRA.Set.Constructions.instMembershipZFCSet.mem A successor ∧ (∀ (w : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem successor w ↔ Or (LRA.Set.Constructions.instMembershipZFCSet.mem x w) (w = x)))))

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
