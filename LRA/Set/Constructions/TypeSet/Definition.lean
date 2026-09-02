namespace LRA.Set.Constructions

universe u

/--
`TypeSet` TODO

Predicate logic:

  def TypeSet (Alpha : Type u) := Alpha → Prop

Predicate logic (unfolded):

  def TypeSet (Alpha : Type u) := Alpha → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def TypeSet (Alpha : Type u) := Alpha → Prop
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
def TypeSet (Alpha : Type u) := Alpha → Prop

variable {Alpha : Type u}

instance : Nonempty (TypeSet Alpha) := by
  sorry

instance : Membership Alpha (TypeSet Alpha) where
  mem containingSet element := containingSet element

/--
`TypeSetExtensionality` TODO

Predicate logic:

  (∀ x : Alpha, x ∈ A ↔ x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {A B : Alpha → Prop}, (∀ (x : Alpha), LRA.Set.instMembershipTypeSet.1 A x ↔ LRA.Set.instMembershipTypeSet.1 B x) → A = B

Logical form (Lean):

```lean
theorem TypeSetExtensionality {A B : TypeSet Alpha}
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
theorem TypeSetExtensionality {A B : TypeSet Alpha}
    (sameMembers : ∀ x : Alpha, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

end LRA.Set.Constructions
