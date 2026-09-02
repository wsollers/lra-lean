import LRA.Relation.Interface.Structures.Definition

namespace LRA.Relation
universe u

/--
`EquivalenceImpliesPartialEquivalence` TODO

Predicate logic:

  PartialEquivalenceRelation R

Predicate logic (unfolded):

  ∀ {α : Type u} {R : α → α → Prop}, (∀ (x : α), R x x ∧ (∀ (x y : α), R x y → R y x ∧ ∀ (x y z : α), R x y → R y z → R x z)) → (∀ (x y : α), R x y → R y x ∧ ∀ (x y z : α), R x y → R y z → R x z)

Logical form (Lean):

```lean
theorem EquivalenceImpliesPartialEquivalence {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : PartialEquivalenceRelation R
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem EquivalenceImpliesPartialEquivalence {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : PartialEquivalenceRelation R := by
  sorry
/--
`EquivalenceImpliesTolerance` TODO

Predicate logic:

  ToleranceRelation R

Predicate logic (unfolded):

  ∀ {α : Type u} {R : α → α → Prop}, (∀ (x : α), R x x ∧ (∀ (x y : α), R x y → R y x ∧ ∀ (x y z : α), R x y → R y z → R x z)) → (∀ (x : α), R x x ∧ ∀ (x y : α), R x y → R y x)

Logical form (Lean):

```lean
theorem EquivalenceImpliesTolerance {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : ToleranceRelation R
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem EquivalenceImpliesTolerance {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : ToleranceRelation R := by
  sorry
end LRA.Relation
