namespace LRA.Set

universe u

/--
`PredicateSet` TODO

Predicate logic:

  def PredicateSet (Alpha : Type u) := Alpha → Prop

Predicate logic (unfolded):

  def PredicateSet (Alpha : Type u) := Alpha → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PredicateSet (Alpha : Type u) := Alpha → Prop
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PredicateSet (Alpha : Type u) := Alpha → Prop

variable {Alpha : Type u}

instance : Membership Alpha (PredicateSet Alpha) where
  mem containingSet element := containingSet element

/--
`PredicateSetExtensionality` TODO

Predicate logic:

  (∀ x : Alpha, x ∈ A ↔ x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {A B : Alpha → Prop}, (∀ (x : Alpha), LRA.Set.instMembershipPredicateSet.1 A x ↔ LRA.Set.instMembershipPredicateSet.1 B x) → A = B

Logical form (Lean):

```lean
theorem PredicateSetExtensionality {A B : PredicateSet Alpha}
    (sameMembers : ∀ x : Alpha, x ∈ A ↔ x ∈ B) :
    A = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem PredicateSetExtensionality {A B : PredicateSet Alpha}
    (sameMembers : ∀ x : Alpha, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

end LRA.Set
