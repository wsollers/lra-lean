import LRA.Order.Bounds.LowerBound.Definition
import LRA.Order.Bounds.UpperBound.Definition
import LRA.Set.Interface.Operations

namespace LRA.Order

open LRA.Set

universe u v

section BoundSets

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [HasSeparation Element SetObject] [HasUniversal SetObject]

/-- The represented set of all upper bounds of a represented subset. -/
def UpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (UpperBound relation subset)

/-- The represented set of all lower bounds of a represented subset. -/
def LowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (LowerBound relation subset)

/-- Lower bounds of all upper bounds. -/
def LowerUpperClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  LowerBounds relation (UpperBounds relation subset)

/-- Upper bounds of all lower bounds. -/
def UpperLowerClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  UpperBounds relation (LowerBounds relation subset)

end BoundSets

end LRA.Order
