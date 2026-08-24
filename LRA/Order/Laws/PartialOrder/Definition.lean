namespace LRA.Order

universe u

/--
`PartialOrderLaws` TODO

Predicate logic:

  class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : forall a : R, a <= a
  LeAntisymm : forall a b : R, a <= b -> b <= a -> a = b
  LeTrans : forall a b c : R, a <= b -> b <= c -> a <= c

Predicate logic (unfolded):

  class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : forall a : R, a <= a
  LeAntisymm : forall a b : R, a <= b -> b <= a -> a = b
  LeTrans : forall a b c : R, a <= b -> b <= c -> a <= c (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : forall a : R, a <= a
  LeAntisymm : forall a b : R, a <= b -> b <= a -> a = b
  LeTrans : forall a b c : R, a <= b -> b <= c -> a <= c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : forall a : R, a <= a
  LeAntisymm : forall a b : R, a <= b -> b <= a -> a = b
  LeTrans : forall a b c : R, a <= b -> b <= c -> a <= c

section Wrappers

variable {R : Type u}

/--
`LeRefl` TODO

Predicate logic:

  forall a : R, a <= a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LE R], LRA.Order.PartialOrderLaws R → ∀ (a : R), inst.1 a a

Logical form (Lean):

```lean
theorem LeRefl [LE R] [PartialOrderLaws R] : forall a : R, a <= a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem LeRefl [LE R] [PartialOrderLaws R] : forall a : R, a <= a := by
  sorry

/--
`LeAntisymm` TODO

Predicate logic:

  forall a b : R, a <= b -> b <= a -> a = b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LE R], LRA.Order.PartialOrderLaws R → ∀ (a b : R), (inst.1 a b ∧ inst.1 b a) → a = b

Logical form (Lean):

```lean
theorem LeAntisymm [LE R] [PartialOrderLaws R] :
    forall a b : R, a <= b -> b <= a -> a = b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem LeAntisymm [LE R] [PartialOrderLaws R] :
    forall a b : R, a <= b -> b <= a -> a = b := by
  sorry

/--
`LeTrans` TODO

Predicate logic:

  forall a b c : R, a <= b -> b <= c -> a <= c

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LE R], LRA.Order.PartialOrderLaws R → ∀ (a b c : R), (inst.1 a b ∧ inst.1 b c) → inst.1 a c

Logical form (Lean):

```lean
theorem LeTrans [LE R] [PartialOrderLaws R] :
    forall a b c : R, a <= b -> b <= c -> a <= c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem LeTrans [LE R] [PartialOrderLaws R] :
    forall a b c : R, a <= b -> b <= c -> a <= c := by
  sorry

end Wrappers

end LRA.Order
