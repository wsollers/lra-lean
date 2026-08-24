import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/--
`Choice` TODO

Predicate logic:

  (∀ A ∈ NBGSet), forall B ∈ NBGSet, B ∈ A -> exists x : NBGSet, x ∈ B -> forall B C ∈ NBGSet, B ∈ A -> C ∈ A -> B ≠ C -> forall x : NBGSet, x ∈ B -> x ∉ C -> exists choiceSet : NBGSet, forall B : NBGSet, B ∈ A -> exists x : NBGSet, (x ∈ B ∧ x ∈ choiceSet) ∧ forall other : NBGSet, (other ∈ B ∧ other ∈ choiceSet) -> other = x end LRA.Set.NBG

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBGSet), (∀ (B : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => LRA.Set.instMembershipNBGSet.1 B x ∧ ∀ (B C : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 A B → LRA.Set.instMembershipNBGSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 B x → LRA.Set.instMembershipNBGSet.1 C x → False) → Exists fun choiceSet => ∀ (B : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => ((LRA.Set.instMembershipNBGSet.1 B x ∧ LRA.Set.instMembershipNBGSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.NBGSet), (LRA.Set.instMembershipNBGSet.1 B other ∧ LRA.Set.instMembershipNBGSet.1 choiceSet other) → other = x)

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

end LRA.Set.NBG
