import LRA.VolumeI.Set.LRASet.LRASet

namespace LRA.VolumeI.Set

/-- The binary Cartesian product of carriers `Alpha` and `Beta` is the type of
ordered pairs `(a, b)` with `a : Alpha` and `b : Beta`; equivalently, its
elements have a first coordinate in `Alpha` and a second coordinate in `Beta`. -/
abbrev Product (Alpha Beta : LRACarrier) := Alpha × Beta

/-- A finite tuple of length `n` over `Alpha` is a value of `Alpha` at each
position `0, ..., n - 1`; equivalently, it is a function `Fin n → Alpha`. -/
abbrev Tuple (Size : Nat) (Alpha : LRACarrier) := Fin Size → Alpha

/-- The first projection of a pair `(a, b)` is `a`; equivalently, it extracts
the first coordinate of a Cartesian-product element. -/
def FirstProjection {Alpha Beta : LRACarrier} (Pair : Product Alpha Beta) : Alpha :=
  Pair.1

/-- The second projection of a pair `(a, b)` is `b`; equivalently, it extracts
the second coordinate of a Cartesian-product element. -/
def SecondProjection {Alpha Beta : LRACarrier} (Pair : Product Alpha Beta) : Beta :=
  Pair.2

/-- The Cartesian product of sets `A` and `B` is the set of pairs whose first
coordinate lies in `A` and second coordinate lies in `B`; equivalently,
`(a, b) ∈ A × B` iff `a ∈ A ∧ b ∈ B`. -/
def CartesianProduct {Alpha Beta : LRACarrier}
    (Left : LRASet Alpha) (Right : LRASet Beta) : LRASet (Product Alpha Beta) :=
  fun Pair => LRASet.Member Pair.1 Left ∧ LRASet.Member Pair.2 Right

/-- Let `A` and `B` be sets. A pair belongs to `A × B` exactly when its first
projection belongs to `A` and its second projection belongs to `B`;
equivalently, for every pair `p`, `p ∈ A × B` iff `π₁(p) ∈ A ∧ π₂(p) ∈ B`. -/
theorem CartesianProductMembershipIff {Alpha Beta : LRACarrier}
    (Left : LRASet Alpha) (Right : LRASet Beta) (Pair : Product Alpha Beta) :
    LRASet.Member Pair (CartesianProduct Left Right) ↔
      LRASet.Member (FirstProjection Pair) Left ∧
        LRASet.Member (SecondProjection Pair) Right := by
  sorry

/-- Let `p` and `q` be product elements. If their first projections are equal
and their second projections are equal, then `p = q`; equivalently, ordered
pairs are determined by their two coordinates. -/
theorem ProductExtensionality {Alpha Beta : LRACarrier}
    {Left Right : Product Alpha Beta}
    (FirstCoordinatesEqual : FirstProjection Left = FirstProjection Right)
    (SecondCoordinatesEqual : SecondProjection Left = SecondProjection Right) :
    Left = Right := by
  sorry

/-- The finite Cartesian power `Alphaⁿ` is the type of length-`n` tuples over
`Alpha`; equivalently, it is the same object as `Tuple n Alpha`. -/
abbrev FinitePower (Size : Nat) (Alpha : LRACarrier) := Tuple Size Alpha

end LRA.VolumeI.Set
