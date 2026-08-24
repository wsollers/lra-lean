import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/--
`Union` TODO

Predicate logic:

  (∀ A ∈ NBGSet), exists U : NBGSet, forall x : NBGSet, x ∈ U <-> exists B : NBGSet, B ∈ A ∧ x ∈ B end LRA.Set.NBG

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBGSet), Exists fun U => ∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipNBGSet.1 A B ∧ LRA.Set.instMembershipNBGSet.1 B x)

Logical form (Lean):

```lean
axiom Union (A : NBGSet) :
  exists U : NBGSet, forall x : NBGSet, x ∈ U <-> exists B : NBGSet, B ∈ A /\ x ∈ B
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
axiom Union (A : NBGSet) :
  exists U : NBGSet, forall x : NBGSet, x ∈ U <-> exists B : NBGSet, B ∈ A /\ x ∈ B

end LRA.Set.NBG
