import LRA.UniversalAlgebra.Congruence.Theorems
import LRA.Relation.Structures.Equivalence.QuotientSet

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation
open scoped LRA.Set

universe u v

/--
`UnaryOperationRelationRequirements.quotient_projection_respects_operation` TODO

Predicate logic:

  (∀ A ∈ U), LRA.Relation.QuotientProjection A relation (operation left) = LRA.Relation.QuotientProjection A relation (operation right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {SetObject : Type v} [inst : Membership Carrier SetObject] [inst_1 : LRA.Set.HasSeparation Carrier SetObject], (LRA.Set.SeparationLaws Carrier SetObject ∧ LRA.Set.ExtensionalityLaw Carrier SetObject) → ∀ {ambient : SetObject} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier}, ((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ {left right : Carrier}, relation left right → relation (operation left) (operation right)) → ∀ {left right : Carrier}, relation left right → inst_1.1 ambient fun candidate => relation candidate (operation left) = inst_1.1 ambient fun candidate => relation candidate (operation right)

Logical form (Lean):

```lean
theorem UnaryOperationRelationRequirements.quotient_projection_respects_operation
    {Carrier : Type u} {SetObject : Type v}
    [Membership Carrier SetObject]
    [LRA.Set.HasSeparation Carrier SetObject]
    [LRA.Set.SeparationLaws Carrier SetObject]
    [LRA.Set.ExtensionalityLaw Carrier SetObject]
    {ambient : SetObject}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements :
      UnaryOperationRelationRequirements relation operation)
    {left right : Carrier}
    (related : relation left right) :
    LRA.Relation.QuotientProjection ambient relation (operation left) =
      LRA.Relation.QuotientProjection ambient relation (operation right)
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
theorem UnaryOperationRelationRequirements.quotient_projection_respects_operation
    {Carrier : Type u} {SetObject : Type v}
    [Membership Carrier SetObject]
    [LRA.Set.HasSeparation Carrier SetObject]
    [LRA.Set.SeparationLaws Carrier SetObject]
    [LRA.Set.ExtensionalityLaw Carrier SetObject]
    {ambient : SetObject}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : UnaryEndoOperation Carrier}
    (requirements :
      UnaryOperationRelationRequirements relation operation)
    {left right : Carrier}
    (related : relation left right) :
    LRA.Relation.QuotientProjection ambient relation (operation left) =
      LRA.Relation.QuotientProjection ambient relation (operation right) := by
  sorry

/--
`BinaryOperationRelationRequirements.quotient_projection_respects_operation` TODO

Predicate logic:

  (∀ A ∈ U), LRA.Relation.QuotientProjection A relation (operation left₁ right₁) = LRA.Relation.QuotientProjection A relation (operation left₂ right₂)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {SetObject : Type v} [inst : Membership Carrier SetObject] [inst_1 : LRA.Set.HasSeparation Carrier SetObject], (LRA.Set.SeparationLaws Carrier SetObject ∧ LRA.Set.ExtensionalityLaw Carrier SetObject) → ∀ {ambient : SetObject} {relation : Carrier → Carrier → Prop} {operation : Carrier → Carrier → Carrier}, ((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ {left₁ left₂ right₁ right₂ : Carrier}, relation left₁ left₂ → relation right₁ right₂ → relation (operation left₁ right₁) (operation left₂ right₂)) → ∀ {left₁ left₂ right₁ right₂ : Carrier}, (relation left₁ left₂ ∧ relation right₁ right₂) → inst_1.1 ambient fun candidate => relation candidate (operation left₁ right₁) = inst_1.1 ambient fun candidate => relation candidate (operation left₂ right₂)

Logical form (Lean):

```lean
theorem BinaryOperationRelationRequirements.quotient_projection_respects_operation
    {Carrier : Type u} {SetObject : Type v}
    [Membership Carrier SetObject]
    [LRA.Set.HasSeparation Carrier SetObject]
    [LRA.Set.SeparationLaws Carrier SetObject]
    [LRA.Set.ExtensionalityLaw Carrier SetObject]
    {ambient : SetObject}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements :
      BinaryOperationRelationRequirements relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (leftRelated : relation left₁ left₂)
    (rightRelated : relation right₁ right₂) :
    LRA.Relation.QuotientProjection
        ambient relation (operation left₁ right₁) =
      LRA.Relation.QuotientProjection
        ambient relation (operation left₂ right₂)
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
theorem BinaryOperationRelationRequirements.quotient_projection_respects_operation
    {Carrier : Type u} {SetObject : Type v}
    [Membership Carrier SetObject]
    [LRA.Set.HasSeparation Carrier SetObject]
    [LRA.Set.SeparationLaws Carrier SetObject]
    [LRA.Set.ExtensionalityLaw Carrier SetObject]
    {ambient : SetObject}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (requirements :
      BinaryOperationRelationRequirements relation operation)
    {left₁ left₂ right₁ right₂ : Carrier}
    (leftRelated : relation left₁ left₂)
    (rightRelated : relation right₁ right₂) :
    LRA.Relation.QuotientProjection
        ambient relation (operation left₁ right₁) =
      LRA.Relation.QuotientProjection
        ambient relation (operation left₂ right₂) := by
  sorry

end LRA.UniversalAlgebra.Congruence
