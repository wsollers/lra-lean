import LRA.UniversalAlgebra.Congruence.Definition

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

/--
`UnaryOperationCongruence.apply` TODO

Predicate logic:

  relation (operation left) (operation right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier}, (∀ {left right : Carrier}, relation left right → relation (operation left) (operation right)) → ∀ {left right : Carrier}, relation left right → relation (operation left) (operation right)

Logical form (Lean):

```lean
theorem UnaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (law : UnaryOperationCongruence relation operation)
    {left right : Carrier}
    (related_inputs : relation left right) :
    relation (operation left) (operation right)
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
theorem UnaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (law : UnaryOperationCongruence relation operation)
    {left right : Carrier}
    (related_inputs : relation left right) :
    relation (operation left) (operation right) := by
  sorry

/--
`BinaryOperationCongruence.apply` TODO

Predicate logic:

  relation (operation left₁ right₁) (operation left₂ right₂)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ {left₁ left₂ right₁ right₂ : Carrier}, relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂)) → ∀ {left₁ left₂ right₁ right₂ : Carrier}, (relation left₁ left₂ ∧ relation right₁ right₂) → relation (operation left₁ right₁) (operation left₂ right₂)

Logical form (Lean):

```lean
theorem BinaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (law : BinaryOperationCongruence relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (related_left_inputs : relation left₁ left₂)
    (related_right_inputs : relation right₁ right₂) :
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

Related proof moves: TODO

-/
theorem BinaryOperationCongruence.apply {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (law : BinaryOperationCongruence relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (related_left_inputs : relation left₁ left₂)
    (related_right_inputs : relation right₁ right₂) :
    relation (operation left₁ right₁) (operation left₂ right₂) := by
  sorry

/--
`UnaryOperationRelationRequirements.relation_is_equivalence` TODO

Predicate logic:

  LRA.Relation.EquivalenceRelation relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier}, ((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ {left right : Carrier}, relation left right → relation (operation left) (operation right)) → (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z))

Logical form (Lean):

```lean
theorem UnaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation
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
theorem UnaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation := by
  sorry

/--
`UnaryOperationRelationRequirements.operation_congruence` TODO

Predicate logic:

  UnaryOperationCongruence relation operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier}, ((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ {left right : Carrier}, relation left right → relation (operation left) (operation right)) → ∀ {left right : Carrier}, relation left right → relation (operation left) (operation right)

Logical form (Lean):

```lean
theorem UnaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    UnaryOperationCongruence relation operation
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
theorem UnaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements : UnaryOperationRelationRequirements relation operation) :
    UnaryOperationCongruence relation operation := by
  sorry

/--
`BinaryOperationRelationRequirements.relation_is_equivalence` TODO

Predicate logic:

  LRA.Relation.EquivalenceRelation relation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, ((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ {left₁ left₂ right₁ right₂ : Carrier}, relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂)) → (∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z))

Logical form (Lean):

```lean
theorem BinaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation
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
theorem BinaryOperationRelationRequirements.relation_is_equivalence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    LRA.Relation.EquivalenceRelation relation := by
  sorry

/--
`BinaryOperationRelationRequirements.operation_congruence` TODO

Predicate logic:

  BinaryOperationCongruence relation operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, ((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ {left₁ left₂ right₁ right₂ : Carrier}, relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂)) → ∀ {left₁ left₂ right₁ right₂ : Carrier}, (relation left₁ left₂ ∧ relation right₁ right₂) → relation (operation left₁ right₁) (operation left₂ right₂)

Logical form (Lean):

```lean
theorem BinaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    BinaryOperationCongruence relation operation
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
theorem BinaryOperationRelationRequirements.operation_congruence {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements : BinaryOperationRelationRequirements relation operation) :
    BinaryOperationCongruence relation operation := by
  sorry

end LRA.UniversalAlgebra.Congruence
