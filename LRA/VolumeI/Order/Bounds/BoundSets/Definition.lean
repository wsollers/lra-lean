import LRA.VolumeI.Order.Bounds.LowerBound.Definition
import LRA.VolumeI.Order.Bounds.UpperBound.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Order

open LRA.Set

universe u v

section BoundSets

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [HasSeparation Element SetObject] [HasUniversal SetObject]

/--
`UpperBounds`

Statement: `UpperBounds relation subset` is the represented set of every
element that bounds `subset` above.

Logical form: `UpperBounds relation subset = {bound | UpperBound relation subset bound}`.
-/
def UpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (UpperBound relation subset)

/--
`LowerBounds`

Statement: `LowerBounds relation subset` is the represented set of every
element that bounds `subset` below.

Logical form: `LowerBounds relation subset = {bound | LowerBound relation subset bound}`.
-/
def LowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (LowerBound relation subset)

/--
`LowerUpperClosure`

Statement: The lower-upper closure of a represented subset consists of the
lower bounds of all its upper bounds.

Logical form: `LowerUpperClosure relation subset = LowerBounds relation (UpperBounds relation subset)`.
-/
def LowerUpperClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  LowerBounds relation (UpperBounds relation subset)

/--
`UpperLowerClosure`

Statement: The upper-lower closure of a represented subset consists of the
upper bounds of all its lower bounds.

Logical form: `UpperLowerClosure relation subset = UpperBounds relation (LowerBounds relation subset)`.
-/
def UpperLowerClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  UpperBounds relation (LowerBounds relation subset)

end BoundSets

end LRA.Order
