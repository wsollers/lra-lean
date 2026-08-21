import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

/-- `cover` is a lower cover of `element`: `cover` is covered by
`element`, immediately below it with nothing strictly between them. -/
def LowerCover
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (element cover : alpha) : Prop :=
  CoverRelation strictRelation cover element

end LRA.Order
