import LRA.Morphism.Properties.PreservesRelation.Theorems
import LRA.Morphism.Properties.ReflectsRelation.Theorems
import LRA.Morphism.Properties.RelationEmbedding.Definition

namespace LRA.Morphism

universe u v

section RelationEmbedding

variable {Source : Type u} {Target : Type v}
variable {function : Source → Target}
variable {sourceRelation : LRA.Relation.Endorelation Source}
variable {targetRelation : LRA.Relation.Endorelation Target}

/--
`PreservesAndReflectsRelation.preserves` TODO

Predicate logic:

  PreservesRelation function sourceRelation targetRelation

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceRelation : Source → Source → Prop} {targetRelation : Target → Target → Prop}, (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right) → ∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right)

Logical form (Lean):

```lean
theorem PreservesAndReflectsRelation.preserves
    (law : PreservesAndReflectsRelation function sourceRelation targetRelation) :
    PreservesRelation function sourceRelation targetRelation
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
theorem PreservesAndReflectsRelation.preserves
    (law : PreservesAndReflectsRelation function sourceRelation targetRelation) :
    PreservesRelation function sourceRelation targetRelation := by
  sorry

/--
`PreservesAndReflectsRelation.reflects` TODO

Predicate logic:

  ReflectsRelation function sourceRelation targetRelation

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceRelation : Source → Source → Prop} {targetRelation : Target → Target → Prop}, (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right) → ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right

Logical form (Lean):

```lean
theorem PreservesAndReflectsRelation.reflects
    (law : PreservesAndReflectsRelation function sourceRelation targetRelation) :
    ReflectsRelation function sourceRelation targetRelation
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
theorem PreservesAndReflectsRelation.reflects
    (law : PreservesAndReflectsRelation function sourceRelation targetRelation) :
    ReflectsRelation function sourceRelation targetRelation := by
  sorry

/--
`RelationEmbedding.injective` TODO

Predicate logic:

  LRA.Function.Injective function

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceRelation : Source → Source → Prop} {targetRelation : Target → Target → Prop}, (∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right)) → ∀ (y : Target) (x₁ x₂ : Source), (function x₁ = y ∧ function x₂ = y) → x₁ = x₂

Logical form (Lean):

```lean
theorem RelationEmbedding.injective
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    LRA.Function.Injective function
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
theorem RelationEmbedding.injective
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    LRA.Function.Injective function := by
  sorry

/--
`RelationEmbedding.preserves_and_reflects` TODO

Predicate logic:

  PreservesAndReflectsRelation function sourceRelation targetRelation

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceRelation : Source → Source → Prop} {targetRelation : Target → Target → Prop}, (∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right)) → (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right)

Logical form (Lean):

```lean
theorem RelationEmbedding.preserves_and_reflects
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    PreservesAndReflectsRelation function sourceRelation targetRelation
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
theorem RelationEmbedding.preserves_and_reflects
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    PreservesAndReflectsRelation function sourceRelation targetRelation := by
  sorry

/--
`RelationEmbedding.preserves` TODO

Predicate logic:

  PreservesRelation function sourceRelation targetRelation

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceRelation : Source → Source → Prop} {targetRelation : Target → Target → Prop}, (∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right)) → ∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right)

Logical form (Lean):

```lean
theorem RelationEmbedding.preserves
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    PreservesRelation function sourceRelation targetRelation
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
theorem RelationEmbedding.preserves
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    PreservesRelation function sourceRelation targetRelation := by
  sorry

/--
`RelationEmbedding.reflects` TODO

Predicate logic:

  ReflectsRelation function sourceRelation targetRelation

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceRelation : Source → Source → Prop} {targetRelation : Target → Target → Prop}, (∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right)) → ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right

Logical form (Lean):

```lean
theorem RelationEmbedding.reflects
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    ReflectsRelation function sourceRelation targetRelation
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
theorem RelationEmbedding.reflects
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    ReflectsRelation function sourceRelation targetRelation := by
  sorry

end RelationEmbedding

end LRA.Morphism
