import LRA.Order.Laws.OperationCompatibility.Definition

namespace LRA.Order

universe u

/--
`LeftTranslationPreservesRelation.apply` TODO

Predicate logic:

  (∀ fixed left right ∈ Carrier), relation (operation fixed left) (operation fixed right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right)) → ∀ (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right)

Logical form (Lean):

```lean
theorem LeftTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : LeftTranslationPreservesRelation relation operation)
    (fixed left right : Carrier)
    (related : relation left right) :
    relation (operation fixed left) (operation fixed right)
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
theorem LeftTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : LeftTranslationPreservesRelation relation operation)
    (fixed left right : Carrier)
    (related : relation left right) :
    relation (operation fixed left) (operation fixed right) := by
  sorry

/--
`RightTranslationPreservesRelation.apply` TODO

Predicate logic:

  (∀ left right fixed ∈ Carrier), relation (operation left fixed) (operation right fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed)) → ∀ (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed)

Logical form (Lean):

```lean
theorem RightTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : RightTranslationPreservesRelation relation operation)
    (left right fixed : Carrier)
    (related : relation left right) :
    relation (operation left fixed) (operation right fixed)
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
theorem RightTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : RightTranslationPreservesRelation relation operation)
    (left right fixed : Carrier)
    (related : relation left right) :
    relation (operation left fixed) (operation right fixed) := by
  sorry

/--
`CoordinatewisePreservesRelation.apply` TODO

Predicate logic:

  (∀ left₁ left₂ right₁ right₂ ∈ Carrier), relation (operation left₁ right₁) (operation left₂ right₂)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (left₁ left₂ right₁ right₂ : Carrier), relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂)) → ∀ (left₁ left₂ right₁ right₂ : Carrier), (relation left₁ left₂ ∧ relation right₁ right₂) → relation (operation left₁ right₁) (operation left₂ right₂)

Logical form (Lean):

```lean
theorem CoordinatewisePreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : CoordinatewisePreservesRelation relation operation)
    (left₁ left₂ right₁ right₂ : Carrier)
    (left_related : relation left₁ left₂)
    (right_related : relation right₁ right₂) :
    relation (operation left₁ right₁) (operation left₂ right₂)
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
theorem CoordinatewisePreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : CoordinatewisePreservesRelation relation operation)
    (left₁ left₂ right₁ right₂ : Carrier)
    (left_related : relation left₁ left₂)
    (right_related : relation right₁ right₂) :
    relation (operation left₁ right₁) (operation left₂ right₂) := by
  sorry

/--
`LeftTranslationReversesRelation.apply` TODO

Predicate logic:

  (∀ fixed left right ∈ Carrier), relation (operation fixed right) (operation fixed left)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed left right : Carrier), relation left right → relation (operation fixed right) (operation fixed left)) → ∀ (fixed left right : Carrier), relation left right → relation (operation fixed right) (operation fixed left)

Logical form (Lean):

```lean
theorem LeftTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : LeftTranslationReversesRelation relation operation)
    (fixed left right : Carrier)
    (related : relation left right) :
    relation (operation fixed right) (operation fixed left)
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
theorem LeftTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : LeftTranslationReversesRelation relation operation)
    (fixed left right : Carrier)
    (related : relation left right) :
    relation (operation fixed right) (operation fixed left) := by
  sorry

/--
`RightTranslationReversesRelation.apply` TODO

Predicate logic:

  (∀ left right fixed ∈ Carrier), relation (operation right fixed) (operation left fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (left right fixed : Carrier), relation left right → relation (operation right fixed) (operation left fixed)) → ∀ (left right fixed : Carrier), relation left right → relation (operation right fixed) (operation left fixed)

Logical form (Lean):

