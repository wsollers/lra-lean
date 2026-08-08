import LRA.VolumeI.Set.Models
import LRA.VolumeI.Set.Implementations.MathlibSet.Public

universe u

namespace LRA.VolumeI.Set.Implementations.MathlibSet

/-!
Model-theory-facing interpretation of the public set language in mathlib sets.
-/

/-- Mathlib sets as a model of the public set language. -/
def setModel (Alpha : Type u) : LRA.VolumeI.Set.Models.Model where
  languageModel := publicOperations Alpha
  laws := by
    refine
      { (publicOperationLaws Alpha) with
        extensionality := ?_ }
    intro left right sameMembers
    exact Set.ext sameMembers

end LRA.VolumeI.Set.Implementations.MathlibSet
