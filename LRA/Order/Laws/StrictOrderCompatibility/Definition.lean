namespace LRA.Order

universe u

/--
`StrictOrderCompatibilityLaw` TODO

Predicate logic:

  class StrictOrderCompatibilityLaw (R : Type u) [LT R] [LE R] : Prop where
  LtIffLeNotLe : forall a b : R, a < b <-> a <= b /\ Not (b <= a)

Predicate logic (unfolded):

  class StrictOrderCompatibilityLaw (R : Type u) [LT R] [LE R] : Prop where
  LtIffLeNotLe : forall a b : R, a < b <-> a <= b /\ Not (b <= a) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class StrictOrderCompatibilityLaw (R : Type u) [LT R] [LE R] : Prop where
  LtIffLeNotLe : forall a b : R, a < b <-> a <= b /\ Not (b <= a)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
class StrictOrderCompatibilityLaw (R : Type u) [LT R] [LE R] : Prop where
  LtIffLeNotLe : forall a b : R, a < b <-> a <= b /\ Not (b <= a)

section Wrappers

variable {R : Type u}

/--
`LtIffLeNotLe` TODO

Predicate logic:

  forall a b : R, a < b <-> a <= b ∧ Not (b <= a)

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LT R] [inst_1 : LE R], LRA.Order.StrictOrderCompatibilityLaw R → ∀ (a b : R), inst.1 a b ↔ (inst_1.1 a b ∧ inst_1.1 b a → False)

Logical form (Lean):

```lean
theorem LtIffLeNotLe [LT R] [LE R] [StrictOrderCompatibilityLaw R] :
    forall a b : R, a < b <-> a <= b /\ Not (b <= a)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem LtIffLeNotLe [LT R] [LE R] [StrictOrderCompatibilityLaw R] :
    forall a b : R, a < b <-> a <= b /\ Not (b <= a) := by
  sorry

end Wrappers

end LRA.Order
