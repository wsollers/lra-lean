import LRA.Relation.Definition

namespace LRA.Morphism

universe u v

/-- A function preserves a displayed relation when related inputs have related
values.

This is the primitive. Order-theoretic monotonicity is a *specialization* of it,
not the other way round: "monotone" is order vocabulary and is earned only once
the displayed relation is an order. -/
def PreservesRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ∀ left right,
    sourceRelation left right → targetRelation (function left) (function right)

end LRA.Morphism