```lean
theorem RightTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : RightTranslationReversesRelation relation operation)
    (left right fixed : Carrier)
    (related : relation left right) :
    relation (operation right fixed) (operation left fixed)
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
theorem RightTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : RightTranslationReversesRelation relation operation)
    (left right fixed : Carrier)
    (related : relation left right) :
    relation (operation right fixed) (operation left fixed) := by
  sorry

/--
`PositiveRightTranslationPreservesRelation.apply` TODO

Predicate logic:

  (∀ left right fixed ∈ Carrier), relation (operation left fixed) (operation right fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {positive : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (left right fixed : Carrier), positive fixed → relation left right → relation (operation left fixed) (operation right fixed)) → ∀ (left right fixed : Carrier), (positive fixed ∧ relation left right) → relation (operation left fixed) (operation right fixed)

Logical form (Lean):

```lean
theorem PositiveRightTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveRightTranslationPreservesRelation relation positive operation)
    (left right fixed : Carrier)
    (fixed_positive : positive fixed)
    (related : relation left right) :
    relation (operation left fixed) (operation right fixed)
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
theorem PositiveRightTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveRightTranslationPreservesRelation relation positive operation)
    (left right fixed : Carrier)
    (fixed_positive : positive fixed)
    (related : relation left right) :
    relation (operation left fixed) (operation right fixed) := by
  sorry

/--
`PositiveLeftTranslationPreservesRelation.apply` TODO

Predicate logic:

  (∀ fixed left right ∈ Carrier), relation (operation fixed left) (operation fixed right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {positive : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed left right : Carrier), positive fixed → relation left right → relation (operation fixed left) (operation fixed right)) → ∀ (fixed left right : Carrier), (positive fixed ∧ relation left right) → relation (operation fixed left) (operation fixed right)

Logical form (Lean):

```lean
theorem PositiveLeftTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveLeftTranslationPreservesRelation relation positive operation)
    (fixed left right : Carrier)
    (fixed_positive : positive fixed)
    (related : relation left right) :
    relation (operation fixed left) (operation fixed right)
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
theorem PositiveLeftTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveLeftTranslationPreservesRelation relation positive operation)
    (fixed left right : Carrier)
    (fixed_positive : positive fixed)
    (related : relation left right) :
    relation (operation fixed left) (operation fixed right) := by
  sorry

/--
`NegativeRightTranslationReversesRelation.apply` TODO

Predicate logic:

  (∀ left right fixed ∈ Carrier), relation (operation right fixed) (operation left fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {negative : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (left right fixed : Carrier), negative fixed → relation left right → relation (operation right fixed) (operation left fixed)) → ∀ (left right fixed : Carrier), (negative fixed ∧ relation left right) → relation (operation right fixed) (operation left fixed)

Logical form (Lean):

```lean
theorem NegativeRightTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeRightTranslationReversesRelation relation negative operation)
    (left right fixed : Carrier)
    (fixed_negative : negative fixed)
    (related : relation left right) :
    relation (operation right fixed) (operation left fixed)
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
theorem NegativeRightTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeRightTranslationReversesRelation relation negative operation)
    (left right fixed : Carrier)
    (fixed_negative : negative fixed)
    (related : relation left right) :
    relation (operation right fixed) (operation left fixed) := by
  sorry

/--
`NegativeLeftTranslationReversesRelation.apply` TODO

Predicate logic:

  (∀ fixed left right ∈ Carrier), relation (operation fixed right) (operation fixed left)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {negative : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed left right : Carrier), negative fixed → relation left right → relation (operation fixed right) (operation fixed left)) → ∀ (fixed left right : Carrier), (negative fixed ∧ relation left right) → relation (operation fixed right) (operation fixed left)

Logical form (Lean):

```lean
theorem NegativeLeftTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeLeftTranslationReversesRelation relation negative operation)
    (fixed left right : Carrier)
    (fixed_negative : negative fixed)
    (related : relation left right) :
    relation (operation fixed right) (operation fixed left)
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
theorem NegativeLeftTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeLeftTranslationReversesRelation relation negative operation)
    (fixed left right : Carrier)
    (fixed_negative : negative fixed)
    (related : relation left right) :
    relation (operation fixed right) (operation fixed left) := by
  sorry

end LRA.Order
