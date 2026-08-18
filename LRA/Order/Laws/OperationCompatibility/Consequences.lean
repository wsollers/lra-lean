import LRA.Order.Laws.OperationCompatibility.Definition
import LRA.Order.Morphisms.Monotone.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

/-!
Consequences of order-operation compatibility laws belong here.
-/

/-- Left-translation preservation is monotonicity of every left translation. -/
theorem LeftTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) :
    LeftTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation fixed value) := by
  constructor
  · intro law fixed left right related
    exact law fixed left right related
  · intro translations fixed left right related
    exact translations fixed left right related

/-- Right-translation preservation is monotonicity of every right translation. -/
theorem RightTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) :
    RightTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation value fixed) := by
  constructor
  · intro law fixed left right related
    exact law left right fixed related
  · intro translations left right fixed related
    exact translations fixed left right related

/-- Coordinatewise preservation gives left translations when the relation is reflexive. -/
theorem CoordinatewisePreservesRelation.left_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation := by
  intro fixed left right related
  exact coordinatewise fixed fixed left right (relationIsReflexive fixed) related

/-- Coordinatewise preservation gives right translations when the relation is reflexive. -/
theorem CoordinatewisePreservesRelation.right_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation := by
  intro left right fixed related
  exact coordinatewise left right fixed fixed related (relationIsReflexive fixed)

end LRA.Order
