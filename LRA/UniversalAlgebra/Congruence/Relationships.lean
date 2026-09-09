import LRA.UniversalAlgebra.Congruence.Theorems

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

/--
`BinaryOperationCongruence.left` TODO

Predicate logic:

  ∀ {Carrier : Type u} {relation : LRA.Relation.Endorelation Carrier} {operation : LRA.Operation.BinaryEndoOperation Carrier}, (LRA.Relation.Reflexive relation ∧ LRA.UniversalAlgebra.Congruence.BinaryOperationCongruence relation operation) → ∀ {left₁ left₂ : Carrier} (right : Carrier), relation left₁ left₂ → relation (operation left₁ right) (operation left₂ right)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    relation : LRA.Relation.Endorelation Carrier
    operation : BinaryEndoOperation Carrier
    reflexive : LRA.Relation.Reflexive relation
    law : BinaryOperationCongruence relation operation
  Prove
    ((∀ (x : Carrier), relation x x) ∧ (∀ {left₁ left₂ right₁ right₂ : Carrier}, relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂))) → ∀ {left₁ left₂ : Carrier} (right : Carrier), relation left₁ left₂ → relation (operation left₁ right) (operation left₂ right)

Logical form (Lean):

```lean
theorem BinaryOperationCongruence.left {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (reflexive : LRA.Relation.Reflexive relation)
    (law : BinaryOperationCongruence relation operation) :
    forall {left₁ left₂ : Carrier} (right : Carrier),
      relation left₁ left₂ ->
        relation (operation left₁ right) (operation left₂ right)
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
theorem BinaryOperationCongruence.left {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (reflexive : LRA.Relation.Reflexive relation)
    (law : BinaryOperationCongruence relation operation) :
    forall {left₁ left₂ : Carrier} (right : Carrier),
      relation left₁ left₂ ->
        relation (operation left₁ right) (operation left₂ right) := by
  sorry
/--
`BinaryOperationCongruence.right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {relation : LRA.Relation.Endorelation Carrier} {operation : LRA.Operation.BinaryEndoOperation Carrier}, (LRA.Relation.Reflexive relation ∧ LRA.UniversalAlgebra.Congruence.BinaryOperationCongruence relation operation) → ∀ (left : Carrier) {right₁ right₂ : Carrier}, relation right₁ right₂ → relation (operation left right₁) (operation left right₂)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    relation : LRA.Relation.Endorelation Carrier
    operation : BinaryEndoOperation Carrier
    reflexive : LRA.Relation.Reflexive relation
    law : BinaryOperationCongruence relation operation
  Prove
    ((∀ (x : Carrier), relation x x) ∧ (∀ {left₁ left₂ right₁ right₂ : Carrier}, relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂))) → ∀ (left : Carrier) {right₁ right₂ : Carrier}, relation right₁ right₂ → relation (operation left right₁) (operation left right₂)

Logical form (Lean):

```lean
theorem BinaryOperationCongruence.right {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (reflexive : LRA.Relation.Reflexive relation)
    (law : BinaryOperationCongruence relation operation) :
    forall (left : Carrier) {right₁ right₂ : Carrier},
      relation right₁ right₂ ->
        relation (operation left right₁) (operation left right₂)
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
theorem BinaryOperationCongruence.right {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (reflexive : LRA.Relation.Reflexive relation)
    (law : BinaryOperationCongruence relation operation) :
    forall (left : Carrier) {right₁ right₂ : Carrier},
      relation right₁ right₂ ->
        relation (operation left right₁) (operation left right₂) := by
  sorry
end LRA.UniversalAlgebra.Congruence
