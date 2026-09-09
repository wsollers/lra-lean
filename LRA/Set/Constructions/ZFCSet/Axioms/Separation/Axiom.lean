import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Separation` TODO

Predicate logic:

  ∀ (property : LRA.Set.Constructions.ZFCSet → Prop) (A : LRA.Set.Constructions.ZFCSet), Exists fun B => ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem B x ↔ (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ property x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    property : ZFCSet → Prop
    A : ZFCSet
  Prove
    Exists fun B => ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem B x ↔ (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ property x)

Logical form (Lean):

```lean
axiom Separation (property : ZFCSet → Prop) (A : ZFCSet) :
  ∃ B : ZFCSet, ∀ x : ZFCSet, x ∈ B ↔ x ∈ A ∧ property x
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
axiom Separation (property : ZFCSet → Prop) (A : ZFCSet) :
  ∃ B : ZFCSet, ∀ x : ZFCSet, x ∈ B ↔ x ∈ A ∧ property x

end LRA.Set.Constructions.ZFCSet.Axioms
