import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/--
`Infinity` TODO

Predicate logic:

  exists A : NBGSet, exists empty ∈ NBGSet, empty ∈ A ∧ forall w : NBGSet, w ∉ empty ∧ forall x : NBGSet, x ∈ A -> exists successor : NBGSet, successor ∈ A ∧ forall w : NBGSet, w ∈ successor <-> w ∈ x ∨ w = x end LRA.Set.NBG

Predicate logic (unfolded):

  Exists fun A => (Exists fun empty => (LRA.Set.instMembershipNBGSet.1 A empty ∧ ∀ (w : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 empty w → False) ∧ ∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 A x → Exists fun successor => (LRA.Set.instMembershipNBGSet.1 A successor ∧ ∀ (w : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 successor w ↔ Or (LRA.Set.instMembershipNBGSet.1 x w) (w = x)))

Logical form (Lean):

```lean
axiom Infinity :
  exists A : NBGSet,
    (exists empty : NBGSet, empty ∈ A /\ forall w : NBGSet, w ∉ empty) /\
    forall x : NBGSet, x ∈ A ->
      exists successor : NBGSet,
        successor ∈ A /\
        forall w : NBGSet, w ∈ successor <-> w ∈ x \/ w = x
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
  exists A : NBGSet,
    (exists empty : NBGSet, empty ∈ A /\ forall w : NBGSet, w ∉ empty) /\
    forall x : NBGSet, x ∈ A ->
      exists successor : NBGSet,
        successor ∈ A /\
        forall w : NBGSet, w ∈ successor <-> w ∈ x \/ w = x

end LRA.Set.NBG
