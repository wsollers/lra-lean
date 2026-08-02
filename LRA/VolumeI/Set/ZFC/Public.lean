import LRA.VolumeI.Set.Operations.Public
import LRA.VolumeI.Set.ZFC.Derived

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Set.Operations

/-- Public operation roll-up for a ZFC-style backend. -/
def publicOperations (native : NativeSetOperations) : PublicSetOperations where
  SetObject := native.SetObject
  Element := native.SetObject
  member := native.member
  empty := native.empty
  singleton := native.singleton
  pair := native.pair
  union := native.union
  intersection := native.intersection
  subset := native.subset

/-- Native ZFC laws imply the public laws for implemented derived operations.

The intersection law is left as an obligation until separation/intersection is
added to the ZFC scaffold.
-/
theorem publicOperationLaws
    (native : NativeSetOperations)
    (nativeLaws : NativeSetOperationLaws native) :
    PublicSetOperationLaws (publicOperations native) := by
  constructor
  · exact nativeLaws.emptyMembership
  · intro element chosen
    dsimp [publicOperations, NativeSetOperations.singleton]
    constructor
    · intro elementInSingleton
      have elementInPair :=
        (nativeLaws.pairMembership element chosen chosen).mp elementInSingleton
      rcases elementInPair with elementIsChosen | elementIsChosen
      · exact elementIsChosen
      · exact elementIsChosen
    · intro elementIsChosen
      exact (nativeLaws.pairMembership element chosen chosen).mpr (Or.inl elementIsChosen)
  · exact nativeLaws.pairMembership
  · intro element left right
    dsimp [publicOperations, NativeSetOperations.union]
    constructor
    · intro elementInUnion
      have elementInSomeMember :=
        (nativeLaws.sUnionMembership element (native.pair left right)).mp elementInUnion
      rcases elementInSomeMember with ⟨memberSet, memberSetInPair, elementInMemberSet⟩
      have memberSetCases :=
        (nativeLaws.pairMembership memberSet left right).mp memberSetInPair
      rcases memberSetCases with memberSetIsLeft | memberSetIsRight
      · left
        simpa [memberSetIsLeft] using elementInMemberSet
      · right
        simpa [memberSetIsRight] using elementInMemberSet
    · intro elementInEither
      apply (nativeLaws.sUnionMembership element (native.pair left right)).mpr
      rcases elementInEither with elementInLeft | elementInRight
      · exact ⟨left, (nativeLaws.pairMembership left left right).mpr (Or.inl rfl), elementInLeft⟩
      · exact ⟨right, (nativeLaws.pairMembership right left right).mpr (Or.inr rfl), elementInRight⟩
  · sorry
  · intro left right
    rfl

end LRA.VolumeI.Set.ZFC
