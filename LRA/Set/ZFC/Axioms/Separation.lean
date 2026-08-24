import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/--
`Separation` TODO

Predicate logic:

  (∀ A ∈ ZFCSet), (ZFCSet → Prop) → ∃ B ∈ ZFCSet, ∀ x : ZFCSet, x ∈ B ↔ x ∈ A ∧ property x end LRA.Set.ZFC

Predicate logic (unfolded):

  ∀ (property : LRA.Set.ZFCSet → Prop) (A : LRA.Set.ZFCSet), Exists fun B => ∀ (x : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 B x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)

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

end LRA.Set.ZFC
