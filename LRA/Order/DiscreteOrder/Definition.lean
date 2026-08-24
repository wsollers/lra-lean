namespace LRA.Order

universe u

/--
`OrderDiscretenessLaw` TODO

Predicate logic:

  class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1)

Predicate logic (unfolded):

  class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1)
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
class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1)

section Wrappers

variable {R : Type u}

/--
`NoStrictBetweenAddOne` TODO

Predicate logic:

  forall a : R, Not exists middle ∈ R, a < middle ∧ middle < a + 1

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LT R] [inst_1 : Add R] [inst_2 : OfNat R (instOfNatNat 1).1], LRA.Order.OrderDiscretenessLaw R → ∀ (a : R), (Exists fun middle => (inst.1 a middle ∧ inst.1 middle (instHAdd.1 a inst_2.1))) → False

Logical form (Lean):

```lean
theorem NoStrictBetweenAddOne [LT R] [Add R] [OfNat R 1]
    [OrderDiscretenessLaw R] :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1)
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
theorem NoStrictBetweenAddOne [LT R] [Add R] [OfNat R 1]
    [OrderDiscretenessLaw R] :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1) := by
  sorry

end Wrappers

end LRA.Order
