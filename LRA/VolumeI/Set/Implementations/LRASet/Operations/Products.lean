import LRA.VolumeI.Set.Operations.Products
import LRA.VolumeI.Set.Implementations.LRASet.LRASet

namespace LRA.VolumeI.Set.Implementations.LRASet

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

end LRA.VolumeI.Set.Implementations.LRASet
