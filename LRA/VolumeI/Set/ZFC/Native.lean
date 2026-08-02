namespace LRA.VolumeI.Set.ZFC

universe u

/-!
Native Enderton/ZFC-style operation requirements.

This is single-sorted: elements and sets are both `SetObject`. Binary union is
not native here; it will be derived from pairing and union-over-a-set.
-/

/-- Native ZFC operation vocabulary closest to the axioms. -/
structure NativeSetOperations where
  SetObject : Type u
  member : SetObject → SetObject → Prop
  empty : SetObject
  pair : SetObject → SetObject → SetObject
  sUnion : SetObject → SetObject
  powerset : SetObject → SetObject
  foundation : WellFounded (fun left right => member left right)

/-- Native membership laws expected from an Enderton/ZFC implementation. -/
structure NativeSetOperationLaws (operations : NativeSetOperations) : Prop where
  emptyMembership :
    ∀ element, ¬ operations.member element operations.empty
  pairMembership :
    ∀ element left right,
      operations.member element (operations.pair left right) ↔
        element = left ∨ element = right
  sUnionMembership :
    ∀ element family,
      operations.member element (operations.sUnion family) ↔
        ∃ memberSet,
          operations.member memberSet family ∧
            operations.member element memberSet
  powersetMembership :
    ∀ element setObject,
      operations.member element (operations.powerset setObject) ↔
        ∀ candidate,
          operations.member candidate element →
            operations.member candidate setObject

end LRA.VolumeI.Set.ZFC
