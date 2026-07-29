import LRA.VolumeI.Set.Set

namespace LRA.VolumeI.Set

universe u

/-- Binary Cartesian product of carriers. -/
abbrev Product (alpha beta : LRACarrier) := alpha × beta

/-- A finite tuple over a carrier. -/
abbrev Tuple (size : Nat) (alpha : LRACarrier) := Fin size -> alpha

/-- First projection from a product. -/
def FirstProjection {Alpha Beta : LRACarrier} (Pair : Product Alpha Beta) : Alpha :=
  Pair.1

/-- Second projection from a product. -/
def SecondProjection {Alpha Beta : LRACarrier} (Pair : Product Alpha Beta) : Beta :=
  Pair.2

/-- Cartesian product of two predicate-sets. -/
def CartesianProduct {Alpha Beta : LRACarrier}
    (Left : LRASet Alpha) (Right : LRASet Beta) : LRASet (Product Alpha Beta) :=
  fun Pair => LRASet.Member Pair.1 Left /\ LRASet.Member Pair.2 Right

/-- Membership criterion for a Cartesian product. -/
theorem CartesianProductMembershipIff {Alpha Beta : LRACarrier}
    (Left : LRASet Alpha) (Right : LRASet Beta) (Pair : Product Alpha Beta) :
    LRASet.Member Pair (CartesianProduct Left Right) ↔
      LRASet.Member (FirstProjection Pair) Left ∧
        LRASet.Member (SecondProjection Pair) Right := by
  rfl

/-- A product element is determined by its two projections. -/
theorem ProductExtensionality {Alpha Beta : LRACarrier}
    {Left Right : Product Alpha Beta}
    (FirstCoordinatesEqual : FirstProjection Left = FirstProjection Right)
    (SecondCoordinatesEqual : SecondProjection Left = SecondProjection Right) :
    Left = Right := by
  exact Prod.ext FirstCoordinatesEqual SecondCoordinatesEqual

/-- Finite Cartesian power, read as `Alpha ^ Size` in the set-theoretic outline. -/
abbrev FinitePower (Size : Nat) (Alpha : LRACarrier) := Tuple Size Alpha

end LRA.VolumeI.Set
