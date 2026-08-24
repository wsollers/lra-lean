
import LRA.Cardinality.Definition

namespace LRA.Cardinality

universe u v w

/--
`EquinumerousReflexive` TODO

Predicate logic:

  Equinumerous A A

Predicate logic (unfolded):

  ∀ (A : Type u), Exists fun f => (∀ (y x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : A), Exists fun x => f x = y)

Logical form (Lean):

```lean
theorem EquinumerousReflexive (A : Type u) : Equinumerous A A
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
theorem EquinumerousReflexive (A : Type u) : Equinumerous A A := by
  sorry

/--
`EquinumerousSymmetric` TODO

Predicate logic:

  Equinumerous B A

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v), (Exists fun f => (∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : B), Exists fun x => f x = y)) → Exists fun f => (∀ (y : A) (x₁ x₂ : B), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : A), Exists fun x => f x = y)

Logical form (Lean):

```lean
theorem EquinumerousSymmetric (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Equinumerous B A
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
theorem EquinumerousSymmetric (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Equinumerous B A := by
  sorry

/--
`EquinumerousTransitive` TODO

Predicate logic:

  Equinumerous A C

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v) (C : Type w), (Exists fun f => (∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : B), Exists fun x => f x = y) ∧ Exists fun f => (∀ (y : C) (x₁ x₂ : B), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : C), Exists fun x => f x = y)) → Exists fun f => (∀ (y : C) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : C), Exists fun x => f x = y)

Logical form (Lean):

```lean
theorem EquinumerousTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstEquinumerous : Equinumerous A B)
    (secondEquinumerous : Equinumerous B C) : Equinumerous A C
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
theorem EquinumerousTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstEquinumerous : Equinumerous A B)
    (secondEquinumerous : Equinumerous B C) : Equinumerous A C := by
  sorry

/--
`DominatesReflexive` TODO

Predicate logic:

  Dominates A A

Predicate logic (unfolded):

  ∀ (A : Type u), Exists fun f => ∀ (y x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem DominatesReflexive (A : Type u) : Dominates A A
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
theorem DominatesReflexive (A : Type u) : Dominates A A := by
  sorry

/--
`DominatesTransitive` TODO

Predicate logic:

  Dominates A C

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v) (C : Type w), (Exists fun f => ∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ Exists fun f => ∀ (y : C) (x₁ x₂ : B), f x₁ = y → f x₂ = y → x₁ = x₂) → Exists fun f => ∀ (y : C) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem DominatesTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstDominates : Dominates A B)
    (secondDominates : Dominates B C) : Dominates A C
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
theorem DominatesTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstDominates : Dominates A B)
    (secondDominates : Dominates B C) : Dominates A C := by
  sorry

/--
`DominatesOfEquinumerous` TODO

Predicate logic:

  Dominates A B

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v), (Exists fun f => (∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : B), Exists fun x => f x = y)) → Exists fun f => ∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem DominatesOfEquinumerous (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Dominates A B
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
theorem DominatesOfEquinumerous (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Dominates A B := by
  sorry

/--
`CantorSchroederBernstein` TODO

Predicate logic:

  Equinumerous A B

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v), (Exists fun f => ∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ Exists fun f => ∀ (y : A) (x₁ x₂ : B), f x₁ = y → f x₂ = y → x₁ = x₂) → Exists fun f => (∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : B), Exists fun x => f x = y)

Logical form (Lean):

```lean
theorem CantorSchroederBernstein (A : Type u) (B : Type v)
    (firstDominates : Dominates A B) (secondDominates : Dominates B A) :
    Equinumerous A B
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
theorem CantorSchroederBernstein (A : Type u) (B : Type v)
    (firstDominates : Dominates A B) (secondDominates : Dominates B A) :
    Equinumerous A B := by
  sorry

/--
`CantorTheorem` TODO

Predicate logic:

  ¬ ∃ f ∈ A → (A → Prop), LRA.Function.Surjective f

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun f => ∀ (y : A → Prop), Exists fun x => f x = y) → False

Logical form (Lean):

```lean
theorem CantorTheorem (A : Type u) :
    ¬ ∃ f : A → (A → Prop), LRA.Function.Surjective f
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem CantorTheorem (A : Type u) :
    ¬ ∃ f : A → (A → Prop), LRA.Function.Surjective f := by
  sorry

/--
`StrictlyDominatesPowerset` TODO

Predicate logic:

  StrictlyDominates A (A → Prop)

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun f => ∀ (y : A → Prop) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ (Exists fun f => (∀ (y : A → Prop) (x₁ x₂ : A), LRA.Function.Graph f x₁ y → LRA.Function.Graph f x₂ y → x₁ = x₂ ∧ ∀ (y : A → Prop), Exists fun x => LRA.Function.Graph f x y)) → False)

Logical form (Lean):

```lean
theorem StrictlyDominatesPowerset (A : Type u) :
    StrictlyDominates A (A → Prop)
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
theorem StrictlyDominatesPowerset (A : Type u) :
    StrictlyDominates A (A → Prop) := by
  sorry

end LRA.Cardinality
