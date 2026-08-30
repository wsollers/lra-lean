import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Foundation` TODO

Predicate logic:

  (∀ A ∈ ZFCSet), ∃ w ∈ ZFCSet, w ∈ A → ∃ x ∈ ZFCSet, x ∈ A ∧ ∀ y : ZFCSet, y ∈ x → y ∉ A end LRA.Set.Constructions.ZFCSet.Axioms

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet), (Exists fun w => LRA.Set.instMembershipZFCSet.1 A w) → Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ ∀ (y : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y → False)

Logical form (Lean):

```lean
axiom Foundation (A : ZFCSet) :
  (∃ w : ZFCSet, w ∈ A) →
    ∃ x : ZFCSet, x ∈ A ∧ ∀ y : ZFCSet, y ∈ x → y ∉ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
axiom Foundation (A : ZFCSet) :
  (∃ w : ZFCSet, w ∈ A) →
    ∃ x : ZFCSet, x ∈ A ∧ ∀ y : ZFCSet, y ∈ x → y ∉ A

end LRA.Set.Constructions.ZFCSet.Axioms
