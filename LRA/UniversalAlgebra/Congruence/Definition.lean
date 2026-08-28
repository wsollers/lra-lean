import LRA.Operation
import LRA.Relation.Interface.Structures.Definition

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

/--
`UnaryOperationCongruence` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Endorelation Carrier) (operation : LRA.Operation.UnaryEndoOperation Carrier) {left right : Carrier}, relation left right → relation (operation left) (operation right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier) {left right : Carrier}, relation left right → relation (operation left) (operation right)

Logical form (Lean):

```lean
def UnaryOperationCongruence {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  forall {left right : Carrier},
    relation left right -> relation (operation left) (operation right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def UnaryOperationCongruence {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  forall {left right : Carrier},
    relation left right -> relation (operation left) (operation right)

/--
`BinaryOperationCongruence` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Endorelation Carrier) (operation : LRA.Operation.BinaryEndoOperation Carrier) {left₁ left₂ right₁ right₂ : Carrier}, (relation left₁ left₂ ∧ relation right₁ right₂) → relation (operation left₁ right₁) (operation left₂ right₂)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier) {left₁ left₂ right₁ right₂ : Carrier}, (relation left₁ left₂ ∧ relation right₁ right₂) → relation (operation left₁ right₁) (operation left₂ right₂)

Logical form (Lean):

```lean
def BinaryOperationCongruence {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall {left₁ left₂ right₁ right₂ : Carrier},
    relation left₁ left₂ -> relation right₁ right₂ ->
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

Related proof moves: intro, unfold

-/
def BinaryOperationCongruence {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall {left₁ left₂ right₁ right₂ : Carrier},
    relation left₁ left₂ -> relation right₁ right₂ ->
      relation (operation left₁ right₁) (operation left₂ right₂)

/--
`UnaryOperationRelationRequirements` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Endorelation Carrier) (operation : LRA.Operation.UnaryEndoOperation Carrier), (LRA.Relation.EquivalenceRelation relation ∧ LRA.UniversalAlgebra.Congruence.UnaryOperationCongruence relation operation)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier), ((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ {left right : Carrier}, relation left right → relation (operation left) (operation right))

Logical form (Lean):

```lean
def UnaryOperationRelationRequirements {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  LRA.Relation.EquivalenceRelation relation /\
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

Related proof moves: constructor, cases, rcases, unfold

-/
def UnaryOperationRelationRequirements {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  LRA.Relation.EquivalenceRelation relation /\
    UnaryOperationCongruence relation operation

/--
`BinaryOperationRelationRequirements` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Endorelation Carrier) (operation : LRA.Operation.BinaryEndoOperation Carrier), (LRA.Relation.EquivalenceRelation relation ∧ LRA.UniversalAlgebra.Congruence.BinaryOperationCongruence relation operation)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier), ((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ {left₁ left₂ right₁ right₂ : Carrier}, relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂))

Logical form (Lean):

```lean
def BinaryOperationRelationRequirements {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LRA.Relation.EquivalenceRelation relation /\
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

Related proof moves: constructor, cases, rcases, unfold

-/
def BinaryOperationRelationRequirements {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LRA.Relation.EquivalenceRelation relation /\
    BinaryOperationCongruence relation operation

end LRA.UniversalAlgebra.Congruence
