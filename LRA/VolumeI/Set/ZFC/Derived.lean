import LRA.VolumeI.Set.ZFC.Native

namespace LRA.VolumeI.Set.ZFC

/-!
Derived Enderton/ZFC-style operations.
-/

namespace NativeSetOperations

/-- A singleton is the pair whose two entries are the same set-object. -/
def singleton (operations : NativeSetOperations) :
    operations.SetObject → operations.SetObject :=
  fun element => operations.pair element element

/-- Binary union is the union over the pair `{left, right}`. -/
def union (operations : NativeSetOperations) :
    operations.SetObject → operations.SetObject → operations.SetObject :=
  fun left right => operations.sUnion (operations.pair left right)

/-- Subset is defined by membership implication. -/
def subset (operations : NativeSetOperations) :
    operations.SetObject → operations.SetObject → Prop :=
  fun left right =>
    ∀ element,
      operations.member element left →
        operations.member element right

/-- Binary intersection by separation is not native in the current scaffold. -/
def intersection (operations : NativeSetOperations) :
    operations.SetObject → operations.SetObject → operations.SetObject :=
  fun _ _ => operations.empty

end NativeSetOperations

end LRA.VolumeI.Set.ZFC
