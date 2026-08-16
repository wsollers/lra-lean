import LRA.VolumeI.Map.Operation.Laws.OrderCompatibility.Definition
import LRA.VolumeI.Order.Morphisms.Monotone.Definition
import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.Map.Operation.Laws.OrderCompatibility

open LRA.Map.Operation

universe u

/-- Left-translation preservation is monotonicity of every left translation. -/
theorem LeftTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) :
    LeftTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation fixed value) := by
  sorry

/-- Right-translation preservation is monotonicity of every right translation. -/
theorem RightTranslationPreservesRelationIffMonotoneTranslations
    {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) :
    RightTranslationPreservesRelation relation operation <->
      forall fixed,
        LRA.Order.Monotone relation relation
          (fun value => operation value fixed) := by
  sorry

/-- Coordinatewise preservation gives left translations when the relation is reflexive. -/
theorem CoordinatewisePreservesRelation.left_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation := by
  sorry

/-- Coordinatewise preservation gives right translations when the relation is reflexive. -/
theorem CoordinatewisePreservesRelation.right_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (coordinatewise :
      CoordinatewisePreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation := by
  sorry

end LRA.Map.Operation.Laws.OrderCompatibility
