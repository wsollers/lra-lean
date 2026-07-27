import LRA.VolumeI.Set.Set

namespace LRA.VolumeI.Set

universe u v

/-- Binary Cartesian product of carriers. -/
abbrev Product (alpha beta : LRACarrier) := alpha × beta

/-- A finite tuple over a carrier. -/
abbrev Tuple (size : Nat) (alpha : LRACarrier) := Fin size -> alpha

/-- First projection from a product. -/
def first {alpha beta : LRACarrier} (pair : Product alpha beta) : alpha :=
  pair.1

/-- Second projection from a product. -/
def second {alpha beta : LRACarrier} (pair : Product alpha beta) : beta :=
  pair.2

/-- Cartesian product of two predicate-sets. -/
def cartesianProduct {alpha beta : LRACarrier}
    (left : LRASet alpha) (right : LRASet beta) : LRASet (Product alpha beta) :=
  fun pair => LRASet.member pair.1 left /\ LRASet.member pair.2 right

end LRA.VolumeI.Set
