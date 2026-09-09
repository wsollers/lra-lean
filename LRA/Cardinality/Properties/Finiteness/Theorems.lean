
import LRA.Cardinality.Theorems
import LRA.Cardinality.Properties.Finiteness.Definition

namespace LRA.Cardinality

universe u v

/--
`IsFiniteCongr` TODO

Predicate logic:

  ∀ (A : Type u) (B : Type v), LRA.Cardinality.Equinumerous A B → LRA.Cardinality.IsFinite A ↔ LRA.Cardinality.IsFinite B

Predicate logic (unfolded):

  Ambient
    (A, B)
  Objects
    equinumerous : Equinumerous A B
  Prove
    LRA.Cardinality.Equinumerous A B → LRA.Cardinality.IsFinite A ↔ LRA.Cardinality.IsFinite B

Logical form (Lean):

```lean
theorem IsFiniteCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsFinite A ↔ IsFinite B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem IsFiniteCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsFinite A ↔ IsFinite B := by
  sorry
/--
`NotBothFiniteAndInfinite` TODO

Predicate logic:

  ∀ (A : Type u), ¬ (LRA.Cardinality.IsFinite A ∧ LRA.Cardinality.IsInfinite A)

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    (none)
  Prove
    ((Exists fun n => Exists fun f => ((∀ (y : Fin n) (x₁ x₂ : A), LRA.Function.Graph f x₁ y → LRA.Function.Graph f x₂ y → x₁ = x₂) ∧ (∀ (y : Fin n), Exists fun x => LRA.Function.Graph f x y))) ∧ ((Exists fun n => Exists fun f => (LRA.Function.Injective f ∧ LRA.Function.Surjective f)) → False)) → False

Logical form (Lean):

```lean
theorem NotBothFiniteAndInfinite (A : Type u) :
    ¬ (IsFinite A ∧ IsInfinite A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem NotBothFiniteAndInfinite (A : Type u) :
    ¬ (IsFinite A ∧ IsInfinite A) := by
  sorry
/--
`FiniteImpliesDedekindFinite` TODO

Predicate logic:

  ∀ (A : Type u), LRA.Cardinality.IsFinite A → LRA.Cardinality.IsDedekindFinite A

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    (none)
  Prove
    ((Exists fun n => Exists fun f => ((∀ (y : Fin n) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂) ∧ (∀ (y : Fin n), Exists fun x => f x = y))) ∧ (Exists fun f => ((∀ (y x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂) ∧ ((∀ (y : A), Exists fun x => LRA.Function.Graph f x y) → False)))) → False

Logical form (Lean):

```lean
theorem FiniteImpliesDedekindFinite (A : Type u)
    (finite : IsFinite A) : IsDedekindFinite A
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
theorem FiniteImpliesDedekindFinite (A : Type u)
    (finite : IsFinite A) : IsDedekindFinite A := by
  sorry
/--
`DedekindInfiniteImpliesInfinite` TODO

Predicate logic:

  ∀ (A : Type u), LRA.Cardinality.IsDedekindInfinite A → LRA.Cardinality.IsInfinite A

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    (none)
  Prove
    ((Exists fun f => ((∀ (y x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂) ∧ ((∀ (y : A), Exists fun x => f x = y) → False))) ∧ (Exists fun n => Exists fun f => (LRA.Relation.LeftUnique (LRA.Function.Graph f) ∧ LRA.Relation.RightTotal (LRA.Function.Graph f)))) → False

Logical form (Lean):

```lean
theorem DedekindInfiniteImpliesInfinite (A : Type u)
    (dedekindInfinite : IsDedekindInfinite A) : IsInfinite A
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
theorem DedekindInfiniteImpliesInfinite (A : Type u)
    (dedekindInfinite : IsDedekindInfinite A) : IsInfinite A := by
  sorry
/--
`DominatesOfFiniteInfinite` TODO

Predicate logic:

  ∀ (A : Type u) (B : Type v), (LRA.Cardinality.IsFinite A ∧ LRA.Cardinality.IsInfinite B) → LRA.Cardinality.Dominates A B

Predicate logic (unfolded):

  Ambient
    (A, B)
  Objects
    (none)
  Prove
    ((Exists fun n => Exists fun f => ((∀ (y : Fin n) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂) ∧ (∀ (y : Fin n), Exists fun x => f x = y))) ∧ ((Exists fun n => Exists fun f => (LRA.Relation.LeftUnique (LRA.Function.Graph f) ∧ LRA.Relation.RightTotal (LRA.Function.Graph f))) → False)) → Exists fun f => ∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem DominatesOfFiniteInfinite (A : Type u) (B : Type v)
    (finiteA : IsFinite A) (infiniteB : IsInfinite B) : Dominates A B
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
theorem DominatesOfFiniteInfinite (A : Type u) (B : Type v)
    (finiteA : IsFinite A) (infiniteB : IsInfinite B) : Dominates A B := by
  sorry
end LRA.Cardinality
