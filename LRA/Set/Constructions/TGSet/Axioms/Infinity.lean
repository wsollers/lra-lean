import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`Infinity` TODO

Predicate logic:

  Exists fun A => ((Exists fun empty => (LRA.Set.Constructions.instMembershipTGSet.mem A empty ∧ (∀ (w : LRA.Set.Constructions.TGSet), ¬ LRA.Set.Constructions.instMembershipTGSet.mem empty w))) ∧ (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A x → Exists fun successor => (LRA.Set.Constructions.instMembershipTGSet.mem A successor ∧ (∀ (w : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem successor w ↔ Or (LRA.Set.Constructions.instMembershipTGSet.mem x w) (w = x)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => ((Exists fun empty => (LRA.Set.Constructions.instMembershipTGSet.mem A empty ∧ (∀ (w : LRA.Set.Constructions.TGSet), ¬ LRA.Set.Constructions.instMembershipTGSet.mem empty w))) ∧ (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A x → Exists fun successor => (LRA.Set.Constructions.instMembershipTGSet.mem A successor ∧ (∀ (w : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem successor w ↔ Or (LRA.Set.Constructions.instMembershipTGSet.mem x w) (w = x)))))

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

end LRA.Set.Constructions.TGSet
