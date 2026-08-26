import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TG

/--
`Infinity` TODO

Predicate logic:

  exists A : TGSet, exists empty ∈ TGSet, empty ∈ A ∧ forall w : TGSet, w ∉ empty ∧ forall x : TGSet, x ∈ A -> exists successor : TGSet, successor ∈ A ∧ forall w : TGSet, w ∈ successor <-> w ∈ x ∨ w = x end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  Exists fun A => (Exists fun empty => (LRA.Set.instMembershipTGSet.1 A empty ∧ ∀ (w : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 empty w → False) ∧ ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 A x → Exists fun successor => (LRA.Set.instMembershipTGSet.1 A successor ∧ ∀ (w : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 successor w ↔ Or (LRA.Set.instMembershipTGSet.1 x w) (w = x)))

Logical form (Lean):

```lean
axiom Infinity :
  exists A : TGSet,
    (exists empty : TGSet, empty ∈ A /\ forall w : TGSet, w ∉ empty) /\
    forall x : TGSet, x ∈ A ->
      exists successor : TGSet,
        successor ∈ A /\
        forall w : TGSet, w ∈ successor <-> w ∈ x \/ w = x
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
  exists A : TGSet,
    (exists empty : TGSet, empty ∈ A /\ forall w : TGSet, w ∉ empty) /\
    forall x : TGSet, x ∈ A ->
      exists successor : TGSet,
        successor ∈ A /\
        forall w : TGSet, w ∈ successor <-> w ∈ x \/ w = x

end LRA.Set.Constructions.TG
