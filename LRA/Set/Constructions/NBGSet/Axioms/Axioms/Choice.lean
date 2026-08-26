import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`Choice` TODO

Predicate logic:

  (∀ A ∈ NBGSet), forall B ∈ NBGSet, B ∈ A -> exists x : NBGSet, x ∈ B -> forall B C ∈ NBGSet, B ∈ A -> C ∈ A -> B ≠ C -> forall x : NBGSet, x ∈ B -> x ∉ C -> exists choiceSet : NBGSet, forall B : NBGSet, B ∈ A -> exists x : NBGSet, (x ∈ B ∧ x ∈ choiceSet) ∧ forall other : NBGSet, (other ∈ B ∧ other ∈ choiceSet) -> other = x end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet), (∀ (B : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => LRA.Set.instMembershipNBGSet.1 B x ∧ ∀ (B C : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 A B → LRA.Set.instMembershipNBGSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 B x → LRA.Set.instMembershipNBGSet.1 C x → False) → Exists fun choiceSet => ∀ (B : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => ((LRA.Set.instMembershipNBGSet.1 B x ∧ LRA.Set.instMembershipNBGSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.Constructions.NBGSet), (LRA.Set.instMembershipNBGSet.1 B other ∧ LRA.Set.instMembershipNBGSet.1 choiceSet other) → other = x)

Logical form (Lean):

```lean
axiom Choice (A : NBGSet) :
  (forall B : NBGSet, B ∈ A -> exists x : NBGSet, x ∈ B) ->
  (forall B C : NBGSet,
    B ∈ A -> C ∈ A -> B ≠ C ->
      forall x : NBGSet, x ∈ B -> x ∉ C) ->
    exists choiceSet : NBGSet,
      forall B : NBGSet, B ∈ A ->
        exists x : NBGSet,
          (x ∈ B /\ x ∈ choiceSet) /\
          forall other : NBGSet,
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
axiom Choice (A : NBGSet) :
  (forall B : NBGSet, B ∈ A -> exists x : NBGSet, x ∈ B) ->
  (forall B C : NBGSet,
    B ∈ A -> C ∈ A -> B ≠ C ->
      forall x : NBGSet, x ∈ B -> x ∉ C) ->
    exists choiceSet : NBGSet,
      forall B : NBGSet, B ∈ A ->
        exists x : NBGSet,
          (x ∈ B /\ x ∈ choiceSet) /\
          forall other : NBGSet,
            (other ∈ B /\ other ∈ choiceSet) -> other = x

end LRA.Set.Constructions.NBGSet.Axioms
