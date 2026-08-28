import LRA.Order.Laws.OperationCompatibility.Definition
import LRA.Order.Morphisms.Monotone.Definition
import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

universe u

/--
`LeftTranslationPreservesRelationIffMonotoneTranslations` TODO

Predicate logic:

  LeftTranslationPreservesRelation relation operation <-> forall fixed, LRA.Order.Monotone relation relation (fun value => operation fixed value)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier), ∀ (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right) ↔ ∀ (fixed left right : Carrier), relation left right → relation ((fun value => operation fixed value) left) ((fun value => operation fixed value) right)

Logical form (Lean):

```lean
theorem LeftTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) :
    LeftTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation fixed value)
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
theorem LeftTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) :
    LeftTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation fixed value) := by
  sorry

/--
`RightTranslationPreservesRelationIffMonotoneTranslations` TODO

Predicate logic:

  RightTranslationPreservesRelation relation operation <-> forall fixed, LRA.Order.Monotone relation relation (fun value => operation value fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier), ∀ (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed) ↔ ∀ (fixed left right : Carrier), relation left right → relation ((fun value => operation value fixed) left) ((fun value => operation value fixed) right)

Logical form (Lean):

```lean
theorem RightTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) :
    RightTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation value fixed)
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
theorem RightTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) :
    RightTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation value fixed) := by
  sorry

/--
`CoordinatewisePreservesRelation.left_translation` TODO

Predicate logic:

  LeftTranslationPreservesRelation relation operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (x : Carrier), relation x x ∧ ∀ (left₁ left₂ right₁ right₂ : Carrier), relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂)) → ∀ (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right)

Logical form (Lean):

```lean
theorem CoordinatewisePreservesRelation.left_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation
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
theorem CoordinatewisePreservesRelation.left_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation := by
  sorry

/--
`CoordinatewisePreservesRelation.right_translation` TODO

Predicate logic:

  RightTranslationPreservesRelation relation operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (x : Carrier), relation x x ∧ ∀ (left₁ left₂ right₁ right₂ : Carrier), relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂)) → ∀ (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed)

Logical form (Lean):

```lean
theorem CoordinatewisePreservesRelation.right_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation
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
theorem CoordinatewisePreservesRelation.right_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation := by
  sorry

end LRA.Order
