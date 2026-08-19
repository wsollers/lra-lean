import LRA.Relation.Definition

namespace LRA.Morphism

universe u v

/-- A function reflects a relation when related values came from related inputs. -/
def ReflectsRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ∀ left right,
    targetRelation (function left) (function right) → sourceRelation left right

end LRA.Morphism
