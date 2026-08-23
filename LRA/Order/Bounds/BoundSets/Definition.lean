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

                                                                       
def UpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (UpperBound relation subset)

                                                                       
def LowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (LowerBound relation subset)

                                        
def LowerUpperClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  LowerBounds relation (UpperBounds relation subset)

                                        
def UpperLowerClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  UpperBounds relation (LowerBounds relation subset)

end BoundSets

end LRA.Order
