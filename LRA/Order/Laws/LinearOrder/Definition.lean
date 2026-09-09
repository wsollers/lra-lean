import LRA.Order.Laws.PartialOrder.Definition

namespace LRA.Order

universe u

/--
`TotalOrderLaw` TODO

Predicate logic:

  class TotalOrderLaw (R : Type u) [LE R] : Prop where
    LeTotal : forall a b : R, a <= b \/ b <= a

Predicate logic (unfolded):

  class TotalOrderLaw (R : Type u) [LE R] : Prop where
    LeTotal : forall a b : R, a <= b \/ b <= a (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class TotalOrderLaw (R : Type u) [LE R] : Prop where
  LeTotal : forall a b : R, a <= b \/ b <= a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
class TotalOrderLaw (R : Type u) [LE R] : Prop where
  LeTotal : forall a b : R, a <= b \/ b <= a

/--
`LinearOrderLaws` TODO

Predicate logic:

  class abbrev LinearOrderLaws (R : Type u) [LE R] : Prop :=
    PartialOrderLaws R, TotalOrderLaw R

Predicate logic (unfolded):

  class abbrev LinearOrderLaws (R : Type u) [LE R] : Prop :=
    PartialOrderLaws R, TotalOrderLaw R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev LinearOrderLaws (R : Type u) [LE R] : Prop :=
  PartialOrderLaws R, TotalOrderLaw R
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
class abbrev LinearOrderLaws (R : Type u) [LE R] : Prop :=
  PartialOrderLaws R, TotalOrderLaw R

section Wrappers

variable {R : Type u}

/--
`LeTotal` TODO

Predicate logic:

  ∀ {R : Type u} [inst : LE R], LRA.Order.TotalOrderLaw R → ∀ (a b : R), Or (inst.le a b) (inst.le b a)

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    (none)
  Prove
    LRA.Order.TotalOrderLaw R → ∀ (a b : R), Or (inst.le a b) (inst.le b a)

Logical form (Lean):

```lean
theorem LeTotal [LE R] [TotalOrderLaw R] :
    forall a b : R, a <= b \/ b <= a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem LeTotal [LE R] [TotalOrderLaw R] :
    forall a b : R, a <= b \/ b <= a := by
  sorry
end Wrappers

end LRA.Order
