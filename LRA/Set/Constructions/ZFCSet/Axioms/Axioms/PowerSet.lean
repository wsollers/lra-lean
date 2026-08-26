import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PowerSet` TODO

Predicate logic:

  (∀ A ∈ ZFCSet), ∃ P ∈ ZFCSet, ∀ x : ZFCSet, x ∈ P ↔ ∀ y : ZFCSet, y ∈ x → y ∈ A end LRA.Set.Constructions.ZFCSet.Axioms

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet), Exists fun P => ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y

Logical form (Lean):

```lean
axiom PowerSet (A : ZFCSet) :
  ∃ P : ZFCSet, ∀ x : ZFCSet, x ∈ P ↔ ∀ y : ZFCSet, y ∈ x → y ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
axiom PowerSet (A : ZFCSet) :
  ∃ P : ZFCSet, ∀ x : ZFCSet, x ∈ P ↔ ∀ y : ZFCSet, y ∈ x → y ∈ A

end LRA.Set.Constructions.ZFCSet.Axioms
