import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`Foundation` TODO

Predicate logic:

  (∀ A ∈ TGSet), exists w ∈ TGSet, w ∈ A -> exists x : TGSet, x ∈ A ∧ forall y : TGSet, y ∈ x -> y ∉ A end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet), (Exists fun w => LRA.Set.instMembershipTGSet.1 A w) → Exists fun x => (LRA.Set.instMembershipTGSet.1 A x ∧ ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 A y → False)

Logical form (Lean):

```lean
axiom Foundation (A : TGSet) :
  (exists w : TGSet, w ∈ A) ->
    exists x : TGSet, x ∈ A /\ forall y : TGSet, y ∈ x -> y ∉ A
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
axiom Foundation (A : TGSet) :
  (exists w : TGSet, w ∈ A) ->
    exists x : TGSet, x ∈ A /\ forall y : TGSet, y ∈ x -> y ∉ A

end LRA.Set.Constructions.TGSet
