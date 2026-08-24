
import LRA.Cardinality.Properties.Countability.Definition
import LRA.Cardinality.Properties.Finiteness.Theorems

namespace LRA.Cardinality

universe u v

/--
`FiniteImpliesCountable` TODO

Predicate logic:

  (IsFinite A) → IsCountable A

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun n => Exists fun f => (∀ (y : Fin n) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : Fin n), Exists fun x => f x = y)) → Exists fun f => ∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem FiniteImpliesCountable (A : Type u)
    (finite : IsFinite A) : IsCountable A
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
theorem FiniteImpliesCountable (A : Type u)
    (finite : IsFinite A) : IsCountable A := by
  sorry

/--
`CountablyInfiniteImpliesCountable` TODO

Predicate logic:

  (IsCountablyInfinite A) → IsCountable A

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun f => (∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : Nat), Exists fun x => f x = y)) → Exists fun f => ∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem CountablyInfiniteImpliesCountable (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsCountable A
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
theorem CountablyInfiniteImpliesCountable (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsCountable A := by
  sorry

/--
`CountablyInfiniteImpliesInfinite` TODO

Predicate logic:

  (IsCountablyInfinite A) → IsInfinite A

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun f => (∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : Nat), Exists fun x => f x = y) ∧ Exists fun n => Exists fun f => (LRA.Relation.LeftUnique (LRA.Function.Graph f) ∧ LRA.Relation.RightTotal (LRA.Function.Graph f))) → False

Logical form (Lean):

```lean
theorem CountablyInfiniteImpliesInfinite (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsInfinite A
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
theorem CountablyInfiniteImpliesInfinite (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsInfinite A := by
  sorry

/--
`IsCountableCongr` TODO

Predicate logic:

  IsCountable A ↔ IsCountable B

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v), (Exists fun f => (∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : B), Exists fun x => f x = y)) → Exists fun f => ∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ↔ Exists fun f => ∀ (y : Nat) (x₁ x₂ : B), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem IsCountableCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsCountable A ↔ IsCountable B
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
theorem IsCountableCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsCountable A ↔ IsCountable B := by
  sorry

/--
`DominatesCountableIsCountable` TODO

Predicate logic:

  (IsCountable B) → IsCountable A

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v), (Exists fun f => ∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ Exists fun f => ∀ (y : Nat) (x₁ x₂ : B), f x₁ = y → f x₂ = y → x₁ = x₂) → Exists fun f => ∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem DominatesCountableIsCountable (A : Type u) (B : Type v)
    (dominatesB : Dominates A B) (countableB : IsCountable B) :
    IsCountable A
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
theorem DominatesCountableIsCountable (A : Type u) (B : Type v)
    (dominatesB : Dominates A B) (countableB : IsCountable B) :
    IsCountable A := by
  sorry

/--
`CountableSigmaOfCountableIndexCountableFibers` TODO

Predicate logic:

  (Index → Type v ∧ IsCountable Index ∧ ∀ index : Index, IsCountable (family index)) → IsCountable (Sigma family)

Predicate logic (unfolded):

  ∀ {Index : Type u} (family : Index → Type v), (Exists fun f => ∀ (y : Nat) (x₁ x₂ : Index), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (index : Index), Exists fun f => ∀ (y : Nat) (x₁ x₂ : family index), f x₁ = y → f x₂ = y → x₁ = x₂) → Exists fun f => ∀ (y : Nat) (x₁ x₂ : Sigma family), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem CountableSigmaOfCountableIndexCountableFibers
    {Index : Type u} (family : Index → Type v)
    (countableIndex : IsCountable Index)
    (countableFibers : ∀ index : Index, IsCountable (family index)) :
    IsCountable (Sigma family)
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
theorem CountableSigmaOfCountableIndexCountableFibers
    {Index : Type u} (family : Index → Type v)
    (countableIndex : IsCountable Index)
    (countableFibers : ∀ index : Index, IsCountable (family index)) :
    IsCountable (Sigma family) := by
  sorry

end LRA.Cardinality
