import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

/-- `cover` is an upper cover of `element`: `element` is covered by
`cover`, immediately below it with nothing strictly between them. -/
def UpperCover
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (element cover : alpha) : Prop :=
  CoverRelation strictRelation element cover

end LRA.Order
