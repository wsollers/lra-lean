import LRA.Function.Properties.Definition
import LRA.Morphism.Properties.PreservesRelation.Definition
import LRA.Morphism.Properties.ReflectsRelation.Definition

namespace LRA.Morphism

universe u v

/--
`PreservesAndReflectsRelation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target), (LRA.Morphism.PreservesRelation function sourceRelation targetRelation ∧ LRA.Morphism.ReflectsRelation function sourceRelation targetRelation)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : Source → Source → Prop) (targetRelation : Target → Target → Prop), (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right)

Logical form (Lean):

```lean
def PreservesAndReflectsRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  PreservesRelation function sourceRelation targetRelation ∧
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

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def PreservesAndReflectsRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  PreservesRelation function sourceRelation targetRelation ∧
    ReflectsRelation function sourceRelation targetRelation

/--
`RelationEmbedding` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target), (LRA.Function.Injective function ∧ LRA.Morphism.PreservesAndReflectsRelation function sourceRelation targetRelation)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : Source → Source → Prop) (targetRelation : Target → Target → Prop), (∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right))

Logical form (Lean):

```lean
def RelationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  LRA.Function.Injective function ∧
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

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def RelationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  LRA.Function.Injective function ∧
    PreservesAndReflectsRelation function sourceRelation targetRelation

end LRA.Morphism
