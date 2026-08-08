namespace LRA.VolumeI.Set

universe u v

/-- The binary Cartesian product of carriers `Alpha` and `Beta` is the type of
ordered pairs `(a, b)` with `a : Alpha` and `b : Beta`; equivalently, its
elements have a first coordinate in `Alpha` and a second coordinate in `Beta`. -/
abbrev Product (Alpha : Type u) (Beta : Type v) := Alpha × Beta

/-- A finite tuple of length `n` over `Alpha` is a value of `Alpha` at each
position `0, ..., n - 1`; equivalently, it is a function `Fin n → Alpha`. -/
abbrev Tuple (Size : Nat) (Alpha : Type u) := Fin Size → Alpha

/-- The first projection of a pair `(a, b)` is `a`; equivalently, it extracts
the first coordinate of a Cartesian-product element. -/
def FirstProjection {Alpha : Type u} {Beta : Type v} (Pair : Product Alpha Beta) : Alpha :=
  Pair.1

/-- The second projection of a pair `(a, b)` is `b`; equivalently, it extracts
the second coordinate of a Cartesian-product element. -/
def SecondProjection {Alpha : Type u} {Beta : Type v} (Pair : Product Alpha Beta) : Beta :=
  Pair.2

/-- Let `p` and `q` be product elements. If their first projections are equal
and their second projections are equal, then `p = q`; equivalently, ordered
pairs are determined by their two coordinates. -/
theorem ProductExtensionality {Alpha : Type u} {Beta : Type v}
    {Left Right : Product Alpha Beta}
    (FirstCoordinatesEqual : FirstProjection Left = FirstProjection Right)
    (SecondCoordinatesEqual : SecondProjection Left = SecondProjection Right) :
    Left = Right := by
  sorry

/-- The finite Cartesian power `Alphaⁿ` is the type of length-`n` tuples over
`Alpha`; equivalently, it is the same object as `Tuple n Alpha`. -/
abbrev FinitePower (Size : Nat) (Alpha : Type u) := Tuple Size Alpha

end LRA.VolumeI.Set
