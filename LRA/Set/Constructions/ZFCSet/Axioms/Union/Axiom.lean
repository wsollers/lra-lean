import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Union` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet), Exists fun U => ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.mem A B ∧ LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : ZFCSet
  Prove
    Exists fun U => ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.mem A B ∧ LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Logical form (Lean):

```lean
axiom Union (A : ZFCSet) :
  ∃ U : ZFCSet, ∀ x : ZFCSet, x ∈ U ↔ ∃ B : ZFCSet, B ∈ A ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
axiom Union (A : ZFCSet) :
  ∃ U : ZFCSet, ∀ x : ZFCSet, x ∈ U ↔ ∃ B : ZFCSet, B ∈ A ∧ x ∈ B

end LRA.Set.Constructions.ZFCSet.Axioms
