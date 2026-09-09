import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Extensionality` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet), (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x ↔ LRA.Set.Constructions.instMembershipZFCSet.mem B x) → A = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : ZFCSet
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x ↔ LRA.Set.Constructions.instMembershipZFCSet.mem B x) → A = B

Logical form (Lean):

```lean
axiom Extensionality (A B : ZFCSet) :
  (∀ x : ZFCSet, x ∈ A ↔ x ∈ B) → A = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
axiom Extensionality (A B : ZFCSet) :
  (∀ x : ZFCSet, x ∈ A ↔ x ∈ B) → A = B

end LRA.Set.Constructions.ZFCSet.Axioms
