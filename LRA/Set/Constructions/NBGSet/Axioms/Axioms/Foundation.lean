import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`Foundation` TODO

Predicate logic:

  (∀ A ∈ NBGSet), exists w ∈ NBGSet, w ∈ A -> exists x : NBGSet, x ∈ A ∧ forall y : NBGSet, y ∈ x -> y ∉ A end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet), (Exists fun w => LRA.Set.instMembershipNBGSet.1 A w) → Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ ∀ (y : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y → False)

Logical form (Lean):

```lean
axiom Foundation (A : NBGSet) :
  (exists w : NBGSet, w ∈ A) ->
    exists x : NBGSet, x ∈ A /\ forall y : NBGSet, y ∈ x -> y ∉ A
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
axiom Foundation (A : NBGSet) :
  (exists w : NBGSet, w ∈ A) ->
    exists x : NBGSet, x ∈ A /\ forall y : NBGSet, y ∈ x -> y ∉ A

end LRA.Set.Constructions.NBGSet.Axioms
