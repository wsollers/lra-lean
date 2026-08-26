import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TG

/--
`Choice` TODO

Predicate logic:

  (∀ A ∈ TGSet), forall B ∈ TGSet, B ∈ A -> exists x : TGSet, x ∈ B -> forall B C ∈ TGSet, B ∈ A -> C ∈ A -> B ≠ C -> forall x : TGSet, x ∈ B -> x ∉ C -> exists choiceSet : TGSet, forall B : TGSet, B ∈ A -> exists x : TGSet, (x ∈ B ∧ x ∈ choiceSet) ∧ forall other : TGSet, (other ∈ B ∧ other ∈ choiceSet) -> other = x end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet), (∀ (B : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 A B → Exists fun x => LRA.Set.instMembershipTGSet.1 B x ∧ ∀ (B C : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 A B → LRA.Set.instMembershipTGSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 B x → LRA.Set.instMembershipTGSet.1 C x → False) → Exists fun choiceSet => ∀ (B : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 A B → Exists fun x => ((LRA.Set.instMembershipTGSet.1 B x ∧ LRA.Set.instMembershipTGSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.Constructions.TGSet), (LRA.Set.instMembershipTGSet.1 B other ∧ LRA.Set.instMembershipTGSet.1 choiceSet other) → other = x)

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

end LRA.Set.Constructions.TG
