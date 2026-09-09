import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`Choice` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet), ((∀ (B : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A B → Exists fun x => LRA.Set.Constructions.instMembershipTGSet.mem B x) ∧ (∀ (B C : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A B → LRA.Set.Constructions.instMembershipTGSet.mem A C → Ne B C → ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem B x → ¬ LRA.Set.Constructions.instMembershipTGSet.mem C x)) → Exists fun choiceSet => ∀ (B : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A B → Exists fun x => ((LRA.Set.Constructions.instMembershipTGSet.mem B x ∧ LRA.Set.Constructions.instMembershipTGSet.mem choiceSet x) ∧ (∀ (other : LRA.Set.Constructions.TGSet), (LRA.Set.Constructions.instMembershipTGSet.mem B other ∧ LRA.Set.Constructions.instMembershipTGSet.mem choiceSet other) → other = x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : TGSet
  Prove
    ((∀ (B : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.1 A B → Exists fun x => LRA.Set.Constructions.instMembershipTGSet.1 B x) ∧ (∀ (B C : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.1 A B → LRA.Set.Constructions.instMembershipTGSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.1 B x → LRA.Set.Constructions.instMembershipTGSet.1 C x → False)) → Exists fun choiceSet => ∀ (B : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.1 A B → Exists fun x => ((LRA.Set.Constructions.instMembershipTGSet.1 B x ∧ LRA.Set.Constructions.instMembershipTGSet.1 choiceSet x) ∧ (∀ (other : LRA.Set.Constructions.TGSet), (LRA.Set.Constructions.instMembershipTGSet.1 B other ∧ LRA.Set.Constructions.instMembershipTGSet.1 choiceSet other) → other = x))

Logical form (Lean):

```lean
axiom Choice (A : TGSet) :
  (forall B : TGSet, B ∈ A -> exists x : TGSet, x ∈ B) ->
  (forall B C : TGSet,
    B ∈ A -> C ∈ A -> B ≠ C ->
      forall x : TGSet, x ∈ B -> x ∉ C) ->
    exists choiceSet : TGSet,
      forall B : TGSet, B ∈ A ->
        exists x : TGSet,
          (x ∈ B /\ x ∈ choiceSet) /\
          forall other : TGSet,
            (other ∈ B /\ other ∈ choiceSet) -> other = x
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
axiom Choice (A : TGSet) :
  (forall B : TGSet, B ∈ A -> exists x : TGSet, x ∈ B) ->
  (forall B C : TGSet,
    B ∈ A -> C ∈ A -> B ≠ C ->
      forall x : TGSet, x ∈ B -> x ∉ C) ->
    exists choiceSet : TGSet,
      forall B : TGSet, B ∈ A ->
        exists x : TGSet,
          (x ∈ B /\ x ∈ choiceSet) /\
          forall other : TGSet,
            (other ∈ B /\ other ∈ choiceSet) -> other = x

end LRA.Set.Constructions.TGSet
